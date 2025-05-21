<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Update Profile - Movie Rental Platform</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .update-form {
      max-width: 500px;
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

<div class="update-form">
  <h2 class="text-center">Update Profile</h2>
  <form action="update" method="post">
    <input type="hidden" name="email" value="${user.email}">
    <div class="mb-3">
      <label for="username" class="form-label">Display Name</label>
      <input type="text" class="form-control" id="username" name="username" value="${user.username}" required>
    </div>
    <div class="mb-3">
      <label for="gender" class="form-label">Gender</label>
      <select class="form-control" id="gender" name="gender" required>
        <option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
        <option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
        <option value="Other" ${user.gender == 'Other' ? 'selected' : ''}>Other</option>
      </select>
    </div>
    <div class="mb-3">
      <label for="nicNumber" class="form-label">NIC Number</label>
      <input type="text" class="form-control" id="nicNumber" name="nicNumber" value="${user.nicNumber}" required>
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <input type="password" class="form-control" id="password" name="password" value="${user.password}" required>
    </div>
    <button type="submit" class="btn btn-primary w-100">Update</button>
    <a href="dashboard" class="btn btn-secondary w-100 mt-2">Back to Dashboard</a>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>