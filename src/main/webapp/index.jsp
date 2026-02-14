<%-- 
    Document   : index
    Created on : 10 Sep 2025, 13:24:21
    Author     : Hloni
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>University Portal - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #2c3e50, #3498db);
            color: white;
            padding: 5rem 0;
            text-align: center;
        }
        .feature-card {
            transition: transform 0.3s;
            border: none;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .feature-card:hover {
            transform: translateY(-5px);
        }
        .btn-lg {
            padding: 0.75rem 2rem;
            font-size: 1.1rem;
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <div class="hero-section">
        <div class="container">
            <h1 class="display-4 mb-4">
                <i class="fas fa-university me-3"></i>University Portal
            </h1>
            <p class="lead mb-4">Welcome to our comprehensive university management system</p>
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <p>Access course information, view schedules, and manage academic data through our secure portal.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Features Section -->
    <div class="container my-5">
        <div class="row g-4">
            <!-- Student Portal Card -->
            <div class="col-md-4">
                <div class="card feature-card h-100 border-success">
                    <div class="card-body text-center p-4">
                        <div class="text-success mb-3">
                            <i class="fas fa-graduation-cap fa-3x"></i>
                        </div>
                        <h4 class="card-title">Student Portal</h4>
                        <p class="card-text">View your personalized course schedule, check course details, and manage your academic calendar.</p>
                        <a href="<%=request.getContextPath()%>/student" class="btn btn-success btn-lg mt-3">
                            <i class="fas fa-sign-in-alt me-2"></i>Student Login
                        </a>
                    </div>
                </div>
            </div>

            <!-- Faculty Portal Card -->
            <div class="col-md-4">
                <div class="card feature-card h-100 border-primary">
                    <div class="card-body text-center p-4">
                        <div class="text-primary mb-3">
                            <i class="fas fa-chalkboard-teacher fa-3x"></i>
                        </div>
                        <h4 class="card-title">Faculty Portal</h4>
                        <p class="card-text">Update course information, manage schedules, and maintain academic records for your courses.</p>
                        <a href="<%=request.getContextPath()%>/faculty" class="btn btn-primary btn-lg mt-3">
                            <i class="fas fa-tasks me-2"></i>Faculty Access
                        </a>
                    </div>
                </div>
            </div>

            <!-- Course Catalog Card -->
            <div class="col-md-4">
                <div class="card feature-card h-100 border-info">
                    <div class="card-body text-center p-4">
                        <div class="text-info mb-3">
                            <i class="fas fa-book fa-3x"></i>
                        </div>
                        <h4 class="card-title">Course Catalog</h4>
                        <p class="card-text">Browse all available courses, view schedules, and check instructor information for the current semester.</p>
                        <a href="<%=request.getContextPath()%>/courses" class="btn btn-info btn-lg mt-3 text-white">
                            <i class="fas fa-list me-2"></i>View Courses
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Stats Section -->
    <div class="bg-light py-5">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-3">
                    <h3 class="text-primary">50+</h3>
                    <p class="text-muted">Courses Offered</p>
                </div>
                <div class="col-md-3">
                    <h3 class="text-success">34+</h3>
                    <p class="text-muted">Active Students</p>
                </div>
                <div class="col-md-3">
                    <h3 class="text-info">30+</h3>
                    <p class="text-muted">Faculty Members</p>
                </div>
                <div class="col-md-3">
                    <h3 class="text-warning">15+</h3>
                    <p class="text-muted">Academic Programs</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-4">
        <div class="container">
            <p class="mb-2">&copy; 2025 Hloni's University Portal. All rights reserved.</p>
            <p class="mb-0 text-muted">Secure • Reliable • User-Friendly</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>