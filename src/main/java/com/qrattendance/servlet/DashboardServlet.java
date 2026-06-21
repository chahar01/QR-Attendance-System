package com.qrattendance.servlet;

import com.qrattendance.dao.DashboardDAO;
import com.qrattendance.model.AttendanceRecord;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        try {
            int total = DashboardDAO.getTotalStudents();
            int present = DashboardDAO.getPresentToday();
            int absent = total - present;

            List<AttendanceRecord> list = DashboardDAO.getTodayAttendanceList();

            req.setAttribute("totalStudents", total);
            req.setAttribute("presentToday", present);
            req.setAttribute("absentToday", absent);
            req.setAttribute("attendanceList", list);

            req.getRequestDispatcher("dashboard.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("Error: " + e.getMessage());
        }
    }
}
