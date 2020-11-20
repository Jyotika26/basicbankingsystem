<%-- 
    Document   : transfercode
    Created on : Nov 17, 2020, 12:33:59 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Basic Banking site</title>
    </head>
    <body>
        <%  
int acc1=Integer.parseInt(request.getParameter("cid"));
int acc2=Integer.parseInt(request.getParameter("cidd"));
int bal=Integer.parseInt(request.getParameter("amount"));
//out.println(acc1);
//out.println(acc2);
//out.println(bal);
try {
Class.forName("com.mysql.jdbc.Driver");
        Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/tsffirst","root","root");
       Connection con3=DriverManager.getConnection("jdbc:mysql://localhost:3306/tsffirst","root","root");
       
        Statement statement2 = con2.createStatement();
        Statement statement3 = con3.createStatement();
         
        String sql3="select currentbal from customers where caccountno='"+acc1+"'";
        ResultSet rs1 = statement2.executeQuery(sql3);
        String sql4="select currentbal from customers where caccountno='"+acc2+"'";
        ResultSet rs2 = statement3.executeQuery(sql4);
        //out.println(sql3);
        //out.println(rs1);
        
        if (bal<=0){ %>
           <script>alert('Enter positive numbers only'); 
 window.location.replace("http://localhost:8080/TSFBasicbankingwebsite/transfermoney.jsp");
         </script>
        <% }
        else if(acc1==acc2)
{ %>
 <script>alert('Cannot transfer to self'); 
 window.location.replace("http://localhost:8080/TSFBasicbankingwebsite/transfermoney.jsp");
         </script>
<%
}
    else
{
int balance1=0;
while (rs1.next()) {
balance1=rs1.getInt(1);}
//out.println("balance 1:"+balance1);

int balance2=0;
while (rs2.next()) {
balance2=rs2.getInt(1);}
//out.println("balance 2:"+balance2);

int bal1=balance1-bal;
int bal2=balance2+bal; 
//out.println("remaining bal1:"+bal1);
//out.println("remaining bal2:"+bal2);
Connection con4=DriverManager.getConnection("jdbc:mysql://localhost:3306/tsffirst","root","root");
String sql5="insert into transfers(accone,acctwo,transferredamount)values(?,?,?)";
 PreparedStatement ps=con4.prepareStatement(sql5);
 ps.setInt(1,acc1);
 ps.setInt(2,acc2);
ps.setInt(3,bal);
int i=ps.executeUpdate();
 if(i==1){
           out.println('1');
        }
statement2.addBatch("update customers set currentbal="+bal1+" where caccountno='"+acc1+"'");
statement3.addBatch("update customers set currentbal="+bal2+" where caccountno='"+acc2+"'");
statement2.executeBatch();
statement3.executeBatch();
} %>
<script>alert('Transaction has been successfully done!!'); 
 window.location.replace("http://localhost:8080/TSFBasicbankingwebsite/viewusersaftertransfer.jsp");
         </script>
<!out.println("Transaction has been successfully done.");
<%

}catch(Exception e){
    System.out.println(e);
}
%>
    </body>
</html>
