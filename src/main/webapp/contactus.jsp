<%@ page import="com.klef.jfsd.springboot.model.Mentor" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <style>
        /* General Body Styling */
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            color: #333;
        }

        /* Sidebar Styling */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            height: 100%;
            background-color: #2c3e50;
            padding-top: 30px;
            box-shadow: 4px 0 6px rgba(0, 0, 0, 0.1);
        }

        .sidebar a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 15px 20px;
            font-size: 18px;
            margin-bottom: 10px;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .sidebar a:hover {
            background-color: #34495e;
            transform: translateX(5px);
        }

        .sidebar a.active {
            background-color: #1abc9c;
            font-weight: bold;
        }

        /* Main Content Area */
        #content {
            margin-left: 270px;
            padding: 30px;
        }

        h3 {
            font-size: 32px;
            color: #2c3e50;
            border-bottom: 3px solid #1abc9c;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        /* Form Styling */
        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }

        form table {
            width: 100%;
            border-spacing: 10px;
        }

        form td {
            padding: 10px;
        }

        form label {
            font-size: 16px;
            color: #555;
        }

        form input[type="text"],
        form input[type="email"],
        form textarea {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        form input[type="submit"],
        form input[type="reset"] {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            background-color: #1abc9c;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        form input[type="submit"]:hover,
        form input[type="reset"]:hover {
            background-color: #16a085;
        }

        textarea {
            height: 100px;
            resize: none;
        }

        .button-container {
            text-align: center;
        }

        /* Media Queries */
        @media (max-width: 768px) {
            #content {
                margin-left: 0;
                padding: 20px;
            }

            h3 {
                font-size: 24px;
            }

            form label {
                font-size: 14px;
            }

            form input,
            form textarea {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
      <!-- Sidebar Section -->
    <div class="sidebar">
        <a href="/" class="active">Home</a>
        <a href="/about.jsp">About</a>
        <a href="/contactus.jsp">Contact Us</a>
        
        <a href="adminlogin">Admin Login</a>
        <a href="studentlogin">Student Login</a>
        <a href="mentorlogin">Mentor Login</a>
    </div>

    <!-- Main Content -->
    <div id="content">
        <div class="form-container">
            <h3>Contact Us</h3>
            <form method="post" action="sendemail">
                <table>
                    <tr>
                        <td><label for="name">Name</label></td>
                        <td><input type="text" id="name" name="name" required /></td>
                    </tr>
                    <tr>
                        <td><label for="email">Email ID</label></td>
                        <td><input type="email" id="email" name="email" required /></td>
                    </tr>
                    <tr>
                        <td><label for="subject">Subject</label></td>
                        <td><input type="text" id="subject" name="subject" required /></td>
                    </tr>
                    <tr>
                        <td><label for="message">Message</label></td>
                        <td><textarea id="message" name="message" required></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="button-container">
                            <input type="submit" value="Send" />
                            <input type="reset" value="Clear" />
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
