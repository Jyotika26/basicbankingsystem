<%-- 
    Document   : transfermoney
    Created on : Nov 17, 2020, 11:54:43 AM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;"%>
<%ResultSet resultset =null;%>
<%ResultSet resultset2 =null;%>
<%ResultSet resultset1 =null;%>
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
            .formss{
                border: 2px solid graytext;
                height: 25px;
                width:20px;
                margin: auto;
            }
            .bg-img {
    background-image: url("bank1.jpg");

    /* Full height */
    height:500px; 

    /* Center and scale the image nicely 
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover; */
}
     .container {
         border: 3px solid #AF9FF8;
    margin-left:550px;
    margin-top: 5px;
    max-width: 350px;
    padding: 11px;
    padding-top:1px;
    background-color:rgba(194, 223, 218, 0.932);
     }

input[type=number]{
    width:100px;
    height: 15px;
    padding: 15px;
    margin-top:5px;
    border: none;
    background:white;
}
        </style>
    
    
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
     <a class="nav-link" href="viewusersaftertransfer.jsp">View transfer Details</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
         <br>
         <div class="bg-img">
             <div id="transfer">
                 <strong> <h1>Transfer Money</h1> </div></strong>
        <form action='transfercode.jsp'>
            <div class="container mt-5">            
                            <%
      
         try{
Class.forName("com.mysql.jdbc.Driver");
 Connection con3=DriverManager.getConnection("jdbc:mysql://localhost:3306/tsffirst","root","root");

       Statement statement = con3.createStatement() ;

       resultset =statement.executeQuery("select * from customers") ;
      
%>
</br> </br> 

   <font face="Comic sans MS" color="black" size="3"><strong>Select person:</strong></font> &nbsp; &nbsp;
        <select name="cid">
            <option value="none" selected disabled hidden> 
          Select an Option 
      </option> 
            
        <%  while(resultset.next()){ %>
            <option value='<%=resultset.getInt(2)%>'><%=resultset.getString(3)%>
            
            </option>
        <% } %>
        </select>
<%
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>

<%
    try{
Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tsffirst","root","root");

       Statement statement1 = con.createStatement() ;

       resultset1 =statement1.executeQuery("select * from customers") ;
 
%>
<br> <br>
<div>
<font face="Comic sans MS" color="black" size="3"><strong>Transfer to:</strong></font> &nbsp; &nbsp; <select name="cidd">
     <option value="none" selected disabled hidden> 
          Select an Option 
      </option> 
        <%  while(resultset1.next()){ %>
            <option value='<%=resultset1.getInt(2)%>'><%=resultset1.getString(3)%></option>
        <% } %>
        </select>
        <%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
</div>
<br>
<font face="Comic sans MS" color="black" size="3"><strong>Transfer Amount: </strong></font>&nbsp; &nbsp; <input type="number" name='amount' id='amount'/>
<br><br>
<center><input class="btn btn-primary" type="submit" value="Submit"></center>
            </div>
        </form>
         </div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </div>  
  </body>
    
</html>
