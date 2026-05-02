<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books - Library Management System</title>
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
            <h2>Books</h2>
            <a href="<c:url value='/books/new'/>" class="btn btn-success">+ Add New Book</a>
        </div>

        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">${successMessage}</div>
        </c:if>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>

        <c:choose>
            <c:when test="${empty books}">
                <p class="no-data">No books found. <a href="<c:url value='/books/new'/>">Create one now</a></p>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Genre</th>
                                <th>Price</th>
                                <th>Published Date</th>
                                <th>Author</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="book" items="${books}">
                                <tr>
                                    <td>${book.bookId}</td>
                                    <td>${book.title}</td>
                                    <td>${book.genre}</td>
                                    <td>$<fmt:formatNumber value="${book.price}" type="currency" currencySymbol=""/></td>
                                    <td><fmt:formatDate value="${book.publishedDate}" pattern="yyyy-MM-dd"/></td>
                                    <td>${book.author.name}</td>
                                    <td class="actions">
                                        <a href="<c:url value='/books/edit/${book.bookId}'/>" class="btn btn-small btn-info">Edit</a>
                                        <form method="POST" action="<c:url value='/books/delete/${book.bookId}'/>" style="display:inline;">
                                            <button type="submit" class="btn btn-small btn-danger" onclick="return confirm('Are you sure you want to delete this book?');">Delete</button>
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
