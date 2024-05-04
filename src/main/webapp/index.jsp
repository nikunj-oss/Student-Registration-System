<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WT PBL</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="row" style="margin-left:20px;margin-top:20px">
        <div class="col-sm-4">
            <h1>Student Registration</h1>
            <br>
            <form action="result.jsp" method="post" class='form-group'>
                <label for='name'>Enter Your name </label>
                <input type='text' name='name' placeholder='Enter Your Name' id='name' class='form-control'>
                <label for='email'>Enter Your email </label>
                <input type='text' name='email' placeholder='Enter Your email' id='email' class='form-control'>
                <label for='roll'>Enter Your roll number </label>
                <input type='text' name='roll' placeholder='Enter Your roll' id='roll' class='form-control'>
                
                <br>
                <input type="submit" name="submit" value="submit" class="btn btn-primary" style="width:100px;">
            </form>
        </div>
        
        <div class="col-sm-2"></div>
        <div class="col-sm-6 align-right">
            <h1>Student Details</h1>
            <br>
            <table class="table table-responsive table-hover">
                <thead class="table-dark">
                    <th>Name</th>
                    <th>Email</th>
                    <th>Roll Number</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </thead>
                <%
                    Connection conn = null;
                    Statement stm = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/Regist","root","root");
                        stm = conn.createStatement();
                        String sql = "select * from student.student";
                        rs = stm.executeQuery(sql);
                        while(rs.next()) {
                            String roll = rs.getString("roll"); // Moved inside the loop
                %>
                            <tr>
                                <td><%= rs.getString("name") %></td>
                                <td><%= rs.getString("email") %></td>
                                <td><%= roll %></td> <!-- Display roll here -->
                                <td><a href="edit.jsp?roll=<%= roll %>">Edit</a></td>
                                <td><a href="del.jsp?roll=<%= roll %>">Delete</a></td> <!-- Use roll variable here -->
                            </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stm != null) stm.close();
                            if (conn != null) conn.close();
                        } catch (SQLException ex) {
                            ex.printStackTrace();
                        }
                    }
                %>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>  
</body>
</html>
