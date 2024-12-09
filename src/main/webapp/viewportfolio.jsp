<%@ page import="com.klef.jfsd.springboot.model.Student" %>
<%@ page import="com.klef.jfsd.springboot.model.Portfolio" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Student student = (Student) session.getAttribute("student");
Portfolio portfolio = (Portfolio) request.getAttribute("portfolio");

if (student == null) {
    response.sendRedirect("studentsessionexpiry.jsp");
    return;
}

if (portfolio == null) {
    out.println("<h2>No portfolio found for the student.</h2>");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Portfolio</title>
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #1abc9c;
            --background-color: #f4f4f9;
            --text-color: #34495e;
            --white: #ffffff;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Arial', sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            line-height: 1.6;
            display: flex;
        }

        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: var(--primary-color);
            color: var(--white);
            position: fixed;
            top: 0;
            left: 0;
            padding: 20px;
            overflow-y: auto;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 22px;
            color: var(--white);
            border-bottom: 2px solid var(--secondary-color);
            padding-bottom: 10px;
        }

        .sidebar a {
            display: block;
            padding: 12px 15px;
            text-decoration: none;
            color: var(--white);
            font-size: 16px;
            margin-bottom: 10px;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        .sidebar a:hover, .sidebar a.active {
            background-color: var(--secondary-color);
            transform: translateX(5px);
        }

        .content {
            margin-left: 250px;
            padding: 40px;
            width: calc(100% - 250px);
            max-width: 1200px;
            background-color: var(--white);
            min-height: 100vh;
            box-shadow: -2px 0 5px rgba(0,0,0,0.1);
        }

        .section {
            background-color: var(--white);
            border-radius: 8px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .section:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
        }

        .section h3 {
            color: var(--secondary-color);
            margin-bottom: 15px;
            border-bottom: 2px solid var(--secondary-color);
            padding-bottom: 10px;
            font-size: 1.5em;
        }

        .list-item {
            background: #f8f9fa;
            margin: 15px 0;
            padding: 15px;
            border-radius: 6px;
            border-left: 4px solid var(--secondary-color);
            transition: all 0.3s ease;
        }

        .list-item:hover {
            background: #f1f3f5;
            transform: translateX(10px);
        }

        .list-item p {
            margin: 8px 0;
        }

        .list-item strong {
            color: var(--primary-color);
            margin-right: 10px;
        }

        a {
            color: var(--secondary-color);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        a:hover {
            color: var(--primary-color);
            text-decoration: underline;
        }

        .download-btn {
            display: inline-block;
            background-color: var(--secondary-color);
            color: var(--white);
            padding: 12px 25px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            margin-top: 20px;
            transition: all 0.3s ease;
        }

        .download-btn:hover {
            background-color: var(--primary-color);
            transform: scale(1.05);
        }

        @media (max-width: 768px) {
            body {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                height: auto;
                position: static;
            }

            .content {
                margin-left: 0;
                width: 100%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Student Dashboard</h2>
        <a href="studenthome">Home</a>
        <a href="studentprofile">Profile</a>
        <a href="updatestudent">Update Profile</a>
        <a href="uploadproject">Upload Project</a>
        <a href="viewprojects">View Projects</a>
        <a href="viewfeedback">View Feedback</a>
        <a href="addportfolio">Create Portfolio</a>
        <a href="updateportfolio?studentId=${student.id}">Update Portfolio</a>
        <a href="viewportfolio?studentId=${student.id}" class="active">View Portfolio</a>
        <a href="studentlogout">Logout</a>
    </div>

    <div class="content">
        <!-- Personal Information -->
        <div class="section">
            <h3>Personal Information</h3>
            <div class="list-item">
                <p><strong>Full Name:</strong> ${portfolio.personalInformation.fullName}</p>
                <p><strong>Date of Birth:</strong> ${portfolio.personalInformation.dateOfBirth}</p>
                <p><strong>Gender:</strong> ${portfolio.personalInformation.gender}</p>
                <p><strong>Contact Number:</strong> ${portfolio.personalInformation.contactNumber}</p>
                <p><strong>Email Address:</strong> ${portfolio.personalInformation.emailAddress}</p>
            </div>
        </div>

        <!-- Achievements -->
        <div class="section">
            <h3>Achievements</h3>
            <c:forEach items="${portfolio.achievements}" var="achievement">
                <div class="list-item">
                    <p><strong>Type:</strong> ${achievement.type}</p>
                    <p><strong>Title:</strong> ${achievement.title}</p>
                    <p><strong>Description:</strong> ${achievement.description}</p>
                </div>
            </c:forEach>
        </div>

        <!-- Articles -->
        <div class="section">
            <h3>Articles</h3>
            <c:forEach items="${portfolio.articles}" var="article">
                <div class="list-item">
                    <p><strong>Title:</strong> ${article.title}</p>
                    <p><strong>Publication Date:</strong> ${article.publicationDate}</p>
                    <p><strong>Link:</strong> <a href="${article.articleLink}" target="_blank">Read Article</a></p>
                </div>
            </c:forEach>
        </div>

        <!-- Skills -->
        <div class="section">
            <h3>Skills</h3>
            <c:forEach items="${portfolio.skills}" var="skill">
                <div class="list-item">
                    <p><strong>Type:</strong> ${skill.skillType}</p>
                    <p><strong>Name:</strong> ${skill.skillName}</p>
                    <p><strong>Proficiency Level:</strong> ${skill.proficiencyLevel}</p>
                </div>
            </c:forEach>
        </div>

        <!-- Projects -->
        <div class="section">
            <h3>Project Portfolio</h3>
            <c:forEach items="${portfolio.projectPortfolios}" var="project">
                <div class="list-item">
                    <p><strong>Title:</strong> ${project.title}</p>
                    <p><strong>Description:</strong> ${project.description}</p>
                    <p><strong>Technologies Used:</strong> ${project.technologiesUsed}</p>
                    <p><strong>Duration:</strong> ${project.duration}</p>
                    <p><strong>Link:</strong> <a href="${project.projectLink}" target="_blank">View Project</a></p>
                </div>
            </c:forEach>
        </div>

        <a href="/downloadportfolio?studentId=${portfolio.student.id}" class="download-btn">Download as PDF</a>
    </div>
</body>
</html>