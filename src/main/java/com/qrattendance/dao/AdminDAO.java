package com.qrattendance.dao;

import com.qrattendance.util.DBUtil;
import java.sql.*;

public class AdminDAO {

    public static boolean validate(String username, String password) throws SQLException {
        String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            return rs.next();  
        }
    }
}
