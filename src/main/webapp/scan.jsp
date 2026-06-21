<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>


<html>
<head>
    <title>Scan Student QR Code</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://unpkg.com/html5-qrcode@2.3.7/html5-qrcode.min.js"></script>

    <style>
        #reader {
            width: 350px;
            margin: auto;
            margin-top: 20px;
        }
    </style>
</head>

<body class="p-4">

<h2 class="text-center">📸 Scan Student QR Code</h2>

<div id="reader"></div>
<p id="statusMsg" class="text-center mt-3 fw-bold"></p>

<script>
function onScanSuccess(decodedText) {
    document.getElementById("statusMsg").innerHTML =
        "Detected: " + decodedText + "<br>Marking attendance...";

    fetch("mark-attendance", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: "studentId=" + encodeURIComponent(decodedText)
    })
    .then(res => res.text())
    .then(msg => {
        document.getElementById("statusMsg").innerHTML = msg;
    });
}

let scanner = new Html5QrcodeScanner(
    "reader",
    { fps: 10, qrbox: 250 }
);

scanner.render(onScanSuccess);
</script>

<br>
<div class="text-center">
    <a href="index.jsp" class="btn btn-secondary mt-3">⬅ Back to Home</a>

</div>

</body>
