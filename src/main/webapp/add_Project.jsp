<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ConstructionXpert - Add Project</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2A5C8B;
            --secondary-color: #F4A261;
            --accent-color: #E76F51;
            --light-color: #F8F9FA;
            --dark-color: #264653;
        }

        body {
            background-color: #f5f7fa;
        }

        .navbar {
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: none;
        }

        .card-title {
            color: var(--primary-color);
            font-weight: 600;
        }

        .form-label {
            font-weight: 500;
            color: var(--dark-color);
        }

        .form-control {
            border-radius: 8px;
            padding: 10px 15px;
            border: 1px solid #dee2e6;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(42, 92, 139, 0.25);
        }

        .btn-primary {
            background-color: var(--primary-color);
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-primary:hover {
            background-color: #1d4b75;
            transform: translateY(-2px);
        }

        .date-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-color);
        }

        .input-group {
            position: relative;
        }
    </style>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: var(--primary-color);">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="fas fa-building me-2"></i>ConstructionXpert
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Home"><i class="fas fa-home me-1"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="add_Project.jsp"><i class="fas fa-plus-circle me-1"></i> Add Project</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ProjectServlet"><i class="fas fa-list me-1"></i> Projects</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card">
                <div class="card-header bg-white border-0 pt-4">
                    <h2 class="card-title text-center mb-0">
                        <i class="fas fa-project-diagram me-2" style="color: var(--secondary-color);"></i>
                        Add New Project
                    </h2>
                </div>
                <div class="card-body px-5 py-4">
                    <form action="ProjectServlet" method="post">
                        <div class="mb-4">
                            <label for="name" class="form-label">Project Name</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Enter project name" required>
                        </div>

                        <div class="mb-4">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="3" placeholder="Describe the project"></textarea>
                        </div>

                        <div class="row mb-4">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <label for="date_start" class="form-label">Start Date</label>
                                <div class="input-group">
                                    <input type="date" class="form-control" id="date_start" name="date_start" required>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="date_end" class="form-label">End Date</label>
                                <div class="input-group">
                                    <input type="date" class="form-control" id="date_end" name="date_end" required>

                                </div>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="budget" class="form-label">Budget (DH)</label>
                            <div class="input-group">
                                <span class="input-group-text">DH</span>
                                <input type="number" class="form-control" id="budget" name="budget" placeholder="Enter project budget" min="0" step="0.01">
                            </div>
                        </div>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                            <button type="reset" class="btn btn-outline-secondary me-md-2">
                                <i class="fas fa-undo me-1"></i> Reset
                            </button>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-1"></i> Save Project
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Add today's date as default for start date
    document.addEventListener('DOMContentLoaded', function() {
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('date_start').value = today;
    });
</script>
</body>
</html>