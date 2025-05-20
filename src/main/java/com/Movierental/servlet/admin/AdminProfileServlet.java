package com.Movierental.servlet.admin;

import com.google.gson.Gson;
import com.Movierental.dao.UserDAO;
import com.Movierental.model.AdminUser;
import com.Movierental.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServlet;

@WebServlet("/admin/profile")
public class AdminProfileServlet extends HttpServlet {
    private UserDAO userDAO;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        super.init();
        userDAO = UserDAO.getInstance();
        gson = new Gson();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (!(user instanceof AdminUser)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.setAttribute("admin", user);
        request.getRequestDispatcher("/WEB-INF/views/admin/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (!(user instanceof AdminUser)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        StringBuilder buffer = new StringBuilder();
        String line;
        while ((line = request.getReader().readLine()) != null) {
            buffer.append(line);
        }
        Map<String, String> requestData = gson.fromJson(buffer.toString(), Map.class);

        String fullName = requestData.get("fullName");
        String email = requestData.get("email");
        String currentPassword = requestData.get("currentPassword");
        String newPassword = requestData.get("newPassword");

        if (fullName != null && !fullName.trim().isEmpty()) {
            user.setFullName(fullName);
        }
        
        if (email != null && !email.trim().isEmpty()) {
            user.setEmail(email);
        }

        if (currentPassword != null && newPassword != null && 
            !currentPassword.trim().isEmpty() && !newPassword.trim().isEmpty()) {
            
            if (!userDAO.authenticate(user.getUsername(), currentPassword)) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Current password is incorrect");
                return;
            }
            
            user.setPassword(newPassword);
        }

        if (userDAO.updateUser(user)) {
            session.setAttribute("user", user);
            
            Map<String, Object> result = new HashMap<>();
            result.put("success", true);
            result.put("message", "Profile updated successfully");
            
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(gson.toJson(result));
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update profile");
        }
    }
} 