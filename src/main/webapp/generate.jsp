<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>


<html>
<head>
    <title>Generate QR Code</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

    <style>
        .qr-box {
            border: 2px solid #000;
            display: inline-block;
            padding: 15px;
            background: #fff;
            border-radius: 10px;
        }
        .container-box {
            max-width: 480px;
            margin: auto;
        }
    </style>

    <script>
        
        function downloadQR() {
            var img = document.getElementById("qrImg").src;

            var a = document.createElement("a");
            a.href = img;
            a.download = "QR_Code.png";
            a.click();
        }

        
        function screenshotQR() {
            html2canvas(document.getElementById("qrArea")).then(canvas => {
                let a = document.createElement("a");
                a.href = canvas.toDataURL("image/png");
                a.download = "QR_Screenshot.png";
                a.click();
            });
        }
    </script>

</head>

<body class="p-4">

<div class="container container-box">

    <h2 class="mb-4 text-center">🎯 Generate QR Code</h2>

    
    <form method="get" class="mb-4">
        <div class="input-group">
            <input type="text" name="studentId" class="form-control"
                   placeholder="Enter Student ID"
                   value="<%= request.getParameter("studentId") == null ? "" : request.getParameter("studentId") %>"
                   required>
            <button class="btn btn-primary">Generate</button>
        </div>
    </form>

    <%
        String studentId = request.getParameter("studentId");
        if (studentId != null && !studentId.isEmpty()) {
    %>

    
    <div id="qrArea" class="qr-box text-center">
        <img id="qrImg" src="qrcode?studentId=<%= studentId %>" width="250">
    </div>

    <br><br>

    
    <div class="text-center">
        <button class="btn btn-info" onclick="screenshotQR()">📸 Screenshot</button>
        <button class="btn btn-success" onclick="downloadQR()">⬇ Download</button>
    </div>

    <% } %>

    <br><br>

    <div class="text-center">
        <a href="index.jsp" class="btn btn-secondary">⬅ Back to Home</a>
    </div>

</div>

</body>
</html>
