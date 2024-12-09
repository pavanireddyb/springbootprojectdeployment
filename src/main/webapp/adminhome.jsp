<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home</title>
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
            padding-top: 30px;
            position: fixed;
            left: 0;
            top: 0;
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

        /* Welcome section styling */
        .student-info {
            background-color: var(--white-color);
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        .student-info h2 {
            font-size: 2rem;
            color: #2ecc71;
        }

        .student-info h3 {
            font-size: 1.5rem;
            color: #34495e;
        }

        .count {
            font-size: 2rem;
            color: #2ecc71;
            margin-top: 15px;
            padding: 15px;
            background-color: #ecf8f2;
            border-radius: 5px;
            text-align: center;
        }

        /* Responsive Design for Mobile */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
                padding: 20px;
            }

            #content {
                margin-left: 220px;
            }

            .student-info {
                padding: 20px;
            }

            .sidebar a {
                font-size: 14px;
                padding: 10px 18px;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar Section -->
    <div class="sidebar">
        <h2>Admin Dashboard</h2>
        <a href="adminhome" class="active"><i class="bx bx-home"></i> Home</a>
        <a href="addstudent">Add Student</a>
        <a href="viewallstudents">View Students</a>
        <a href="deletestudent">Delete Student</a>
        <a href="mentorreg">Mentor Registration</a>
        <a href="viewallmentors">View All Mentors</a>
        <a href="deletementor">Delete Mentor</a>
        <a href="adminlogout">Logout</a>
    </div>

    <!-- Main Content Section -->
    <div id="content">
        <div class="student-info">
            <h2>Welcome to Admin Home</h2>
            <h3>Total Mentors</h3>
            <div class="count">
                <c:out value="${count}" />
            </div>
        </div>
    </div>

</body>
</html>
