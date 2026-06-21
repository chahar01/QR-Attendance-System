<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
<head>
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f5f7fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-box {
            width: 450px;
        }
    </style>
</head>

<body>

<div class="login-box">
    <div class="card shadow-lg">
        <div class="card-body">

            <h3 class="text-center mb-4">Admin Login</h3>

            <form action="admin-login" method="post">
                <input class="form-control mb-3" type="text" name="username" placeholder="Username" required>
                <input class="form-control mb-3" type="password" name="password" placeholder="Password" required>
                <button class="btn btn-primary w-100">Login</button>
            </form>

            <% if (request.getParameter("error") != null) { %>
                <p class="text-danger text-center mt-3">Invalid username or password</p>
            <% } %>

        </div>
    </div>
</div>

</body>
</html>
