package com.universityportal.servlet;

import com.universityportal.dao.CourseDAO;
import com.universityportal.models.Course;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/courses")
public class CourseServlet extends HttpServlet {
    private CourseDAO courseDAO = new CourseDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Course> courses = courseDAO.getAllCourses();
            req.setAttribute("courses", courses);
        } catch (SQLException e) {
            e.printStackTrace();
            // Fallback to sample data if database fails
            List<Course> courses = new ArrayList<>();
            courses.add(new Course(1, "CS101", "Introduction to Programming", "Dr. Smith", "Mon/Wed 10:00-11:30"));
            courses.add(new Course(2, "MATH201", "Calculus I", "Prof. Johnson", "Tue/Thu 09:00-10:30"));
            courses.add(new Course(3, "ENG101", "English Composition", "Dr. Williams", "Mon/Wed/Fri 13:00-14:00"));
            req.setAttribute("courses", courses);
            req.setAttribute("error", "Database temporarily unavailable. Showing sample data.");
        }
        
        req.getRequestDispatcher("/WEB-INF/courses.jsp").forward(req, resp);
    }
}