package com.qrattendance.dao;

import com.qrattendance.util.DBUtil;
import java.sql.*;
import java.io.PrintWriter;

public class AttendanceDAO {

    public static void markPresent(String studentId) throws SQLException {
        String sql = "INSERT INTO attendance (student_id, status) VALUES (?, 'Present')";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, studentId);
            stmt.executeUpdate();
        }
    }
    public static boolean hasMarkedToday(String studentId) throws SQLException {
    String sql = "SELECT * FROM attendance WHERE student_id = ? AND DATE(scan_time) = CURDATE()";

    try (Connection conn = DBUtil.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, studentId);
        ResultSet rs = stmt.executeQuery();

        return rs.next(); 
    }
}


   
    public static void exportMonthlyReport(int year, int month, PrintWriter out) throws SQLException {

        String sql = "SELECT student_id, scan_time, status FROM attendance "
                   + "WHERE YEAR(scan_time) = ? AND MONTH(scan_time) = ?";

        out.println("Student ID,Date Time,Status");

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, year);
            stmt.setInt(2, month);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String studentId = rs.getString("student_id");
                String time = rs.getString("scan_time");
                String status = rs.getString("status");

                out.println(studentId + "," + time + "," + status);
            }
        }
    }

    public static void markAttendance(String studentId) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
