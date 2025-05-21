<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MovieFlix Header</title>
 <style>
     :root {
         --primary: #FF0000;
         --primary-dark: #950101;
         --dark: #000000;
         --light: #1a1a1a;
         --hover-bg: rgba(255, 0, 0, 0.1);
         --border-radius: 8px;
     }

     * {
         margin: 0;
         padding: 0;
         box-sizing: border-box;
         font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
     }

     body {
         color: white;
         background-color: var(--dark);
         line-height: 1.6;
     }

     .container {
         width: 90%;
         max-width: 1200px;
         margin: 0 auto;
     }

     .btn {
         display: inline-block;
         background: var(--primary);
         color: white;
         border: none;
         padding: 12px 25px;
         border-radius: var(--border-radius);
         cursor: pointer;
         font-weight: 600;
         font-size: 16px;
         text-decoration: none;
         transition: background 0.3s;
     }

     .btn:hover {
         background: var(--primary-dark);
     }

     header {
         background-color: var(--light);
         box-shadow: 0 2px 10px rgba(0,0,0,0.5);
         position: sticky;
         top: 0;
         z-index: 100;
     }

     .header-container {
         display: flex;
         justify-content: space-between;
         align-items: center;
         padding: 15px 0;
     }

     .logo {
         font-size: 28px;
         font-weight: 700;
         color: white;
     }

     .logo span {
         color: var(--primary);
     }

     nav ul {
         display: flex;
         list-style: none;
     }

     nav ul li {
         margin-left: 30px;
     }

     nav ul li a {
         text-decoration: none;
         color: white;
         font-weight: 500;
         transition: color 0.3s;
     }

     nav ul li a:hover {
         color: var(--primary);
     }

     .auth-buttons button {
         padding: 8px 20px;
         margin-left: 10px;
         border: none;
         border-radius: var(--border-radius);
         cursor: pointer;
         font-weight: 500;
     }

     .login {
         background: transparent;
         color: white;
         border: 1px solid var(--primary);
     }

     .register {
         background: var(--primary);
         color: white;
     }

 </style>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <header>
        <div class="container">
            <div class="header-container">
                <div class="logo">Movie<span>Flix</span></div>
                <nav>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="#">Movies</a></li>
                        <li><a href="#">TV Shows</a></li>
                        <li><a href="#">Genres</a></li>
                        <li><a href="./read_reviews">Review</a></li>
                    </ul>
                </nav>
                <div class="auth-buttons">
                    <a href="./user/login.jsp"><button class="login">Login</button></a>
                    <a href="#"><button class="register">Register</button></a>
                </div>
            </div>
        </div>
    </header>
</body>
</html>