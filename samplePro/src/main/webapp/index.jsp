<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<h2>Hello</h2>

</body>
<form action="process.jsp" method="post">

<table border="2">
<tr>
<td>  </td>
<td>ID</td>
<td>NAME</td>
<td>Price</td>
<td>Quantity</td>
</tr>

<%
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/product";
	String username="root";
	String password="root@123";
	String query="select * from product_details";
	Connection conn=DriverManager.getConnection(url,username,password);
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery(query);
	while(rs.next())
{

%>
	   <tr><td><input type="checkbox" name="p_check" /></td>
	   <td><input type="text" name="p_id" value="<%out.print(rs.getString("product_id"));%>" /></td>
	   <td><input type="text" name="p_name" value="<%out.print(rs.getString("product_name"));%>" /></td>
	   <td><input type="text" name="p_price" value="<%out.print(rs.getInt("price"));%>" /></td>
	   <td><input type="text" name="p_quant" /></td>
	   <!-- <td><input type="text" name="p_id" value="<%out.print(rs.getInt("total_cost"));%>"/></td> -->
	   </tr>
       
        <%
       // System.out.println("done");
}
%>
    </table>
    <input type="submit" value="Proceed" name="process"/>
    <%
    
    }
catch(Exception e)
{
    e.printStackTrace();
    }

%>

</form>
</html>