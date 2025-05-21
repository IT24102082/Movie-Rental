<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.gson.JsonObject" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | CineVerse</title>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;600;700&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #E50914;
            --primary-dark: #B00710;
            --dark: #141414;
            --light: #F5F5F1;
            --accent: #FF9F1C;
            --border-radius: 4px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        body {
            background-color: var(--dark);
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 2rem;
            background-image: linear-gradient(rgba(20, 20, 20, 0.7), rgba(20, 20, 20, 0.7)),
                            url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            color: var(--light);
        }

        .form-container {
            background: rgba(20, 20, 20, 0.9);
            padding: 2.5rem 2rem;
            border-radius: var(--border-radius);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 400px;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            color: var(--primary);
            font-weight: 700;
            font-family: 'Oswald', sans-serif;
            font-size: 2rem;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: 500;
            margin-bottom: 0.4rem;
            color: var(--light);
            font-size: 0.9rem;
        }

        input {
            padding: 0.8rem 1rem;
            margin-bottom: 1.5rem;
            border: 1px solid #333;
            border-radius: var(--border-radius);
            font-size: 1rem;
            transition: all 0.2s;
            background: rgba(30, 30, 30, 0.8);
            color: var(--light);
        }

        input::placeholder {
            color: #777;
        }

        input:focus {
            border-color: var(--primary);
            outline: none;
            box-shadow: 0 0 0 2px rgba(229, 9, 20, 0.3);
            background: rgba(40, 40, 40, 0.8);
        }

        .btn-submit {
            background: var(--primary);
            color: white;
            padding: 0.8rem 1rem;
            border: none;
            font-size: 1rem;
            font-weight: 600;
            border-radius: var(--border-radius);
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-family: 'Oswald', sans-serif;
            margin-top: 0.5rem;
        }

        .btn-submit:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(229, 9, 20, 0.4);
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        .register-link {
            margin-top: 1.5rem;
            text-align: center;
            font-size: 0.9rem;
            color: #aaa;
        }

        .register-link a {
            color: var(--accent);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s;
        }

        .register-link a:hover {
            color: var(--primary);
            text-decoration: underline;
        }

        .error {
            color: var(--primary);
            margin-bottom: 1rem;
            text-align: center;
            font-size: 0.9rem;
            font-weight: 500;
            padding: 0.5rem;
            background-color: rgba(229, 9, 20, 0.1);
            border-radius: 4px;
            border-left: 3px solid var(--primary);
        }

        .logo {
            text-align: center;
            margin-bottom: 1.5rem;
            font-family: 'Oswald', sans-serif;
            font-size: 2.5rem;
            color: var(--primary);
            letter-spacing: 2px;
        }

        .clapperboard {
            display: inline-block;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div class="form-container">

    <h2>Login</h2>
    <form action="<%= request.getContextPath() %>/login" method="post" target="_blank">
        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>

        <label for="username">Username or Email</label>
        <input type="text" id="username" name="username" placeholder="Enter your username or email" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>

        <button type="submit" class="btn-submit">Sign In</button>
    </form>
    <div class="register-link">
        New to CineVerse? <a href="<%= request.getContextPath() %>/user/userRegistration.jsp">Sign up now</a>
    </div>
</div>

<script>
    function validateForm() {
        const username = document.getElementById('username').value.trim();
        const password = document.getElementById('password').value.trim();

        if (!username || !password) {
            alert('Both username and password are required');
            return false;
        }
        return true;
    }

    // Prevent form submission from opening in new tab
    document.querySelector('form').addEventListener('submit', function(e) {
        e.preventDefault();
        if (validateForm()) {
            this.submit();
        }
    });
</script>
</body>
</html>