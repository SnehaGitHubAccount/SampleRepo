<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Welcome on Process page </h2>

<%
	try{
	String[] p_checkarr = request.getParameterValues("p_check");
	String[] p_namearr = request.getParameterValues("p_name");
	String[] p_pricearr = request.getParameterValues("p_price");
	String[] p_quant = request.getParameterValues("p_quant");
	int lenght=p_checkarr.length;
	System.out.println(lenght);

%>
<form action="CalculateTotal" method="post">
<table>
<tr>
<th>Product Name</th>
<th>Price</th>
<th>Quantity</th>
<th>Total</th>
</tr>
<%
for(int i=0;i<lenght;i++)
{
%>	
<tr>
<td>	
<input type="text" value="<%=p_namearr[i] %>" name="product">
</td>
<td>
<input type="text" value="<%=p_pricearr[i] %>" name="price">
</td>
<td>
<input type="text" value="<%=p_quant[i]%>" name="quantity">
</td>
<td>
<input type="text" value="<%=Integer.parseInt(p_pricearr[i])*Integer.parseInt(p_quant[i]) %>" name="total">
</td>
</tr>
<%} %>	
<tr>
<td>
<input type="submit" value="Place Order">
</td>
</tr>	
</table>
</form>

<%	
}
catch(Exception e)
{

}
%>
</body>
</html>
