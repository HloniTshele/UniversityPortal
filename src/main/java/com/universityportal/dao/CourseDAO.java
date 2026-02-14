/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.universityportal.dao;
import com.universityportal.models.Course;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hloni
 */
public class CourseDAO {

    public List<Course> getAllCourses() throws SQLException {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT course_id, course_code, course_name, instructor, schedule FROM Courses";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Course c = new Course(
                    rs.getInt("course_id"),
                    rs.getString("course_code"),
                    rs.getString("course_name"),
                    rs.getString("instructor"),
                    rs.getString("schedule")
                );
                list.add(c);
            }
        }
        return list;
    }

    public Course getCourseById(int id) throws SQLException {
        String sql = "SELECT course_id, course_code, course_name, instructor, schedule FROM Courses WHERE course_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Course(
                        rs.getInt("course_id"),
                        rs.getString("course_code"),
                        rs.getString("course_name"),
                        rs.getString("instructor"),
                        rs.getString("schedule")
                    );
                }
            }
        }
        return null;
    }

    public boolean updateCourse(Course c) throws SQLException {
        String sql = "UPDATE Courses SET instructor = ?, schedule = ? WHERE course_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, c.getInstructor());
            ps.setString(2, c.getSchedule());
            ps.setInt(3, c.getCourseId());
            int updated = ps.executeUpdate();
            return updated > 0;
        }
    }
}

