package com.qrattendance.servlet;

import com.qrattendance.dao.AttendanceDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/mark-attendance")
public class AttendanceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String studentId = request.getParameter("studentId");

        if (studentId == null || studentId.isEmpty()) {
            response.getWriter().write("Error: studentId is missing");
            return;
        }

        try {
            
            if (AttendanceDAO.hasMarkedToday(studentId)) {
                response.getWriter().write(
                    "⚠️ Attendance already marked today for " + studentId
                );
                return;
            }

            
            AttendanceDAO.markPresent(studentId);
            response.getWriter().write("✔️ Attendance marked for " + studentId);

        } catch (Exception e) {
            response.getWriter().write("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
