<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>


<html>
<head>
    <title>Download Attendance Report</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="p-4">

<div class="container">
    <h2 class="mb-4">📄 Download Monthly Attendance Report</h2>

    <form action="export-report" method="get" class="card p-4 shadow-sm">

        <div class="mb-3">
            <label class="form-label">Select Month:</label>
            <select class="form-select" name="month" required>
                <%
                    for (int m = 1; m <= 12; m++) {
                %>
                    <option value="<%= m %>"><%= m %></option>
                <%
                    }
                %>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Select Year:</label>
            <select class="form-select" name="year" required>
                <%
                    for (int y = 2004; y <= 2030; y++) {
                %>
                    <option value="<%= y %>"><%= y %></option>
                <%
                    }
                %>
            </select>
        </div>

        <button type="submit" class="btn btn-primary w-100">Download CSV</button>
    </form>

    <div class="text-center mt-4">
        <a href="index.jsp" class="btn btn-secondary">⬅ Back to Home</a>
   
    </div>
</div>

</body>
</html>
