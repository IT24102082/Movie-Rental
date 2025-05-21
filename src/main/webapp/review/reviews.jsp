<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="java.util.List" %>
<%
    List<JsonObject> reviews = (List<JsonObject>) request.getAttribute("reviews");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Reviews | Cinema Ratings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --black: #000000;
            --dark-red: #3D0000;
            --medium-red: #950101;
            --bright-red: #FF0000;
            --text: #f8f8f8;
            --text-light: #d1d1d1;
            --light: #1a1a1a;
            --lighter: #2a2a2a;
            --border: #3a3a3a;
            --star-filled: #FF0000;
            --star-empty: #3a3a3a;
            --shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.3);
            --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.3);
            --shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.3);
            --radius-sm: 8px;
            --radius-md: 12px;
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            color: var(--text);
            background-color: var(--black);
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem 1.5rem;
        }

        .page-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .page-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--bright-red);
            margin-bottom: 0.5rem;
            text-shadow: 0 2px 4px rgba(255, 0, 0, 0.3);
        }

        .page-subtitle {
            color: var(--text-light);
            font-size: 1.1rem;
            max-width: 600px;
            margin: 0 auto;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            font-weight: 600;
            border-radius: var(--radius-sm);
            cursor: pointer;
            transition: var(--transition);
            text-decoration: none;
            border: none;
            gap: 0.5rem;
        }

        .btn-primary {
            background-color: var(--bright-red);
            color: white;
            box-shadow: var(--shadow-sm);
        }

        .btn-primary:hover {
            background-color: var(--medium-red);
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .reviews-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .review-card {
            background: var(--lighter);
            border-radius: var(--radius-md);
            padding: 1.5rem;
            box-shadow: var(--shadow-sm);
            transition: var(--transition);
            display: flex;
            flex-direction: column;
            height: 100%;
            border: 1px solid var(--dark-red);
        }

        .review-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.2);
            border-color: var(--bright-red);
        }

        .review-header {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
            border-bottom: 1px solid var(--dark-red);
            padding-bottom: 1rem;
        }

        .avatar {
            width: 2.5rem;
            height: 2.5rem;
            border-radius: 50%;
            background-color: var(--dark-red);
            color: var(--text);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            font-weight: 600;
            flex-shrink: 0;
            border: 1px solid var(--bright-red);
        }

        .reviewer-info {
            display: flex;
            flex-direction: column;
        }

        .reviewer-name {
            font-weight: 600;
            margin: 0;
            font-size: 1rem;
            color: var(--text);
        }

        .review-date {
            color: var(--text-light);
            font-size: 0.8rem;
            margin-top: 0.2rem;
        }

        .review-content {
            margin: 1rem 0;
            flex-grow: 1;
        }

        .review-text {
            font-size: 0.95rem;
            line-height: 1.6;
            color: var(--text-light);
            margin-bottom: 1rem;
            max-height: 6rem;
            overflow-y: auto;
            padding-right: 0.5rem;
        }

        .review-text::-webkit-scrollbar {
            width: 4px;
        }

        .review-text::-webkit-scrollbar-track {
            background: var(--border);
        }

        .review-text::-webkit-scrollbar-thumb {
            background: var(--bright-red);
            border-radius: 2px;
        }

        .rating {
            display: flex;
            align-items: center;
            margin-top: auto;
            padding-top: 1rem;
            border-top: 1px solid var(--dark-red);
        }

        .stars {
            color: var(--star-filled);
            display: flex;
            gap: 0.1rem;
            font-size: 1.1rem;
        }

        .stars .empty {
            color: var(--star-empty);
        }

        .rating-value {
            margin-left: 0.5rem;
            font-weight: 600;
            font-size: 0.9rem;
            color: var(--text-light);
        }

        .empty-state {
            grid-column: 1 / -1;
            text-align: center;
            padding: 3rem;
            color: var(--text-light);
            background: var(--lighter);
            border-radius: var(--radius-md);
            border: 1px dashed var(--dark-red);
        }

        .empty-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: var(--medium-red);
        }

        .empty-text {
            font-size: 1.1rem;
            margin-bottom: 1.5rem;
            color: var(--text);
        }

        .movie-title {
            font-size: 1.2rem;
            color: var(--bright-red);
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1.5rem 1rem;
            }

            .page-title {
                font-size: 1.8rem;
            }

            .reviews-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="/header.jsp" />

    <main class="container">
        <header class="page-header">
            <p class="page-subtitle">Read what our community says about the latest films and cinematic experiences.</p>
        </header>

        <div class="text-center">
            <a href="<%= request.getContextPath() %>/review/review_form.jsp" class="btn btn-primary">
                <i class="fas fa-plus"></i> Write a Review
            </a>
        </div>

        <div class="reviews-grid">
            <%
                if (reviews != null && !reviews.isEmpty()) {
                    for (JsonObject review : reviews) {
                        String name = review.get("reviewerName").getAsString();
                        String comment = review.get("comment").getAsString();
                        int rating = review.get("rating").getAsInt();
                        String initials = name.substring(0, 1).toUpperCase();
                        // Assuming you might add date and movie title in the future
                        String date = review.has("date") ? review.get("date").getAsString() : "Recently";
                        String movieTitle = review.has("movieTitle") ? review.get("movieTitle").getAsString() : "Untitled Movie";
            %>
            <article class="review-card">
                <div class="review-header">
                    <div class="avatar"><%= initials %></div>
                    <div class="reviewer-info">
                        <h3 class="reviewer-name"><%= name %></h3>
                        <span class="review-date"><%= date %></span>
                    </div>
                </div>

                <div class="review-content">
                    <p class="review-text"><%= comment %></p>
                </div>

                <div class="rating">
                    <div class="stars">
                        <%
                            for (int i = 1; i <= 5; i++) {
                                if (i <= rating) {
                        %>
                                <i class="fas fa-star"></i>
                        <%
                                } else {
                        %>
                                <i class="fas fa-star empty"></i>
                        <%
                                }
                            }
                        %>
                    </div>
                    <span class="rating-value"><%= rating %>/5</span>
                </div>
            </article>
            <%
                    }
                } else {
            %>
            <div class="empty-state">
                <i class="fas fa-film empty-icon"></i>
                <h3 class="empty-text">No reviews yet</h3>
                <p>Be the first to share your thoughts about a movie!</p>
            </div>
            <%
                }
            %>
        </div>
    </main>

    <jsp:include page="/footer.jsp" />
</body>
</html>