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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <style>
            #transfer{
                text-align: center;
                font-family: cursive;
                font-size: 10px;
                color:blue;
                font-style: italic;
            }
            .formss{
                border: 2px solid graytext;
                height: 25px;
                width:20px;
                margin: auto;
            }
     .container {
         border: 3px solid #AF9FF8;
    margin-left:500px;
    margin-top: 5px;
    max-width: 350px;
    padding: 11px;
    background-color:#AFF4EF;
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
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="index.html">Back <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="viewusers.jsp">View Users</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="viewusersaftertransfer.jsp">View updated account</a>
      </li>
    </ul>
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
        <%  while(resultset.next()){ %>
            <option value='<%=resultset.getInt(2)%>'><%=resultset.getInt(2)%>--<%=resultset.getString(3)%>
            
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
        <%  while(resultset1.next()){ %>
            <option value='<%=resultset1.getInt(2)%>'><%=resultset1.getInt(2)%>--<%=resultset1.getString(3)%></option>
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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
    
</html>
