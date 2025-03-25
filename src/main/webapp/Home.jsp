<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert | Project Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #2A5C8B;
            --secondary: #F4A261;
            --dark: #264653;
            --light: #F8F9FA;
            --accent: #E76F51;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Roboto, sans-serif;
        }

        body {
            background-color: var(--light);
            color: #333;
            line-height: 1.6;
        }

        /* Header */
        header {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 5%;
            max-width: 1400px;
            margin: 0 auto;
        }



        .logo  {

            height: 100px;
            width: 130px;
            margin-right: 10px;
            color: var(--secondary);
        }
#hek{

    display: flex;
    align-items: center;
    font-size: 1.5rem;
    font-weight: 700;
    color: var(--primary)
}
        .nav-links {
            display: flex;
            gap: 2rem;
        }

        .nav-links a {
            color: var(--dark);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: var(--accent);
        }

        .btn {
            display: inline-block;
            background-color: var(--primary);
            color: white;
            padding: 0.6rem 1.2rem;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #1d4b75;
        }

        .btn-outline {
            background-color: transparent;
            border: 1px solid var(--primary);
            color: var(--primary);
        }

        /* Hero Section */
        .hero {
            display: flex;
            align-items: center;
            padding: 4rem 5%;
            max-width: 1400px;
            margin: 0 auto;
        }

        .hero-content {
            flex: 1;
            padding-right: 2rem;
        }

        .hero h1 {
            font-size: 2.5rem;
            color: var(--dark);
            margin-bottom: 1rem;
            line-height: 1.2;
        }

        .hero p {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 2rem;
            max-width: 500px;
        }

        .hero-image {
            flex: 1;
        }

        .hero-image img {
            width: 100%;
            border-radius: 8px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        /* Features */
        .features {
            padding: 4rem 5%;
            background-color: white;
        }

        .section-title {
            text-align: center;
            margin-bottom: 3rem;
        }

        .section-title h2 {
            font-size: 2rem;
            color: var(--dark);
            margin-bottom: 1rem;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .feature-card {
            background-color: var(--light);
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-5px);
        }

        .feature-icon {
            font-size: 2rem;
            color: var(--secondary);
            margin-bottom: 1rem;
        }

        /* CTA */
        .cta {
            background-color: var(--primary);
            color: white;
            text-align: center;
            padding: 4rem 5%;
        }

        .cta h2 {
            font-size: 2rem;
            margin-bottom: 1.5rem;
        }

        .cta .btn {
            background-color: white;
            color: var(--primary);
            font-size: 1.1rem;
        }

        /* Footer */
        footer {
            background-color: var(--dark);
            color: white;
            padding: 3rem 5%;
            text-align: center;
        }

        .footer-links {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .footer-links a {
            color: white;
            text-decoration: none;
        }

        .social-links {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .social-links a {
            color: white;
            font-size: 1.2rem;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .hero {
                flex-direction: column;
                text-align: center;
            }

            .hero-content {
                padding-right: 0;
                margin-bottom: 2rem;
            }

            .hero p {
                margin: 0 auto 2rem;
            }

            .nav-links {
                display: none;
            }
        }
    </style>
</head>
<body>
<!-- Header -->
<header>
    <nav class="navbar">
        <div id="hek">
            <img class="logo" src="assets/image/logo.png">
            <span>ConstructionXpert</span>
        </div>
        <div class="nav-links">
            <a href="Home">HOME</a>
            <a href="ProjectServlet">Projects</a>
            <a href="TaskServlet">Tasks</a>
            <a href="ResourceServlet">Resources</a>
            <a href="ProjectServlet" class="btn">Get Started</a>
        </div>
    </nav>
</header>

<!-- Hero Section -->
<section class="hero">
    <div class="hero-content">
        <h1>Streamline Your Construction Projects</h1>
        <p>Manage tasks, resources, and budgets in one powerful platform designed specifically for construction professionals.</p>

    </div>
    <div class="hero-image">
        <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="Construction project management">
    </div>
</section>

<!-- Features Section -->
<section class="features">
    <div class="section-title">
        <h2>Powerful Features</h2>
        <p>Everything you need to manage your construction projects efficiently</p>
    </div>
    <div class="features-grid">
        <div class="feature-card">
            <div class="feature-icon">
                <i class="fas fa-tasks"></i>
            </div>
            <h3>Task Management</h3>
            <p>Assign and track construction tasks with deadlines and priorities.</p>
        </div>
        <div class="feature-card">
            <div class="feature-icon">
                <i class="fas fa-truck-moving"></i>
            </div>
            <h3>Resource Tracking</h3>
            <p>Manage materials, equipment, and labor allocations.</p>
        </div>
        <div class="feature-card">
            <div class="feature-icon">
                <i class="fas fa-chart-line"></i>
            </div>
            <h3>Progress Reports</h3>
            <p>Generate real-time reports on project status and milestones.</p>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="cta">
    <h2>Ready to Transform Your Project Management?</h2>
    <p>Join hundreds of construction companies using ConstructionXpert</p>
    <a href="#" class="btn">Get Started Today</a>
</section>

<!-- Footer -->
<footer>
    <div class="footer-links">
        <a href="#">About</a>
        <a href="#">Contact</a>
        <a href="#">Privacy</a>
        <a href="#">Terms</a>
    </div>
    <div class="social-links">
        <a href="#"><i class="fab fa-facebook-f"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-linkedin-in"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
    </div>
    <p>&copy; 2023 ConstructionXpert. All rights reserved.</p>
</footer>
</body>
</html>