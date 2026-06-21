<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.qrattendance.model.AttendanceRecord"%>

<%
    
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Attendance Dashboard</title>

    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: #f5f7fa;
        }
        .stat-card {
            padding: 25px;
            color: #fff;
            border-radius: 12px;
            font-weight: 600;
        }
        .bg-total   { background: #007bff; }
        .bg-present { background: #28a745; }
        .bg-absent  { background: #dc3545; }
        .table-area {
            background: #fff;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.15);
        }
        h2 {
            font-weight: bold;
        }
    </style>
</head>

<body class="p-4">

    <h2 class="mb-4 text-center">
        <i class="fa-solid fa-chart-line"></i> Attendance 
    </h2>

    <!-- Statistics Row -->
    <div class="row text-center mb-4">

        <div class="col-md-4 mb-3">
            <div class="stat-card bg-total shadow">
                <h4>Total Students</h4>
                <h2><%= request.getAttribute("totalStudents") %></h2>
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="stat-card bg-present shadow">
                <h4>Present Today</h4>
                <h2><%= request.getAttribute("presentToday") %></h2>
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="stat-card bg-absent shadow">
                <h4>Absent Today</h4>
                <h2><%= request.getAttribute("absentToday") %></h2>
            </div>
        </div>

    </div>

   
    <div class="table-area">

        <h4 class="mb-3">
            <i class="fa-solid fa-list-check"></i> Today's Attendance List
        </h4>

        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Student ID</th>
                    <th>Scan Time</th>
                    <th>Status</th>
                </tr>
            </thead>

            <tbody>
            <%
                List<AttendanceRecord> list =
                        (List<AttendanceRecord>) request.getAttribute("attendanceList");

                if (list != null && !list.isEmpty()) {
                    for (AttendanceRecord r : list) {
            %>
                <tr>
                    <td><%= r.getStudentId() %></td>
                    <td><%= r.getTime() %></td>
                    <td>
                        <% if ("Present".equalsIgnoreCase(r.getStatus())) { %>
                            <span class="badge bg-success">Present</span>
                        <% } else { %>
                            <span class="badge bg-danger">Absent</span>
                        <% } %>
                    </td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="3" class="text-center text-muted">No records found</td>
                </tr>
            <% } %>
            </tbody>

        </table>
    </div>

    <br>

    <div class="text-center">
        <a href="index.jsp" class="btn btn-secondary">
         
            <i class="fa-solid fa-arrow-left"></i> Back
        </a>
    </div>

</body>
</html>
