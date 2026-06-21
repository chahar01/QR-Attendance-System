package com.qrattendance.servlet;

import com.qrattendance.dao.AttendanceDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/export-report")
public class ReportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String monthStr = request.getParameter("month");
        String yearStr = request.getParameter("year");

        if (monthStr == null || yearStr == null) {
            response.getWriter().write("Missing month or year");
            return;
        }

        int month = Integer.parseInt(monthStr);
        int year = Integer.parseInt(yearStr);

        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=attendance-report.csv");

        PrintWriter out = response.getWriter();

        try {
            AttendanceDAO.exportMonthlyReport(year, month, out);
        } catch (Exception e) {
            e.printStackTrace();
            out.write("Error exporting report: " + e.getMessage());
        }
    }
}
