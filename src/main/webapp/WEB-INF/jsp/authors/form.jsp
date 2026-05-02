<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Author Form - Library Management System</title>
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
                <c:when test="${author.authorId == null}">Add New Author</c:when>
                <c:otherwise>Edit Author</c:otherwise>
            </c:choose></h2>

            <form:form method="post" action="/authors/save" modelAttribute="author" class="form">
                <c:if test="${author.authorId != null}">
                    <form:hidden path="authorId"/>
                </c:if>

                <div class="form-group">
                    <label for="name">Name <span class="required">*</span></label>
                    <form:input path="name" id="name" class="form-control" placeholder="Enter author name"/>
                    <form:errors path="name" class="error-message"/>
                </div>

                <div class="form-group">
                    <label for="email">Email <span class="required">*</span></label>
                    <form:input path="email" id="email" type="email" class="form-control" placeholder="Enter author email"/>
                    <form:errors path="email" class="error-message"/>
                </div>

                <div class="form-group">
                    <label for="country">Country</label>
                    <form:input path="country" id="country" class="form-control" placeholder="Enter author country"/>
                    <form:errors path="country" class="error-message"/>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Save Author</button>
                    <a href="<c:url value='/authors'/>" class="btn btn-secondary">Cancel</a>
                </div>
            </form:form>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 Library Management System. All rights reserved.</p>
    </footer>
</body>
</html>
