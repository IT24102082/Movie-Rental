<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Ranishka.movierental.model.User" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">Movie Rental Platform</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="movies">Movies</a>
        </li>
      </ul>
      <div class="navbar-nav ms-auto">
        <%
          User user = (User) session.getAttribute("user");
          if (user != null) {
        %>
        <div class="dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
             data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fas fa-user user-icon"></i> <%= user.getUsername() %>
          </a>
          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
            <li class="dropdown-item-text">
              <strong>Email:</strong> <%= user.getEmail() %><br>
              <strong>Gender:</strong> <%= user.getGender() %><br>
              <strong>NIC:</strong> <%= user.getNicNumber() %>
            </li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="dashboard">Dashboard</a></li>
            <li><a class="dropdown-item" href="rentedMovies">Rented Movies</a></li>
            <li><a class="dropdown-item" href="update">Update Account</a></li>
            <li><a class="dropdown-item" href="delete">Delete Account</a></li>
            <li><a class="dropdown-item" href="logout">Logout</a></li>
          </ul>
        </div>
        <% } else { %>
        <a class="nav-link" href="login">Login</a>
        <a class="nav-link" href="register">Register</a>
        <% } %>
      </div>
    </div>
  </div>
</nav>