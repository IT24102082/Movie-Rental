<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MovieFlix | Stream Unlimited Movies</title>
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

     .hero {
         background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba');
         background-size: cover;
         background-position: center;
         height: 70vh;
         display: flex;
         align-items: center;
         color: white;
         text-align: center;
     }

     .hero-content {
         max-width: 800px;
         margin: 0 auto;
     }

     .hero h1 {
         font-size: 48px;
         margin-bottom: 20px;
     }

     .hero p {
         font-size: 18px;
         margin-bottom: 30px;
     }

     .featured {
         padding: 80px 0;
         background-color: var(--light);
     }

     .section-title {
         text-align: center;
         margin-bottom: 50px;
     }

     .section-title h2 {
         font-size: 36px;
         color: white;
         margin-bottom: 15px;
     }

     .section-title p {
         color: #b3b3b3;
         max-width: 700px;
         margin: 0 auto;
     }

     .movies-grid {
         display: grid;
         grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
         gap: 30px;
     }

     .movie-card {
         border-radius: var(--border-radius);
         overflow: hidden;
         box-shadow: 0 3px 10px rgba(0,0,0,0.3);
         transition: transform 0.3s;
         background: #2a2a2a;
     }

     .movie-card:hover {
         transform: translateY(-5px);
         box-shadow: 0 5px 15px rgba(255,0,0,0.2);
     }

     .movie-img {
         height: 350px;
         overflow: hidden;
         position: relative;
     }

     .movie-img img {
         width: 100%;
         height: 100%;
         object-fit: cover;
         transition: transform 0.5s;
     }

     .movie-card:hover .movie-img img {
         transform: scale(1.05);
     }

     .play-icon {
         position: absolute;
         top: 50%;
         left: 50%;
         transform: translate(-50%, -50%);
         font-size: 50px;
         color: var(--primary);
         opacity: 0;
         transition: opacity 0.3s;
     }

     .movie-card:hover .play-icon {
         opacity: 1;
     }

     .movie-info {
         padding: 20px;
     }

     .movie-title {
         font-size: 18px;
         font-weight: 700;
         margin-bottom: 10px;
         color: white;
     }

     .movie-meta {
         color: #b3b3b3;
         margin-bottom: 15px;
         font-size: 14px;
     }

     .rating {
         display: flex;
         justify-content: space-between;
         border-top: 1px solid #444;
         padding-top: 15px;
         margin-top: 15px;
         align-items: center;
     }

     .stars {
         color: gold;
     }

     .watch-now {
         color: var(--primary);
         font-weight: 600;
         text-decoration: none;
         font-size: 14px;
     }

     .genres {
         padding: 80px 0;
         background-color: var(--dark);
     }

     .genres-grid {
         display: grid;
         grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
         gap: 20px;
     }

     .genre-card {
         text-align: center;
         padding: 30px;
         background: #3D0000;
         border-radius: var(--border-radius);
         box-shadow: 0 3px 10px rgba(0,0,0,0.2);
         transition: transform 0.3s;
     }

     .genre-card:hover {
         transform: scale(1.05);
         background: #950101;
     }

     .genre-icon {
         font-size: 50px;
         color: white;
         margin-bottom: 20px;
     }

     .genre-card h3 {
         margin-bottom: 15px;
         color: white;
     }

     .testimonials {
         padding: 80px 0;
         background-color: var(--light);
     }

     .testimonial-grid {
         display: grid;
         grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
         gap: 30px;
     }

     .testimonial-card {
         background: #2a2a2a;
         padding: 30px;
         border-radius: var(--border-radius);
         box-shadow: 0 3px 10px rgba(0,0,0,0.2);
     }

     .testimonial-text {
         font-style: italic;
         margin-bottom: 20px;
         color: white;
     }

     .client-info {
         display: flex;
         align-items: center;
     }

     .client-img {
         width: 50px;
         height: 50px;
         border-radius: 50%;
         overflow: hidden;
         margin-right: 15px;
     }

     .client-img img {
         width: 100%;
         height: 100%;
         object-fit: cover;
     }

     .client-name {
         font-weight: 600;
         color: white;
     }

     .cta {
         background: linear-gradient(rgba(61, 0, 0, 0.9), rgba(61, 0, 0, 0.9));
         color: white;
         padding: 80px 0;
         text-align: center;
     }

     .cta h2 {
         font-size: 36px;
         margin-bottom: 20px;
     }

     .cta p {
         max-width: 700px;
         margin: 0 auto 30px;
         color: #ecf0f1;
     }
 </style>

</head>
<body>

    <jsp:include page="header.jsp" />


    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <div class="hero-content">
                <h1>Unlimited Movies, TV Shows and More</h1>
                <p>Stream now on any device. Cancel anytime. Ready to watch? Click below to create your account.</p>
                <a href="#" class="btn">Start Your Free Trial</a>
            </div>
        </div>
    </section>

    <!-- Featured Movies -->
    <section class="featured">
        <div class="container">
            <div class="section-title">
                <h2>Trending Now</h2>
                <p>Discover the most popular movies and TV shows streaming right now</p>
            </div>

            <div class="movies-grid">
                <!-- Movie 1 -->
                <div class="movie-card">
                    <div class="movie-img">
                        <img src="https://m.media-amazon.com/images/M/MV5BMDdmMTBiNTYtMDIzNi00NGVlLWIzMDYtZTk3MTQ3NGQxZGEwXkEyXkFqcGdeQXVyMzMwOTU5MDk@._V1_.jpg" alt="The Batman">
                        <div class="play-icon">▶</div>
                    </div>
                    <div class="movie-info">
                        <h3 class="movie-title">The Batman</h3>
                        <div class="movie-meta">2022 • Action/Crime • 2h 56m</div>
                        <div class="rating">
                            <div class="stars">★★★★☆</div>
                            <a href="#" class="watch-now">Watch Now</a>
                        </div>
                    </div>
                </div>

                <!-- Movie 2 -->
                <div class="movie-card">
                    <div class="movie-img">
                        <img src="https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_FMjpg_UX1000_.jpg" alt="Avatar: The Way of Water">
                        <div class="play-icon">▶</div>
                    </div>
                    <div class="movie-info">
                        <h3 class="movie-title">Avatar: The Way of Water</h3>
                        <div class="movie-meta">2022 • Sci-Fi/Adventure • 3h 12m</div>
                        <div class="rating">
                            <div class="stars">★★★★★</div>
                            <a href="#" class="watch-now">Watch Now</a>
                        </div>
                    </div>
                </div>

                <!-- Movie 3 -->
                <div class="movie-card">
                    <div class="movie-img">
                        <img src="https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_FMjpg_UX1000_.jpg" alt="Spider-Man: No Way Home">
                        <div class="play-icon">▶</div>
                    </div>
                    <div class="movie-info">
                        <h3 class="movie-title">Spider-Man: No Way Home</h3>
                        <div class="movie-meta">2021 • Action/Adventure • 2h 28m</div>
                        <div class="rating">
                            <div class="stars">★★★★☆</div>
                            <a href="#" class="watch-now">Watch Now</a>
                        </div>
                    </div>
                </div>

                <!-- Movie 4 -->
                <div class="movie-card">
                    <div class="movie-img">
                        <img src="https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg" alt="The Matrix Resurrections">
                        <div class="play-icon">▶</div>
                    </div>
                    <div class="movie-info">
                        <h3 class="movie-title">The Matrix Resurrections</h3>
                        <div class="movie-meta">2021 • Sci-Fi/Action • 2h 28m</div>
                        <div class="rating">
                            <div class="stars">★★★☆☆</div>
                            <a href="#" class="watch-now">Watch Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <!-- Testimonials Section -->
    <section class="testimonials">
        <div class="container">
            <div class="section-title">
                <h2>What Our Subscribers Say</h2>
                <p>Hear from our satisfied customers about their MovieFlix experience</p>
            </div>

            <div class="testimonial-grid">
                <div class="testimonial-card">
                    <div class="testimonial-text">
                        "MovieFlix has the best selection of movies I've seen on any platform. The 4K streaming quality is incredible and I love the personalized recommendations."
                    </div>
                    <div class="client-info">
                        <div class="client-img">
                            <img src="https://randomuser.me/api/portraits/women/32.jpg" alt="Sarah Johnson">
                        </div>
                        <div class="client-name">Sarah Johnson</div>
                    </div>
                </div>

                <div class="testimonial-card">
                    <div class="testimonial-text">
                        "As a film buff, I appreciate the depth of MovieFlix's catalog. From classic cinema to the latest blockbusters, they have it all. Highly recommended!"
                    </div>
                    <div class="client-info">
                        <div class="client-img">
                            <img src="https://randomuser.me/api/portraits/men/45.jpg" alt="Michael Chen">
                        </div>
                        <div class="client-name">Michael Chen</div>
                    </div>
                </div>

                <div class="testimonial-card">
                    <div class="testimonial-text">
                        "The family plan is perfect for us - we can all watch our favorite shows on different devices simultaneously. The kids love the animated selection too!"
                    </div>
                    <div class="client-info">
                        <div class="client-img">
                            <img src="https://randomuser.me/api/portraits/women/68.jpg" alt="Lisa Rodriguez">
                        </div>
                        <div class="client-name">Lisa Rodriguez</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta">
        <div class="container">
            <h2>Ready to start streaming?</h2>
            <p>Join thousands of happy subscribers enjoying unlimited access to our massive library of movies and TV shows. Cancel anytime.</p>
            <a href="#" class="btn">Get Started Now</a>
        </div>
    </section>

    <jsp:include page="footer.jsp" />

</body>
</html>