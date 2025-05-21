<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Movie Rental Platform</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/login.css">
</head>
<body>
<%-- Include Navigation Bar --%>
<%@ include file="/WEB-INF/views/navbar.jsp" %>

<%-- Success or Error Message --%>
<c:if test="${not empty message}">
    <div class="alert alert-success text-center" role="alert">
            ${message}
    </div>
</c:if>
<c:if test="${not empty error}">
    <div class="alert alert-danger text-center" role="alert">
            ${error}
    </div>
</c:if>

<div class="login-form">
    <h2>Login</h2>
    <form action="login" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Login</button>
        <a href="register" class="btn btn-link d-block text-center mt-2">Register</a>
        <a href="forgotPassword" class="btn btn-link d-block text-center mt-2">Forgot Password?</a>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>