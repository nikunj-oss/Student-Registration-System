<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection conn = null;
            Statement stm = null;
            try {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String roll = request.getParameter("roll");
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/Regist","root","root");
                stm = conn.createStatement();
                
                String sql = "insert into student.student values(?,?,?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, roll);
                
                int i = pstmt.executeUpdate();
                if (i == 1) {
        %>
                    <script>
                        alert("Record added");
                    </script>
        <%
                } else {
                    out.print("Something went wrong");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (stm != null) stm.close();
                    if (conn != null) conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
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
