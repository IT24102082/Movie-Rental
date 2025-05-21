package com.movierental.servlet;

import com.movierental.model.User;
import com.movierental.service.MovieService;
import com.movierental.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserService userService;
    private MovieService movieService;

    @Override
    public void init() throws ServletException {
        this.userService = new UserService(getServletContext());
        this.movieService = new MovieService(getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userService.getUserByEmail(email);
        if (user != null && user.getPassword().equals(password)) {
            // Store user in session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            // Set welcome message
            session.setAttribute("message", "Login successful! Welcome, " + user.getUsername() + "!");
            // Redirect to index.jsp instead of dashboard
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
    }
}