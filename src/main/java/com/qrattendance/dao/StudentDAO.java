package com.qrattendance.dao;

import com.qrattendance.util.DBUtil;
import java.sql.*;

public class StudentDAO {

    public static String generateRegisterId() throws SQLException {
        String sql = "SELECT register_id FROM student_info ORDER BY register_id DESC LIMIT 1";

        try (Connection conn = DBUtil.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            if (rs.next()) {
                String lastId = rs.getString("register_id"); // STU0005
                int num = Integer.parseInt(lastId.substring(3));
                return String.format("STU%04d", num + 1);
            }
        }
        return "STU0001";
    }

    public static void saveNewStudent(String id, String name, String course,
                                      String contact, String details)
            throws SQLException {

        String sql = "INSERT INTO student_info (register_id, name, course, contact, details) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, course);
            ps.setString(4, contact);
            ps.setString(5, details);
            ps.executeUpdate();
        }
    }
}
