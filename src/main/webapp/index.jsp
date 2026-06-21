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
    <title>QR Attendance System</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f5f7fa;
        }
        .dashboard-box {
            margin-top: 80px;
        }
        .menu-card {
            margin-bottom: 15px;
        }
    </style>
</head>

<body>

<div class="container dashboard-box">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <h2 class="text-center mb-4">📊 QR Attendance </h2>

            <div class="card p-4 shadow">

                <a href="student_register.jsp" class="btn btn-info w-100 menu-card">➕ Add Student</a>
              
                <a href="generate.jsp" class="btn btn-primary w-100 menu-card">📄 Generate QR Code</a>
               
                <a href="scan.jsp" class="btn btn-success w-100 menu-card">📸 Scan QR</a>
                
                <a href="report.jsp" class="btn btn-warning w-100 menu-card">📥 Download Report</a>
                
                <a href="dashboard" class="btn btn-info w-100 menu-card">📈 View Dashboard</a>
                
                <a href="logout" class="btn btn-danger">Logout</a>

            </div>

        </div>
    </div>
</div>

</body>
</html>
