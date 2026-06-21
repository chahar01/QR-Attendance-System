<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Student Registration</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="p-4">

<div class="container" style="max-width:700px">
  <h2 class="mb-4">Add Student</h2>

  <% String msg = (String) request.getAttribute("msg");
     if (msg != null) { %>
    <div class="alert alert-success"><%= msg %></div>
  <% } %>

  <form method="post" action="${pageContext.request.contextPath}/student">

    <div class="mb-3">
      <label>Name</label>
      <input name="name" class="form-control" required>
    </div>

    <div class="mb-3">
      <label>Course</label>
      <input name="course" class="form-control" required>
    </div>

    <div class="mb-3">
      <label>Register ID</label>
      <input class="form-control" value="Auto Generated" readonly>
    </div>

    <div class="mb-3">
      <label>Contact</label>
      <input name="contact" class="form-control">
    </div>

    <div class="mb-3">
      <label>Other Details</label>
      <textarea name="details" class="form-control"></textarea>
    </div>

    <button class="btn btn-primary">Save Student</button>
    <a href="index.jsp" class="btn btn-secondary">Back</a>

  </form>
</div>
</body>
</html>
