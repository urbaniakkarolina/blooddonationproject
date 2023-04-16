package com.example.blooddonationproject;

import com.example.blooddonationproject.model.BasicBloodType;
import com.example.blooddonationproject.model.BloodBankStock;
import com.example.blooddonationproject.model.BloodType;
import com.example.blooddonationproject.model.Facility;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class DatabaseUtil {
    private String url;
    protected String name;
    protected String password;

    public DatabaseUtil(String url) {
        this.url = url;
    }

    public void setName(String name) {
        this.name = name;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public DatabaseUtil(String url, String name, String password) {
        this.url = url;
        this.name = name;
        this.password = password;
    }

    List<Facility> getFacilitiesForQuery(String query) throws SQLException {
        List<Facility> foundFacilities = new ArrayList<>();
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DriverManager.getConnection(url, name, password);
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                Facility facility = new Facility(
                        resultSet.getInt("id"),
                        resultSet.getString("rckik_name"),
                        resultSet.getString("address"),
                        resultSet.getString("post_code"),
                        resultSet.getString("city"),
                        resultSet.getString("phone_number"),
                        resultSet.getString("website"));
                foundFacilities.add(facility);
            }
        } finally {
            close(connection, statement, resultSet);
        }
        return foundFacilities;
    }

    List<Facility> getAllAvailableFacilities() throws SQLException {
        String availableFacilities = "select * from facilities;";

        return getFacilitiesForQuery(availableFacilities);
    }

    List<Facility> searchForFacility(String searchTerm) throws SQLException {
        String searchFacilityQuery = "select * from facilities where match(rckik_name, address, post_code, city, phone_number, website)"
                +
                " against('" + searchTerm + "' IN NATURAL LANGUAGE MODE);";

        return getFacilitiesForQuery(searchFacilityQuery);
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

    protected static void close(Connection conn, Statement statement, ResultSet resultSet) {
        try {
            if (resultSet != null)
                resultSet.close();

            if (statement != null)
                statement.close();

            if (conn != null)
                conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
