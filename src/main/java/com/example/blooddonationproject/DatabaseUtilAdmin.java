package com.example.blooddonationproject;

import com.example.blooddonationproject.model.Facility;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DatabaseUtilAdmin extends DatabaseUtil{
    private String url;
    private String name;
    private String password;

    public DatabaseUtilAdmin(String url) {
        this.url = url;
    }

    @Override
    List<Facility> getFacilitiesForQuery() throws SQLException {
        List<Facility> foundFacilities = new ArrayList<>();
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DriverManager.getConnection(url, name, password);
            String sql = "select * from facilities";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

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
        } finally {
            close(connection, statement, resultSet);
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

        return getFacilitiesForQuery();
    }

    public void addFacility(Facility facility) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DriverManager.getConnection(url, name, password);
            String sql = "insert into facilities(rckik_name,address,post_code,city,phone_number,website) values(?,?,?,?,?,?)";

            statement = connection.prepareStatement(sql);
            statement.setString(1, facility.getRckikName());
            statement.setString(2, facility.getAddress());
            statement.setString(3, facility.getPostCode());
            statement.setString(4, facility.getCity());
            statement.setString(5, facility.getPhoneNumber());
            statement.setString(6, facility.getWebsite());

            // wykonanie zapytania
            statement.execute();

        } finally {
            close(connection, statement, null);
        }
    }

    public Facility getFacility(String id) throws Exception {

        Facility facility = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // konwersja id na liczbe
            int facilityID = Integer.parseInt(id);
            connection = DriverManager.getConnection(url, name, password);
            String query = "select * from facilities where id=?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, facilityID);

            // wykonanie zapytania
            resultSet = statement.executeQuery();

            // przetworzenie wyniku zapytania
            if (resultSet.next()) {
                String rckikName = resultSet.getString("rckik_name");
                String address = resultSet.getString("address");
                String postCode = resultSet.getString("post_code");
                String city = resultSet.getString("city");
                String phoneNumber = resultSet.getString("phone_number");
                String website = resultSet.getString("website");

                // utworzenie obiektu
                facility = new Facility(facilityID, rckikName, address, postCode, city, phoneNumber, website);
            } else {
                throw new Exception("Could not find phone with id " + facilityID);
            }
            return facility;

        } finally {

            close(connection, statement, resultSet);
        }
    }

    public void deleteFacility(String id) throws SQLException {  // przyjmuje id
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // konwersja id na liczbe
            int facilityID = Integer.parseInt(id);
            // polaczenie z BD
            connection = DriverManager.getConnection(url, name, password);

            // zapytanie
            String query = "delete from facilities where id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, facilityID);
            statement.execute();

        } finally {
            // zamkniecie obiektow JDBC
            close(connection, statement, null);
        }

    }


    public void updateFacility(Facility facility) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;

        try {

            // polaczenie z BD
            connection = DriverManager.getConnection(url, name, password);

            // zapytanie
            String sql = "update facilities set rckik_name=?, address=?," +
                    "post_code=?, city=?, phone_number=?, website=? where id=?";

            statement = connection.prepareStatement(sql);
            statement.setString(1, facility.getRckikName());
            statement.setString(2, facility.getAddress());
            statement.setString(3, facility.getPostCode());
            statement.setString(4, facility.getCity());
            statement.setString(5, facility.getWebsite());
            statement.setString(6, String.valueOf(facility.getId()));
            statement.execute();

        } finally {
            // zamkniecie obiektow JDBC
            close(connection, statement, null);
        }
    }

    public boolean updateBloodBankStocks(int facilityId, int bloodTypeId, int newAmount) throws SQLException {
        Connection connection = DriverManager.getConnection(url, name, password);
        CallableStatement callStatement = connection.prepareCall("{? = CALL update_blood_bank(?, ?, ?)}");
        callStatement.registerOutParameter(1, Types.BOOLEAN);
        callStatement.setInt(2, facilityId);
        callStatement.setInt(3, bloodTypeId);
        callStatement.setInt(4, newAmount);

        callStatement.execute();
        boolean wasSuccessful = callStatement.getBoolean(1);
        connection.close();
        return wasSuccessful;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
