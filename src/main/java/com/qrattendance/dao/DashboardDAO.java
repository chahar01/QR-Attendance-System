package com.qrattendance.dao;

import com.qrattendance.model.AttendanceRecord;
import com.qrattendance.util.DBUtil;
import java.sql.*;
import java.util.*;

public class DashboardDAO {

    public static int getTotalStudents() throws SQLException {
        String sql = "SELECT COUNT(*) FROM student_info";
        
        try (Connection conn = DBUtil.getConnection();
             Statement st = conn.createStatement()) {
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            return rs.getInt(1);
        }
    }

    public static int getPresentToday() throws SQLException {
        String sql = "SELECT COUNT(*) FROM attendance WHERE DATE(scan_time) = CURDATE()";
        try (Connection conn = DBUtil.getConnection();
             Statement st = conn.createStatement()) {
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            return rs.getInt(1);
        }
    }

    public static List<AttendanceRecord> getTodayAttendanceList() throws SQLException {
        List<AttendanceRecord> list = new ArrayList<>();
        String sql = "SELECT student_id, scan_time, status FROM attendance WHERE DATE(scan_time) = CURDATE()";
        try (Connection conn = DBUtil.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                list.add(
                    new AttendanceRecord(
                        rs.getString("student_id"),
                        rs.getString("scan_time"),
                        rs.getString("status")
                    )
                );
            }
        }
        return list;
    }
}
