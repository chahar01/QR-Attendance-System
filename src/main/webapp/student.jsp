<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Register Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light p-4">

<div class="container mt-5">
    <h2 class="mb-4">Register Student</h2>

    <form action="register-student" method="post" class="card p-4 shadow">

        


        <label class="form-label">Student Name</label>
        <input type="text" class="form-control mb-3" name="studentName" required>

        <button class="btn btn-primary w-100">Register Student</button>

    </form>

    <a href="index.jsp" class="btn btn-link mt-3">Back to Dashboard</a>

</div>

</body>
</html>

