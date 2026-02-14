<%-- 
    Document   : studentForm
    Created on : 10 Sep 2025, 13:26:43
    Author     : Hloni
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal - University Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .university-header {
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
        }
        .login-card {
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            border: none;
            border-radius: 15px;
            transition: transform 0.3s ease;
        }
        .login-card:hover {
            transform: translateY(-5px);
        }
        .nav-tabs .nav-link.active {
            font-weight: 600;
            border-bottom: 3px solid #27ae60;
        }
        .btn-success {
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            border: none;
            transition: all 0.3s ease;
        }
        .btn-success:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(39, 174, 96, 0.3);
        }
        .feature-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
        }
        .info-card {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            border: none;
        }
        .student-guide {
            background: #f8f9fa;
            border-left: 4px solid #27ae60;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="university-header text-center">
        <div class="container">
            <h1><i class="fas fa-university me-3"></i>University Portal</h1>
            <p class="lead">Student Portal - Access Your Academic Information</p>
        </div>
    </div>

    <div class="container">
        <!-- Navigation Tabs -->
        <ul class="nav nav-tabs mb-4 justify-content-center">
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

        <div class="row">
            <!-- Main Login Card -->
            <div class="col-lg-6">
                <div class="card login-card">
                    <div class="card-header bg-success text-white text-center py-4">
                        <h4 class="mb-0"><i class="fas fa-graduation-cap me-2"></i>Student Login</h4>
                    </div>
                    <div class="card-body p-4">
                        <% String error = (String) request.getAttribute("error"); 
                           if (error != null) { %>
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-triangle me-2"></i><%= error %>
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        <% } %>
                        
                        <form method="post" action="<%=request.getContextPath()%>/student" id="studentForm">
                            <div class="mb-4">
                                <label for="studentId" class="form-label fw-bold">
                                    <i class="fas fa-id-card me-2"></i>Student ID
                                </label>
                                <input type="text" 
                                       class="form-control form-control-lg" 
                                       id="studentId" 
                                       name="studentId" 
                                       placeholder="Enter your 4-digit student ID"
                                       required
                                       pattern="[0-9]{4}"
                                       maxlength="4">
                                <div class="form-text">
                                    <i class="fas fa-info-circle me-1"></i>
                                    Enter your 4-digit student ID (e.g., 1001, 1002, etc.)
                                </div>
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success btn-lg py-3">
                                    <i class="fas fa-sign-in-alt me-2"></i>View My Schedule
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-center text-muted">
                        <small>
                            <i class="fas fa-shield-alt me-1"></i>
                            Your academic information is secure and private
                        </small>
                    </div>
                </div>
            </div>

            <!-- Information Sidebar -->
            <div class="col-lg-6">
                <!-- Quick Info Card -->
                <div class="card info-card mb-4">
                    <div class="card-body text-center">
                        <h5 class="card-title mb-3">
                            <i class="fas fa-info-circle me-2"></i>Quick Access
                        </h5>
                        <div class="row">
                            <div class="col-6 mb-3">
                                <div class="feature-icon">
                                    <i class="fas fa-calendar-alt fa-lg text-white"></i>
                                </div>
                                <h6>View Schedule</h6>
                                <small>Check your course timetable</small>
                            </div>
                            <div class="col-6 mb-3">
                                <div class="feature-icon">
                                    <i class="fas fa-book fa-lg text-white"></i>
                                </div>
                                <h6>Course Details</h6>
                                <small>See instructors & locations</small>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Student Guide -->
                <div class="card student-guide">
                    <div class="card-body">
                        <h6 class="card-title text-success mb-3">
                            <i class="fas fa-lightbulb me-2"></i>How to Use This Portal
                        </h6>
                        <div class="d-flex mb-2">
                            <span class="badge bg-success me-3">1</span>
                            <span>Enter your Student ID in the form</span>
                        </div>
                        <div class="d-flex mb-2">
                            <span class="badge bg-success me-3">2</span>
                            <span>Click "View My Schedule" to continue</span>
                        </div>
                        <div class="d-flex mb-2">
                            <span class="badge bg-success me-3">3</span>
                            <span>Review your course schedule and details</span>
                        </div>
                        <div class="d-flex">
                            <span class="badge bg-success me-3">4</span>
                            <span>Contact admin for any discrepancies</span>
                        </div>
                    </div>
                </div>

                <!-- Quick Student IDs -->
                <div class="card mt-4">
                    <div class="card-header bg-light">
                        <h6 class="mb-0">
                            <i class="fas fa-users me-2"></i>Sample Student IDs for Testing
                        </h6>
                    </div>
                    <div class="card-body">
                        <div class="row text-center">
                            <div class="col-4">
                                <span class="badge bg-primary">1001</span>
                                <small class="d-block text-muted">John Smith</small>
                            </div>
                            <div class="col-4">
                                <span class="badge bg-primary">1002</span>
                                <small class="d-block text-muted">Emily Johnson</small>
                            </div>
                            <div class="col-4">
                                <span class="badge bg-primary">1003</span>
                                <small class="d-block text-muted">Michael Williams</small>
                            </div>
                        </div>
                        <div class="row text-center mt-2">
                            <div class="col-4">
                                <span class="badge bg-primary">1004</span>
                                <small class="d-block text-muted">Sarah Brown</small>
                            </div>
                            <div class="col-4">
                                <span class="badge bg-primary">1005</span>
                                <small class="d-block text-muted">David Jones</small>
                            </div>
                            <div class="col-4">
                                <span class="badge bg-primary">1006</span>
                                <small class="d-block text-muted">Jennifer Garcia</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Features Section -->
        <div class="row mt-5">
            <div class="col-12 text-center mb-4">
                <h4 class="text-success">Student Portal Features</h4>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card h-100 text-center border-0">
                    <div class="card-body">
                        <i class="fas fa-clock fa-2x text-success mb-3"></i>
                        <h6>Real-time Schedule</h6>
                        <p class="small text-muted">Access your up-to-date course schedule anytime</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card h-100 text-center border-0">
                    <div class="card-body">
                        <i class="fas fa-chalkboard-teacher fa-2x text-success mb-3"></i>
                        <h6>Instructor Details</h6>
                        <p class="small text-muted">View course instructors and contact information</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card h-100 text-center border-0">
                    <div class="card-body">
                        <i class="fas fa-mobile-alt fa-2x text-success mb-3"></i>
                        <h6>Mobile Friendly</h6>
                        <p class="small text-muted">Access your schedule on any device</p>
                    </div>
                </div>
            </div>
        </div>
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
        // Form validation and enhancements
        document.addEventListener('DOMContentLoaded', function() {
            const studentForm = document.getElementById('studentForm');
            const studentIdInput = document.getElementById('studentId');

            // Real-time input validation
            studentIdInput.addEventListener('input', function() {
                this.value = this.value.replace(/[^0-9]/g, '');
                
                if (this.value.length === 4) {
                    this.classList.add('is-valid');
                    this.classList.remove('is-invalid');
                } else if (this.value.length > 0) {
                    this.classList.add('is-invalid');
                    this.classList.remove('is-valid');
                } else {
                    this.classList.remove('is-valid', 'is-invalid');
                }
            });

            // Form submission enhancement
            studentForm.addEventListener('submit', function(e) {
                if (studentIdInput.value.length !== 4) {
                    e.preventDefault();
                    studentIdInput.classList.add('is-invalid');
                    studentIdInput.focus();
                    
                    // Show custom alert
                    const alertDiv = document.createElement('div');
                    alertDiv.className = 'alert alert-warning alert-dismissible fade show mt-3';
                    alertDiv.innerHTML = `
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        Please enter a valid 4-digit Student ID.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    `;
                    studentForm.parentNode.insertBefore(alertDiv, studentForm.nextSibling);
                }
            });

            // Auto-focus on input
            studentIdInput.focus();
        });
    </script>
</body>
</html>