<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MovieFlix Footer</title>
    <style>
        .footer {
            background-color: #000000;
            color: white;
            padding: 3rem 1rem;
            text-align: center;
            border-top: 1px solid #3D0000;
        }

        .footer-links {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin-bottom: 2rem;
            flex-wrap: wrap;
        }

        .footer-link {
            color: #b3b3b3;
            text-decoration: none;
            transition: color 0.3s ease;
            font-size: 0.95rem;
        }

        .footer-link:hover {
            color: #FF0000;
        }

        .footer-social {
            display: flex;
            justify-content: center;
            gap: 1.5rem;
            margin: 2rem 0;
        }

        .footer-social-icon {
            color: white;
            background: #3D0000;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .footer-social-icon:hover {
            background: #FF0000;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.3);
        }

        .footer-copyright {
            color: #b3b3b3;
            font-size: 0.9rem;
            margin-top: 1.5rem;
        }

        .footer-logo {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 1.5rem;
            color: white;
        }

        .footer-logo span {
            color: #FF0000;
        }

        .footer-divider {
            border: none;
            height: 1px;
            background-color: #3D0000;
            width: 80%;
            margin: 1.5rem auto;
        }
    </style>
    <!-- Font Awesome for social icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <footer class="footer">
        <div class="footer-logo">Movie<span>Flix</span></div>

        <div class="footer-links">
            <a class="footer-link" href="#">Movies</a>
            <a class="footer-link" href="#">TV Shows</a>
            <a class="footer-link" href="#">New Releases</a>
            <a class="footer-link" href="#">My List</a>
            <a class="footer-link" href="#">About Us</a>
            <a class="footer-link" href="#">Contact</a>
            <a class="footer-link" href="#">FAQ</a>
            <a class="footer-link" href="#">Privacy Policy</a>
            <a class="footer-link" href="#">Terms of Service</a>
        </div>

        <hr class="footer-divider">

        <div class="footer-social">
            <a class="footer-social-icon" href="#"><i class="fab fa-facebook-f"></i></a>
            <a class="footer-social-icon" href="#"><i class="fab fa-twitter"></i></a>
            <a class="footer-social-icon" href="#"><i class="fab fa-instagram"></i></a>
            <a class="footer-social-icon" href="#"><i class="fab fa-youtube"></i></a>
            <a class="footer-social-icon" href="#"><i class="fab fa-tiktok"></i></a>
        </div>

        <div class="footer-copyright">
            &copy; <%= java.time.Year.now().getValue() %> MovieFlix. All rights reserved.
        </div>
    </footer>
</body>
</html>