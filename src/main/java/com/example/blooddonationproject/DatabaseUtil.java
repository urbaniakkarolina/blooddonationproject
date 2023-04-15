package com.example.blooddonationproject;

import com.example.blooddonationproject.model.Facility;

import java.sql.*;
import java.util.List;

public abstract class DatabaseUtil {

    abstract List<Facility> getFacilitiesForQuery() throws SQLException;
    abstract List<Facility> getAllAvailableFacilities() throws SQLException;
    abstract List<Facility> searchForFacility(String searchTerm) throws SQLException;
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