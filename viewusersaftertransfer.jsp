<%-- 
    Document   : viewusers
    Created on : Nov 16, 2020, 9:47:14 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <style>
            #transfer{
                text-align: center;
                font-family: cursive;
                font-size: 10px;
                color:blue;
                font-style: italic;
            }
            .bg-color{
  background-color:lightcyan;
}
            </style>
        <title>Basic banking website</title>
    </head>
    <body>
        <font face="WildWest" color="blueviolet" size="3"><strong> <h1><center>Welcome to TSF Banking Website</center></h1></strong></font>
       <div class="bg-color">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand"><p class="text-primary mb-1">TSF</p></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="index.html">Home</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="viewusers.jsp">View Users</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="transfermoney.jsp">Transfer Money</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
              <br>
                       <div id="transfer">
                     <strong> <h1>Transferred Details</h1> </div></strong>
        <%
       // String pid="";//request.getParameter("pid");
       // String cartid="";
       
       // String cid=session.getAttribute("cid").toString();
        Class.forName("com.mysql.jdbc.Driver");
        Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/tsffirst","root","root");
        Statement statement1 = con1.createStatement();
        String sql2="select t.accone,t.acctwo,t.transferredamount from transfers t";
       
        ResultSet rs = statement1.executeQuery(sql2);
        
        out.println(" &nbsp; &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;    &nbsp;  &nbsp;");
       
        out.println("<table border='5' align='center' cellspacing='2' cellpading='2'>");
        //out.println("<tr><th>Cartid</th><th>Pid</th><th>PName</th><th>Price</th><th>Quantity</th><th>Add Quan</th><th></th>");
        out.println("<tr><th>Transferred from account no</th><th>Transferred to account no</th><th>Transferred Money</th></tr>");

        while (rs.next()) { 
             
            out.println("<tr>");
            out.println("<td>"+rs.getInt(1) +"</td>");
            out.println("<td>"+rs.getInt(2) +"</td>");
              out.println("<td>"+rs.getInt(3) +"</td>");
            out.println("</tr>");
        }
            out.println("</table>");
           
        con1.close();
         
    %>
          <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
   
                       </body>
                        </div>
</html>
