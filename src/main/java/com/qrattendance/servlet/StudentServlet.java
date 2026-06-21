package com.qrattendance.servlet;

import com.qrattendance.dao.StudentDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/student")
public class StudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            String name = req.getParameter("name");
            String course = req.getParameter("course");
            String contact = req.getParameter("contact");
            String details = req.getParameter("details");

            
            String registerId = StudentDAO.generateRegisterId();

            StudentDAO.saveNewStudent(registerId, name, course, contact, details);

            req.setAttribute("msg", "Student Registered Successfully! Register ID: " + registerId);
            req.getRequestDispatcher("student_register.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("Error: " + e.getMessage());
        }
    }
}
