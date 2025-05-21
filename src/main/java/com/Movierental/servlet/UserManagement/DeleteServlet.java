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

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        this.userService = new UserService(getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user != null) {
            String email = user.getEmail();
            userService.deleteUser(email);
            session.invalidate(); // Log out the user
            response.sendRedirect("login");
        } else {
            request.setAttribute("error", "Please log in to delete your account.");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
    }
}