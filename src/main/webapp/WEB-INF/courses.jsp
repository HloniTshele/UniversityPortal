<%-- 
    Document   : courses
    Created on : 10 Sep 2025, 13:24:21
    Author     : Hloni
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.universityportal.models.Course" %>
<%
    List<Course> courses = (List<Course>) request.getAttribute("courses");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Courses - University Portal</title>
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
            transition: transform 0.2s;
        }
        .card:hover {
            transform: translateY(-2px);
        }
        .table-hover tbody tr:hover {
            background-color: rgba(52, 152, 219, 0.1);
        }
        .nav-tabs .nav-link.active {
            font-weight: 600;
            border-bottom: 3px solid #3498db;
        }
        .stats-card {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="university-header text-center">
        <div class="container">
            <h1><i class="fas fa-university me-3"></i>University Portal</h1>
            <p class="lead">Browse All Available Courses</p>
        </div>
    </div>

    <div class="container">
        <!-- Navigation Tabs -->
        <ul class="nav nav-tabs mb-4">
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/">
                    <i class="fas fa-home me-1"></i>Home
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="<%=request.getContextPath()%>/courses">
                    <i class="fas fa-list me-1"></i>All Courses
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/student">
                    <i class="fas fa-graduation-cap me-1"></i>Student Portal
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/faculty">
                    <i class="fas fa-chalkboard-teacher me-1"></i>Faculty Portal
                </a>
            </li>
        </ul>

        <!-- Statistics Cards -->
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="card stats-card text-center">
                    <div class="card-body">
                        <i class="fas fa-book fa-3x mb-3"></i>
                        <h3><%= courses != null ? courses.size() : 0 %></h3>
                        <p class="mb-0">Total Courses</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card bg-success text-white text-center">
                    <div class="card-body">
                        <i class="fas fa-chalkboard-teacher fa-3x mb-3"></i>
                        <h3>
                            <% if (courses != null) { 
                                long instructors = courses.stream().map(c -> c.getInstructor()).distinct().count();
                            %>
                                <%= instructors %>
                            <% } else { %>
                                0
                            <% } %>
                        </h3>
                        <p class="mb-0">Active Instructors</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card bg-warning text-dark text-center">
                    <div class="card-body">
                        <i class="fas fa-calendar-alt fa-3x mb-3"></i>
                        <h3>Multiple</h3>
                        <p class="mb-0">Schedule Options</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Courses Table -->
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0"><i class="fas fa-list me-2"></i>Course Catalog</h5>
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
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (courses != null && !courses.isEmpty()) {
                                for (Course c : courses) { %>
                                    <tr>
                                        <td><strong class="text-primary"><%= c.getCourseCode() %></strong></td>
                                        <td><%= c.getCourseName() %></td>
                                        <td>
                                            <span class="badge bg-info text-dark">
                                                <i class="fas fa-user me-1"></i><%= c.getInstructor() %>
                                            </span>
                                        </td>
                                        <td><span class="text-muted"><%= c.getSchedule() %></span></td>
                                        <td><span class="badge bg-success">Active</span></td>
                                    </tr>
                            <%  }
                            } else { %>
                                <tr>
                                    <td colspan="5" class="text-center text-muted py-4">
                                        <i class="fas fa-inbox fa-2x mb-2 d-block"></i>
                                        No courses available at the moment.
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
</body>
</html>