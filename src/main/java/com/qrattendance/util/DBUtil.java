package com.qrattendance.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    private static final String URL = "jdbc:mysql://localhost:3306/qr_attendance";
    private static final String USER = "root";
    private static final String PASSWORD = "Rahul2205@";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
