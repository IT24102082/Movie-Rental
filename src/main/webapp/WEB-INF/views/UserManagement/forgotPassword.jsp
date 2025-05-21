<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Forgot Password - Movie Rental Platform</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .forgot-password-form {
      max-width: 400px;
      margin: 50px auto;
      padding: 20px;
      background-color: white;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .navbar .user-icon {
      color: white;
      font-size: 1.5rem;
    }
  </style>
  <script>
    function validateForm() {
      var newPassword = document.getElementById("newPassword").value;
      var confirmPassword = document.getElementById("confirmPassword").value;
      if (newPassword !== confirmPassword) {
        alert("New password and confirm password do not match!");
        return false;
      }
      return true;
    }
  </script>
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

<div class="forgot-password-form">
  <h2 class="text-center">Forgot Password</h2>
  <% if (request.getAttribute("error") != null) { %>
  <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
  <% } %>
  <% if (request.getAttribute("message") != null) { %>
  <div class="alert alert-success"><%= request.getAttribute("message") %></div>
  <% } %>
  <form action="forgotPassword" method="post" onsubmit="return validateForm()">
    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <input type="email" class="form-control" id="email" name="email" required>
    </div>
    <div class="mb-3">
      <label for="nicNumber" class="form-label">NIC Number</label>
      <input type="text" class="form-control" id="nicNumber" name="nicNumber" required>
    </div>
    <div class="mb-3">
      <label for="newPassword" class="form-label">New Password</label>
      <input type="password" class="form-control" id="newPassword" name="newPassword" required>
    </div>
    <div class="mb-3">
      <label for="confirmPassword" class="form-label">Confirm New Password</label>
      <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
    </div>
    <button type="submit" class="btn btn-primary w-100">Reset Password</button>
    <a href="login" class="btn btn-link d-block text-center mt-2">Back to Login</a>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>