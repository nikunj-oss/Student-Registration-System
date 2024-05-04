<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Delete Page</title>
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
                            String sql="delete from student.student where roll='"+roll+"'";
                            int i=0;
                            i=stm.executeUpdate(sql);
                            if(i==1){
                                %>
                                <script>
                                    alert("Record Deleted");
                                </script>
                                <%
                            
                            }
                            else{
                                out.print("something went wrong");
                            }
                %>
        <div class="container">
            <div class="row">
                <div class="col-sm-12 align-center card" style="margin:20px;">
                    <h1>Press to go back to the Main Home Page</h1>
                    <a href="index.jsp"><input type="button" class="btn btn-primary" value="back" style="margin:20px;"></a>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
