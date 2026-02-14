<%-- 
    Document   : facultyForm
    Created on : 10 Sep 2025, 13:24:21
    Author     : Hloni
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.universityportal.models.Course" %>
<%
    List<Course> courses = (List<Course>) request.getAttribute("courses");
    String message = (String) request.getAttribute("message");
    String error = (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Portal - Update Courses</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .university-header {
            background: linear-gradient(135deg, #2c3e50, #3498db);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
        }
        .card {
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            border: none;
            margin-bottom: 1.5rem;
        }
        .card-header {
            background-color: #f8f9fa;
            font-weight: 600;
        }
        .table-hover tbody tr:hover {
            background-color: rgba(52, 152, 219, 0.1);
        }
        .nav-tabs .nav-link.active {
            font-weight: 600;
            border-bottom: 3px solid #3498db;
        }
        .alert {
            border: none;
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="university-header text-center">
        <div class="container">
            <h1><i class="fas fa-university me-3"></i>University Portal</h1>
            <p class="lead">Faculty Dashboard - Course Management</p>
        </div>
    </div>

    <div class="container">

        <ul class="nav nav-tabs mb-4">
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/">
                    <i class="fas fa-home me-1"></i>Home
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/courses">
                    <i class="fas fa-list me-1"></i>All Courses
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/student">
                    <i class="fas fa-graduation-cap me-1"></i>Student Portal
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="<%=request.getContextPath()%>/faculty">
                    <i class="fas fa-chalkboard-teacher me-1"></i>Faculty Portal
                </a>
            </li>
        </ul>

        <!-- Messages -->
        <% if (message != null) { %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="fas fa-check-circle me-2"></i><%= message %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } %>
        
        <% if (error != null) { %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="fas fa-exclamation-triangle me-2"></i><%= error %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } %>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="fas fa-edit me-2"></i>Update Course Information</h5>
                    </div>
                    <div class="card-body">
                        <form method="post" action="<%=request.getContextPath()%>/faculty" class="row g-3">
                            <div class="col-md-6">
                                <label for="courseId" class="form-label">Select Course</label>
                                <select class="form-select" id="courseId" name="courseId" required>
                                    <option value="">Choose a course...</option>
                                    <% if (courses != null) {
                                        for (Course c : courses) { %>
                                            <option value="<%= c.getCourseId() %>">
                                                <%= c.getCourseCode() %> - <%= c.getCourseName() %>
                                            </option>
                                    <%  }
                                    } %>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="instructor" class="form-label">Instructor</label>
                                <input type="text" class="form-control" id="instructor" name="instructor" required>
                            </div>
                            <div class="col-12">
                                <label for="schedule" class="form-label">Schedule</label>
                                <input type="text" class="form-control" id="schedule" name="schedule" 
                                       placeholder="e.g., Mon/Wed/Fri 10:00-11:30 AM" required>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-success">
                                    <i class="fas fa-save me-2"></i>Update Course
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Courses Table -->
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0"><i class="fas fa-list me-2"></i>All Courses</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>Course Code</th>
                                <th>Course Name</th>
                                <th>Instructor</th>
                                <th>Schedule</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (courses != null && !courses.isEmpty()) {
                                for (Course c : courses) { %>
                                    <tr>
                                        <td><strong><%= c.getCourseCode() %></strong></td>
                                        <td><%= c.getCourseName() %></td>
                                        <td><span class="badge bg-info"><%= c.getInstructor() %></span></td>
                                        <td><%= c.getSchedule() %></td>
                                    </tr>
                            <%  }
                            } else { %>
                                <tr>
                                    <td colspan="4" class="text-center text-muted py-4">
                                        <i class="fas fa-inbox fa-2x mb-2 d-block"></i>
                                        No courses found in the system.
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3 mt-5">
        <div class="container">
            <p class="mb-0">&copy; 2025 Hloni's University Portal. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('courseId').addEventListener('change', function() {
            const courseId = this.value;
            if (courseId) {
                document.getElementById('instructor').value = '';
                document.getElementById('schedule').value = '';
            }
        });
    </script>
</body>
</html>