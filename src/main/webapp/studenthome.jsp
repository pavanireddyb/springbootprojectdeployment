<%@ page import="com.klef.jfsd.springboot.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Student student = (Student) session.getAttribute("student");
if(student == null) {
    response.sendRedirect("studentsessionexpiry.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #1abc9c;
            --background-color: #f4f4f9;
            --text-color: #34495e;
            --white-color: #ffffff;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: var(--background-color);
            display: flex;
            height: 100vh;
            color: var(--text-color);
            line-height: 1.6;
        }

        /* Sidebar Styling */
        .sidebar {
            background-color: var(--primary-color);
            color: var(--white-color);
            width: 250px;
            height: 100%;
            padding: 30px 20px;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 2px 0px 5px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
        }

        .sidebar h2 {
            font-size: 1.5rem;
            text-align: center;
            margin-bottom: 20px;
            color: var(--white-color);
        }

        .sidebar a {
            display: flex;
            align-items: center;
            color: #ecf0f1;
            padding: 12px 20px;
            font-size: 16px;
            text-decoration: none;
            margin: 8px 0;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .sidebar a i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }

        .sidebar a:hover {
            background-color: #34495e;
            transform: translateX(5px);
            color: var(--secondary-color);
        }

        .sidebar a.active {
            background-color: var(--secondary-color);
            font-weight: bold;
            color: var(--white-color);
        }

        /* Main content styling */
        #content {
            margin-left: 270px;
            padding: 30px;
            flex-grow: 1;
            transition: margin-left 0.3s ease;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .welcome-container {
            background-color: var(--white-color);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .welcome-container h2 {
            font-size: 2rem;
            color: var(--secondary-color);
            margin-bottom: 20px;
        }

        .student-name {
            font-size: 1.5rem;
            color: var(--text-color);
            font-weight: bold;
        }

        .dashboard-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .stat-card {
            background-color: var(--white-color);
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            justify-content: space-between;
            transition: transform 0.3s ease;
        }

        .stat-card:hover {
            transform: scale(1.05);
        }

        .stat-card i {
            font-size: 2.5rem;
            color: var(--secondary-color);
        }

        .stat-card .stat-content {
            text-align: right;
        }

        .stat-card .stat-number {
            font-size: 1.8rem;
            font-weight: bold;
            color: var(--primary-color);
        }

        .stat-card .stat-label {
            font-size: 1rem;
            color: var(--text-color);
        }

        /* Mobile responsiveness */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
                padding: 20px;
                z-index: 1000;
            }

            #content {
                margin-left: 220px;
            }

            .sidebar a {
                font-size: 14px;
                padding: 10px 15px;
            }

            .welcome-container {
                padding: 20px;
            }

            .student-name {
                font-size: 1.2rem;
            }

            .dashboard-stats {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar Section -->
    <div class="sidebar">
        <h2>Student Dashboard</h2>
        <a href="studenthome" class="active"><i class="fas fa-home"></i>Home</a>
        <a href="studentprofile"><i class="fas fa-user"></i>Profile</a>
        <a href="updatestudent"><i class="fas fa-edit"></i>Update Profile</a>
        <a href="uploadproject"><i class="fas fa-upload"></i>Upload Project</a>
        <a href="viewprojects"><i class="fas fa-eye"></i>View Projects</a>
        
        <a href="addportfolio"><i class="fas fa-plus-circle"></i>Create Portfolio</a>
        <a href="updateportfolio?studentId=${student.id}"><i class="fas fa-pencil-alt"></i>Update Portfolio</a>
        <a href="viewportfolio?studentId=${student.id}"><i class="fas fa-file"></i>View Portfolio</a>
        <a href="studentlogout"><i class="fas fa-sign-out-alt"></i>Logout</a>
    </div>

    <!-- Main Content -->
    <div id="content">
        <div class="welcome-container">
            <h2>Welcome Back,</h2>
            <div class="student-name">
                <%= student.getName() %>
            </div>
        </div>

        <!-- Dashboard Stats -->
        <div class="dashboard-stats">
            <div class="stat-card">
                <i class="fas fa-project-diagram"></i>
                <div class="stat-content">
                    <div class="stat-number">3</div>
                    <div class="stat-label">Total Projects</div>
                </div>
            </div>
            <div class="stat-card">
                <i class="fas fa-check-circle"></i>
                <div class="stat-content">
                    <div class="stat-number">2</div>
                    <div class="stat-label">Completed Projects</div>
                </div>
            </div>
            <div class="stat-card">
                <i class="fas fa-comments"></i>
                <div class="stat-content">
                    <div class="stat-number">5</div>
                    <div class="stat-label">Feedback Received</div>
                </div>
            </div>
            <div class="stat-card">
                <i class="fas fa-trophy"></i>
                <div class="stat-content">
                    <div class="stat-number">1</div>
                    <div class="stat-label">Achievements</div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>