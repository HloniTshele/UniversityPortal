package com.universityportal.servlet;

import com.universityportal.dao.StudentDAO;
import com.universityportal.models.Course;
import com.universityportal.models.Student;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/student")
public class StudentServlet extends HttpServlet {
    private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/studentForm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sid = req.getParameter("studentId");
        
        if (sid == null || sid.trim().isEmpty()) {
            req.setAttribute("error", "Please enter a student ID.");
            req.getRequestDispatcher("/WEB-INF/studentForm.jsp").forward(req, resp);
            return;
        }
        
        try {
            int studentId = Integer.parseInt(sid.trim());
            Student student = studentDAO.getStudentById(studentId);
            
            if (student == null) {
                req.setAttribute("error", "Student not found for ID: " + studentId);
                req.getRequestDispatcher("/WEB-INF/studentForm.jsp").forward(req, resp);
                return;
            }
            
            List<Course> courses = studentDAO.getCoursesByStudentId(studentId);
            req.setAttribute("student", student);
            req.setAttribute("courses", courses);
            req.getRequestDispatcher("/WEB-INF/studentSchedule.jsp").forward(req, resp);
            
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Invalid student ID format.");
            req.getRequestDispatcher("/WEB-INF/studentForm.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "Database error: " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/studentForm.jsp").forward(req, resp);
        }
    }
}