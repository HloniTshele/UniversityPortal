package com.universityportal.servlet;

import com.universityportal.dao.CourseDAO;
import com.universityportal.models.Course;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/faculty")
public class FacultyServlet extends HttpServlet {
    private CourseDAO courseDAO = new CourseDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Course> courses = courseDAO.getAllCourses();
            req.setAttribute("courses", courses);
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "Database unavailable: " + e.getMessage());
        }
        req.getRequestDispatcher("/WEB-INF/facultyForm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("courseId");
        String instructor = req.getParameter("instructor");
        String schedule = req.getParameter("schedule");

        if (idStr == null || idStr.isEmpty()) {
            req.setAttribute("error", "Course ID is required.");
            doGet(req, resp);
            return;
        }

        try {
            int courseId = Integer.parseInt(idStr);
            Course c = courseDAO.getCourseById(courseId);
            if (c == null) {
                req.setAttribute("error", "No course found with id " + courseId);
                doGet(req, resp);
                return;
            }
            c.setInstructor(instructor);
            c.setSchedule(schedule);
            boolean ok = courseDAO.updateCourse(c);
            req.setAttribute("message", ok ? "Course updated successfully!" : "No changes made.");
            
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Invalid course id.");
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "Database error: " + e.getMessage());
        }
        
        doGet(req, resp);
    }
}