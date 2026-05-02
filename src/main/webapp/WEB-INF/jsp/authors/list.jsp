<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Authors - Library Management System</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <h1 class="nav-brand">📚 Library Management System</h1>
            <ul class="nav-menu">
                <li><a href="<c:url value='/'/>">Home</a></li>
                <li><a href="<c:url value='/authors'/>">Authors</a></li>
                <li><a href="<c:url value='/books'/>">Books</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="page-header">
            <h2>Authors</h2>
            <a href="<c:url value='/authors/new'/>" class="btn btn-success">+ Add New Author</a>
        </div>

        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">${successMessage}</div>
        </c:if>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>

        <c:choose>
            <c:when test="${empty authors}">
                <p class="no-data">No authors found. <a href="<c:url value='/authors/new'/>">Create one now</a></p>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Country</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="author" items="${authors}">
                                <tr>
                                    <td>${author.authorId}</td>
                                    <td>${author.name}</td>
                                    <td>${author.email}</td>
                                    <td>${author.country}</td>
                                    <td class="actions">
                                        <a href="<c:url value='/authors/edit/${author.authorId}'/>" class="btn btn-small btn-info">Edit</a>
                                        <form method="POST" action="<c:url value='/authors/delete/${author.authorId}'/>" style="display:inline;">
                                            <button type="submit" class="btn btn-small btn-danger" onclick="return confirm('Are you sure you want to delete this author? All associated books will be deleted.');">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <footer>
        <p>&copy; 2026 Library Management System. All rights reserved.</p>
    </footer>
</body>
</html>
