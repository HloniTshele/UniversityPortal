/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.universityportal.dao;
import com.universityportal.models.Course;
import com.universityportal.models.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Hloni
 */
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    public Student getStudentById(int studentId) throws SQLException {
        String sql = "SELECT student_id, first_name, last_name, email FROM Students WHERE student_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Student(
                        rs.getInt("student_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("email")
                    );
                }
            }
        }
        return null;
    }

    public List<Course> getCoursesByStudentId(int studentId) throws SQLException {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT c.course_id, c.course_code, c.course_name, c.instructor, c.schedule " +
                     "FROM Courses c JOIN StudentCourse sc ON c.course_id = sc.course_id " +
                     "WHERE sc.student_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            try (ResultSet rs = ps.executeQuery()) {
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
        }
        return list;
    }
}
