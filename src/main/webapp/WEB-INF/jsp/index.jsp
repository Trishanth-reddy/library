<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System</title>
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
        <div class="hero">
            <h2>Welcome to Library Management System</h2>
            <p>Manage your library's authors and books efficiently.</p>
            <div class="hero-buttons">
                <a href="<c:url value='/authors'/>" class="btn btn-primary">Manage Authors</a>
                <a href="<c:url value='/books'/>" class="btn btn-primary">Manage Books</a>
            </div>
        </div>

        <div class="features">
            <div class="feature-card">
                <h3>👥 Authors</h3>
                <p>Create, update, and manage author information. Each author can have multiple books.</p>
            </div>
            <div class="feature-card">
                <h3>📖 Books</h3>
                <p>Maintain a comprehensive book catalog with author associations and pricing information.</p>
            </div>
            <div class="feature-card">
                <h3>🔍 Easy Navigation</h3>
                <p>Simple and intuitive interface for managing your library inventory.</p>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 Library Management System. All rights reserved.</p>
    </footer>
</body>
</html>
