package com.movierental.servlet;

import com.movierental.model.User;
import com.movierental.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        this.userService = new UserService(getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username"); // Display name
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String nicNumber = request.getParameter("nicNumber");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Server-side validation for confirm password
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match");
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
            return;
        }

        User user = new User(username, email, gender, nicNumber, password);
        if (userService.getUserByEmail(email) == null) {
            try {
                userService.createUser(user);
                // Set success message
                HttpSession session = request.getSession();
                session.setAttribute("message", "Registration successful! Log into your account");
                // Redirect to login page
                response.sendRedirect("login");
            } catch (IOException e) {
                System.err.println("Error saving user during registration: " + e.getMessage());
                request.setAttribute("error", "Registration failed due to a server error. Please try again.");
                request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Email already exists");
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response); // Fixed path
        }
    }
}