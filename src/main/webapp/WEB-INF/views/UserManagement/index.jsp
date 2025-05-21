<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Ranishka.movierental.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Movie Rental Platform - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .hero-section {
            background-image: url('https://images.unsplash.com/photo-1489599849927-2ee91c783981?q=80&w=1976&auto=format&fit=crop');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
        .hero-section h1 {
            font-size: 3.5rem;
            font-weight: bold;
        }
        .hero-section p {
            font-size: 1.5rem;
        }
        .btn-custom {
            margin: 10px;
            padding: 10px 30px;
            font-size: 1.2rem;
        }
        .navbar .user-icon {
            color: white;
            font-size: 1.5rem;
        }
    </style>
</head>
<body>
<%-- Include Navigation Bar --%>
<%@ include file="/WEB-INF/views/navbar.jsp" %>

<%-- Success Message --%>
<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
<div class="alert alert-success text-center" role="alert">
    <%= message %>
</div>
<% session.removeAttribute("message"); %>
<% } %>

<%-- Hero Section with Welcome Message --%>
<div class="hero-section">
    <div class="text-center">
        <% if (user != null) { %>
        <h1>Welcome, <%= user.getUsername() %>!</h1>
        <% } else { %>
        <h1>Welcome to Movie Rental Platform</h1>
        <% } %>
        <p>Rent, Watch, and Review Your Favorite Movies!</p>
        <div>
            <% if (user != null) { %>
            <a href="dashboard" class="btn btn-primary btn-custom">Go to Dashboard</a>
            <% } %>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>