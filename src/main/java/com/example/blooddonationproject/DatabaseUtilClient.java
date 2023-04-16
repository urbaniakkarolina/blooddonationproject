package com.example.blooddonationproject;

import com.example.blooddonationproject.model.BasicBloodType;
import com.example.blooddonationproject.model.BloodBankStock;
import com.example.blooddonationproject.model.BloodType;
import com.example.blooddonationproject.model.Facility;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class DatabaseUtilClient extends DatabaseUtil{
    private String url;
    private final String name="root";
    private final String password="password";

    public DatabaseUtilClient(String url) {
        this.url = url;
    }

    @Override
    List<Facility> getFacilitiesForQuery() throws SQLException {
        Connection connection = DriverManager.getConnection(url, name, password);
        Statement statement = connection.createStatement();
        String sql = "select * from facilities";
        ResultSet resultSet = statement.executeQuery(sql);
        List<Facility> foundFacilities = new ArrayList<>();
        while (resultSet.next()) {
            Facility facility = new Facility(
                    resultSet.getInt("id"),
                    resultSet.getString("rckik_name"),
                    resultSet.getString("address"),
                    resultSet.getString("post_code"),
                    resultSet.getString("city"),
                    resultSet.getString("phone_number"),
                    resultSet.getString("website")
            );
            foundFacilities.add(facility);
        }
        return foundFacilities;
    }

    @Override
    List<Facility> getAllAvailableFacilities() throws SQLException {
        String availableFacilities = "select * from facilities;";

        return getFacilitiesForQuery();
    }

    @Override
    List<Facility> searchForFacility(String searchTerm) throws SQLException {
        String searchFacilityQuery = "select * from facilities where match(rckik_name, address, post_code, city, phone_number, website)" +
                " against('" + searchTerm + "' IN NATURAL LANGUAGE MODE);";

        Connection connection = DriverManager.getConnection(url, name, password);
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(searchFacilityQuery);
        List<Facility> foundFacilities = new ArrayList<>();
        while (resultSet.next()) {
            Facility facility = new Facility(
                    resultSet.getInt("id"),
                    resultSet.getString("rckik_name"),
                    resultSet.getString("address"),
                    resultSet.getString("post_code"),
                    resultSet.getString("city"),
                    resultSet.getString("phone_number"),
                    resultSet.getString("website")
            );
            foundFacilities.add(facility);
        }

        return foundFacilities;
    }

    List<BloodBankStock> getBloodBankStocks() throws SQLException {
        List<BloodBankStock> bloodBankStocks = new ArrayList<>();
        Connection connection = null;
        Statement statement = null;
        Statement bloodAmountStatement = null;
        ResultSet resultSet = null;
        ResultSet bloodAmountResultSet = null;
        try {
            connection = DriverManager.getConnection(url, name, password);
            statement = connection.createStatement();
            resultSet = statement.executeQuery("select * from facilities;");

            while (resultSet.next()) {
                Facility facility = new Facility(
                        resultSet.getInt("id"),
                        resultSet.getString("rckik_name"),
                        resultSet.getString("address"),
                        resultSet.getString("post_code"),
                        resultSet.getString("city"),
                        resultSet.getString("phone_number"),
                        resultSet.getString("website"));

                bloodAmountStatement = connection.createStatement();
                bloodAmountResultSet = bloodAmountStatement
                        .executeQuery("select * from blood_bank_stocks where facility_id=" + facility.getId() + ";");

                HashMap<String, BloodType> bloodTypes = new HashMap<>();
                while (bloodAmountResultSet.next()) {
                    BloodType bloodType = new BloodType(
                            bloodAmountResultSet.getInt("blood_id"),
                            // not sure if this will work, have to check
                            BasicBloodType.valueOf(bloodAmountResultSet.getString("blood_type")),
                            bloodAmountResultSet.getString("rHD"),
                            bloodAmountResultSet.getInt("amount_of_blood"));
                    bloodTypes.put(bloodType.getBloodType(), bloodType);
                }

                BloodBankStock bloodBankStock = new BloodBankStock(facility, bloodTypes);
                bloodBankStocks.add(bloodBankStock);
            }
        } finally {
            close(connection, statement, resultSet);
        }
        return bloodBankStocks;
    }
}
