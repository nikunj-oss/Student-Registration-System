
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <%
                            Connection conn;
                            Statement stm;
                            ResultSet rs;
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/Regist","root","root");
                            stm = conn.createStatement();
                            String roll=request.getParameter("roll");
                            String sql="select * from student.student where roll='"+roll+"'";
                            rs=stm.executeQuery(sql);
                            while(rs.next()){
                                String name = rs.getString("name");
                                String email = rs.getString("email");
                                String rolll = rs.getString("roll");
                            
        %>
        <div class="row" style="margin-left:20px;margin-top:20px">
            <div class="col-sm-4">
                <h1>Modification Panel</h1>
                <br>
                <form action="modify.jsp" method="post" class='form-group'>
                    <label for='name'>Enter Your name </label>
                    <input type='text' name='name' placeholder='Enter Your Name' id='name' class='form-control' value="<%=name%>">
                    <label for='email'>Enter Your email </label>
                    <input type='text' name='email' placeholder='Enter Your email' id='email' class='form-control' value="<%=email%>">
                    <label for='roll'>Enter Your roll number </label>
                    <input type='text' name='roll' placeholder='Enter Your roll' id='roll' class='form-control' value="<%=rolll%>">

                    <br>
                    <input type="submit" name="submit" value="submit" class="btn btn-primary" style="width:100px;">
                </form>
            </div>
            
        </div>
                    
                        <% }
                    %>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>  
    </body>
</html>
