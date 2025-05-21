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

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
    private UserService userService;
    private MovieService movieService;

    @Override
    public void init() throws ServletException {
        this.userService = new UserService(getServletContext());
        this.movieService = new MovieService(getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user != null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("/WEB-INF/views/update.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Please log in to update your profile.");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user != null) {
            String email = user.getEmail();
            String username = request.getParameter("username");
            String gender = request.getParameter("gender");
            String nicNumber = request.getParameter("nicNumber");
            String password = request.getParameter("password");

            User updatedUser = new User(username, email, gender, nicNumber, password);
            userService.updateUser(email, updatedUser);

            // Update user in session
            session.setAttribute("user", updatedUser);
            response.sendRedirect("dashboard");
        } else {
            request.setAttribute("error", "Please log in to update your profile.");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
    }
}