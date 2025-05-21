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

@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        this.userService = new UserService(getServletContext());// composition
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/forgotPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String nicNumber = request.getParameter("nicNumber");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "New password and confirm password do not match");
            request.getRequestDispatcher("/WEB-INF/views/forgotPassword.jsp").forward(request, response);
            return;
        }

        User user = userService.getUserByEmail(email);
        if (user != null && user.getNicNumber().equals(nicNumber)) {
            user.setPassword(newPassword);
            userService.updateUser(email, user);
            // Invalidate session if user is logged in
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("user") != null) {
                User sessionUser = (User) session.getAttribute("user");
                if (sessionUser.getEmail().equals(email)) {
                    session.invalidate();
                }
            }
            request.setAttribute("message", "Password reset successful. Please log in with your new password.");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Invalid email or NIC number");
            request.getRequestDispatcher("/WEB-INF/views/forgotPassword.jsp").forward(request, response);
        }
    }
}