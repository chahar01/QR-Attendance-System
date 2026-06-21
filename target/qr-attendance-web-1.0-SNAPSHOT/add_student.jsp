<form action="StudentServlet" method="post">
    Name: <input type="text" name="name"><br>
    Course: <input type="text" name="course"><br>
    Contact: <input type="text" name="contact"><br>

    <button type="submit">Add Student</button>
</form>

<% 
    if (request.getParameter("regId") != null) {
        out.print("<h3>Generated Register ID: " + request.getParameter("regId") + "</h3>");
    }
%>
