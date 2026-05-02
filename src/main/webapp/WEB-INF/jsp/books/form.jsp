<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Form - Library Management System</title>
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
        <div class="form-container">
            <h2><c:choose>
                <c:when test="${book.bookId == null}">Add New Book</c:when>
                <c:otherwise>Edit Book</c:otherwise>
            </c:choose></h2>

            <form:form method="post" action="/books/save" modelAttribute="book" class="form">
                <c:if test="${book.bookId != null}">
                    <form:hidden path="bookId"/>
                </c:if>

                <div class="form-group">
                    <label for="title">Title <span class="required">*</span></label>
                    <form:input path="title" id="title" class="form-control" placeholder="Enter book title"/>
                    <form:errors path="title" class="error-message"/>
                </div>

                <div class="form-group">
                    <label for="genre">Genre</label>
                    <form:input path="genre" id="genre" class="form-control" placeholder="Enter book genre"/>
                    <form:errors path="genre" class="error-message"/>
                </div>

                <div class="form-group">
                    <label for="price">Price <span class="required">*</span></label>
                    <form:input path="price" id="price" type="number" step="0.01" class="form-control" placeholder="Enter book price"/>
                    <form:errors path="price" class="error-message"/>
                </div>

                <div class="form-group">
                    <label for="publishedDate">Published Date <span class="required">*</span></label>
                    <form:input path="publishedDate" id="publishedDate" type="date" class="form-control"/>
                    <form:errors path="publishedDate" class="error-message"/>
                </div>

                <div class="form-group">
                    <label for="author">Author <span class="required">*</span></label>
                    <form:select path="author.authorId" id="author" class="form-control">
                        <option value="">-- Select Author --</option>
                        <c:forEach var="author" items="${authors}">
                            <option value="${author.authorId}" <c:if test="${book.author.authorId == author.authorId}">selected</c:if>>${author.name}</option>
                        </c:forEach>
                    </form:select>
                    <form:errors path="author" class="error-message"/>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Save Book</button>
                    <a href="<c:url value='/books'/>" class="btn btn-secondary">Cancel</a>
                </div>
            </form:form>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 Library Management System. All rights reserved.</p>
    </footer>
</body>
</html>
