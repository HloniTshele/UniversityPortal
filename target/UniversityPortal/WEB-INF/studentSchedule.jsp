<%-- 
    Document   : studentSchedule
    Created on : 10 Sep 2025, 13:27:48
    Author     : Hloni
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.universityportal.models.Course, com.universityportal.models.Student" %>
<%
    Student student = (Student) request.getAttribute("student");
    List<Course> courses = (List<Course>) request.getAttribute("courses");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= student != null ? student.getFirstName() : "Student" %>'s Schedule - University Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .university-header {
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
        }
        .student-info-card {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            border: none;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .schedule-card {
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            border: none;
            border-radius: 10px;
        }
        .table-hover tbody tr:hover {
            background-color: rgba(52, 152, 219, 0.1);
            transform: scale(1.01);
            transition: all 0.2s ease;
        }
        .nav-tabs .nav-link.active {
            font-weight: 600;
            border-bottom: 3px solid #27ae60;
        }
        .course-badge {
            font-size: 0.85em;
            padding: 0.5em 0.8em;
        }
        .stats-box {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            padding: 1rem;
            text-align: center;
        }
        .action-btn {
            transition: all 0.3s ease;
        }
        .action-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .empty-state {
            padding: 3rem 1rem;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="university-header text-center">
        <div class="container">
            <a href="<%=request.getContextPath()%>/" class="text-white text-decoration-none">
                <h1><i class="fas fa-university me-3"></i>University Portal</h1>
            </a>
            <p class="lead">Student Academic Schedule</p>
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
                <a class="nav-link" href="<%=request.getContextPath()%>/courses">
                    <i class="fas fa-list me-1"></i>All Courses
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="<%=request.getContextPath()%>/student">
                    <i class="fas fa-graduation-cap me-1"></i>Student Portal
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/faculty">
                    <i class="fas fa-chalkboard-teacher me-1"></i>Faculty Portal
                </a>
            </li>
        </ul>

        <!-- Student Information Card -->
        <% if (student != null) { %>
            <div class="card student-info-card mb-4">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-md-8">
                            <div class="d-flex align-items-center mb-3">
                                <div class="bg-white rounded-circle p-3 me-3">
                                    <i class="fas fa-user-graduate fa-2x text-primary"></i>
                                </div>
                                <div>
                                    <h3 class="card-title mb-1">
                                        <%= student.getFirstName() %> <%= student.getLastName() %>
                                    </h3>
                                    <p class="card-text mb-0">
                                        <i class="fas fa-id-card me-2"></i>Student ID: <strong><%= student.getStudentId() %></strong>
                                    </p>
                                </div>
                            </div>
                            <p class="card-text mb-0">
                                <i class="fas fa-envelope me-2"></i>Email: <%= student.getEmail() %>
                            </p>
                        </div>
                        <div class="col-md-4">
                            <div class="row text-center">
                                <div class="col-6">
                                    <div class="stats-box">
                                        <h4 class="mb-1"><%= courses != null ? courses.size() : 0 %></h4>
                                        <small>Enrolled Courses</small>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="stats-box">
                                        <h4 class="mb-1">Active</h4>
                                        <small>Status</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <% } %>

        <!-- Schedule Card -->
        <div class="card schedule-card">
            <div class="card-header bg-success text-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0">
                    <i class="fas fa-calendar-alt me-2"></i>My Course Schedule
                    <% if (courses != null && !courses.isEmpty()) { %>
                        <span class="badge bg-light text-success ms-2"><%= courses.size() %> courses</span>
                    <% } %>
                </h5>
                <div>
                    <span class="badge bg-light text-dark">
                        <i class="fas fa-sync-alt me-1"></i>Current Semester
                    </span>
                </div>
            </div>
            <div class="card-body">
                <% if (courses != null && !courses.isEmpty()) { %>
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th width="15%">
                                        <i class="fas fa-code me-1"></i>Course Code
                                    </th>
                                    <th width="35%">
                                        <i class="fas fa-book me-1"></i>Course Name
                                    </th>
                                    <th width="25%">
                                        <i class="fas fa-chalkboard-teacher me-1"></i>Instructor
                                    </th>
                                    <th width="25%">
                                        <i class="fas fa-clock me-1"></i>Schedule
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Course c : courses) { %>
                                    <tr class="position-relative">
                                        <td>
                                            <span class="badge bg-primary course-badge">
                                                <i class="fas fa-bookmark me-1"></i>
                                                <%= c.getCourseCode() %>
                                            </span>
                                        </td>
                                        <td>
                                            <strong class="text-dark"><%= c.getCourseName() %></strong>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="bg-info rounded-circle p-2 me-2">
                                                    <i class="fas fa-user text-white small"></i>
                                                </div>
                                                <span class="text-muted"><%= c.getInstructor() %></span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-calendar text-success me-2"></i>
                                                <span class="text-dark"><%= c.getSchedule() %></span>
                                            </div>
                                        </td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>

                    <!-- Schedule Summary -->
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <div class="alert alert-info mb-0">
                                <h6 class="alert-heading">
                                    <i class="fas fa-info-circle me-2"></i>Schedule Summary
                                </h6>
                                <p class="mb-0">You are enrolled in <strong><%= courses.size() %> courses</strong> for the current semester.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="alert alert-warning mb-0">
                                <h6 class="alert-heading">
                                    <i class="fas fa-bell me-2"></i>Important Notice
                                </h6>
                                <p class="mb-0">Please verify your schedule and report any discrepancies to the academic office.</p>
                            </div>
                        </div>
                    </div>
                <% } else { %>
                    <div class="text-center empty-state">
                        <div class="mb-4">
                            <i class="fas fa-calendar-times fa-4x text-muted"></i>
                        </div>
                        <h4 class="text-muted mb-3">No Courses Enrolled</h4>
                        <p class="text-muted mb-4">You are not currently enrolled in any courses for this semester.</p>
                        <div class="d-flex justify-content-center gap-3">
                            <a href="<%=request.getContextPath()%>/courses" class="btn btn-primary action-btn">
                                <i class="fas fa-book me-2"></i>Browse Available Courses
                            </a>
                            <a href="<%=request.getContextPath()%>/student" class="btn btn-outline-secondary action-btn">
                                <i class="fas fa-redo me-2"></i>Check Another Student
                            </a>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>

        <!-- Action Buttons -->
        <% if (courses != null && !courses.isEmpty()) { %>
            <div class="d-flex justify-content-center gap-3 mt-4">
                <a href="<%=request.getContextPath()%>/student" class="btn btn-outline-primary action-btn">
                    <i class="fas fa-redo me-2"></i>Check Another Student
                </a>
                <a href="<%=request.getContextPath()%>/courses" class="btn btn-primary action-btn">
                    <i class="fas fa-list me-2"></i>View All Courses
                </a>
                <a href="<%=request.getContextPath()%>/" class="btn btn-success action-btn">
                    <i class="fas fa-home me-2"></i>Back to Home
                </a>
                <button class="btn btn-outline-dark action-btn" onclick="window.print()">
                    <i class="fas fa-print me-2"></i>Print Schedule
                </button>
            </div>
        <% } %>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-4 mt-5">
        <div class="container">
            <div class="row">
                <div class="col-md-6 mb-3 mb-md-0">
                    <h6>University Portal</h6>
                    <p class="mb-0 small">Managing academic excellence since 2025</p>
                </div>
                <div class="col-md-6">
                    <h6>Quick Links</h6>
                    <div class="d-flex justify-content-center gap-3">
                        <a href="<%=request.getContextPath()%>/" class="text-white text-decoration-none small">Home</a>
                        <a href="<%=request.getContextPath()%>/courses" class="text-white text-decoration-none small">All Courses</a>
                        <a href="<%=request.getContextPath()%>/student" class="text-white text-decoration-none small">Student Portal</a>
                        <a href="<%=request.getContextPath()%>/faculty" class="text-white text-decoration-none small">Faculty Portal</a>
                    </div>
                </div>
            </div>
            <hr class="my-3">
            <p class="mb-0 small">&copy; 2025 University Portal. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Add some interactive features
        document.addEventListener('DOMContentLoaded', function() {
            // Add click effect on table rows
            const tableRows = document.querySelectorAll('tbody tr');
            tableRows.forEach(row => {
                row.addEventListener('click', function() {
                    this.style.backgroundColor = '#e8f4fd';
                    setTimeout(() => {
                        this.style.backgroundColor = '';
                    }, 300);
                });
            });

            // Print schedule functionality
            const printBtn = document.querySelector('button[onclick="window.print()"]');
            if (printBtn) {
                printBtn.addEventListener('click', function() {
                    // Add a small delay to ensure the print dialog shows properly
                    setTimeout(() => {
                        console.log('Printing schedule...');
                    }, 100);
                });
            }
        });
    </script>
</body>
</html>