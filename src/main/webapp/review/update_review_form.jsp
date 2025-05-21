<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="review.Review" %>
<%
    Review review = (Review) request.getAttribute("review");
    int id = review.getId();
    String name = review.getReviewerName();
    String comment = review.getComment();
    int rating = review.getRating();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Review</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #4f46e5;
            --primary-light: #e0e7ff;
            --primary-dark: #4338ca;
            --text: #1f2937;
            --text-light: #6b7280;
            --light: #f9fafb;
            --lighter: #ffffff;
            --border: #e5e7eb;
            --border-focus: #a5b4fc;
            --radius-sm: 0.375rem;
            --radius-md: 0.5rem;
            --radius-lg: 0.75rem;
            --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);
            --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
            --shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1);
            --transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            color: var(--text);
            background-color: var(--light);
            line-height: 1.5;
            padding: 2rem;
            -webkit-font-smoothing: antialiased;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background: var(--lighter);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-md);
            padding: 2rem;
        }

        .header {
            margin-bottom: 2rem;
            text-align: center;
        }

        .title {
            font-size: 1.75rem;
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 0.5rem;
        }

        .subtitle {
            color: var(--text-light);
            font-size: 1rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--text);
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            border: 1px solid var(--border);
            border-radius: var(--radius-md);
            transition: var(--transition);
            background-color: var(--lighter);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--border-focus);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
        }

        textarea.form-control {
            min-height: 120px;
            resize: vertical;
        }

        .rating-selector {
            display: flex;
            gap: 0.5rem;
            margin-top: 0.5rem;
        }

        .rating-star {
            font-size: 1.5rem;
            color: var(--border);
            cursor: pointer;
            transition: var(--transition);
        }

        .rating-star:hover,
        .rating-star.active {
            color: #f59e0b;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            font-weight: 500;
            border-radius: var(--radius-md);
            cursor: pointer;
            transition: var(--transition);
            text-decoration: none;
            border: none;
            gap: 0.5rem;
            background-color: var(--primary);
            color: white;
            width: 100%;
        }

        .btn:hover {
            background-color: var(--primary-dark);
            transform: translateY(-1px);
            box-shadow: var(--shadow-sm);
        }

        .btn i {
            font-size: 0.9em;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--primary);
            text-decoration: none;
            margin-top: 1.5rem;
            font-weight: 500;
            transition: var(--transition);
        }

        .back-link:hover {
            color: var(--primary-dark);
        }

        /* Responsive */
        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }

            .container {
                padding: 1.5rem;
            }

            .title {
                font-size: 1.5rem;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 1.25rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1 class="title">Edit Review</h1>
            <p class="subtitle">Update the review details below</p>
        </div>

        <form method="post" action="<%= request.getContextPath() %>/update_review">
            <input type="hidden" name="id" value="<%= id %>" />

            <div class="form-group">
                <label for="reviewerName">Reviewer Name</label>
                <input type="text" id="reviewerName" name="reviewerName" class="form-control"
                       value="<%= name %>" required />
            </div>

            <div class="form-group">
                <label for="comment">Comment</label>
                <textarea id="comment" name="comment" class="form-control" required><%= comment %></textarea>
            </div>

            <div class="form-group">
                <label for="rating">Rating</label>
                <input type="number" id="rating" name="rating" class="form-control"
                       value="<%= rating %>" min="1" max="5" required />
                <div class="rating-selector" id="ratingStars">
                    <i class="fas fa-star rating-star" data-value="1"></i>
                    <i class="fas fa-star rating-star" data-value="2"></i>
                    <i class="fas fa-star rating-star" data-value="3"></i>
                    <i class="fas fa-star rating-star" data-value="4"></i>
                    <i class="fas fa-star rating-star" data-value="5"></i>
                </div>
            </div>

            <button type="submit" class="btn">
                <i class="fas fa-save"></i> Update Review
            </button>
        </form>

        <a href="<%= request.getContextPath() %>/review_management" class="back-link">
            <i class="fas fa-arrow-left"></i> Back to Reviews
        </a>
    </div>

    <script>
        // Initialize star rating selector
        document.addEventListener('DOMContentLoaded', function() {
            const ratingInput = document.getElementById('rating');
            const stars = document.querySelectorAll('.rating-star');

            // Set initial stars based on current rating
            const currentRating = <%= rating %>;
            highlightStars(currentRating);

            // Add click event to stars
            stars.forEach(star => {
                star.addEventListener('click', function() {
                    const value = parseInt(this.getAttribute('data-value'));
                    ratingInput.value = value;
                    highlightStars(value);
                });
            });

            function highlightStars(count) {
                stars.forEach((star, index) => {
                    if (index < count) {
                        star.classList.add('active');
                    } else {
                        star.classList.remove('active');
                    }
                });
            }
        });
    </script>
</body>
</html>