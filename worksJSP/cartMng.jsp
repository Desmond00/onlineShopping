<%@include file="userMenu.jsp"%>
<form action="confirm.jsp" method=post>
<%
	try{
		PreparedStatement ps = con.prepareStatement("select * from shopproductstemp S,shopProducts Sp where S.userid=? and S.pid=Sp.pid");
		ps.setString(1,(String)session.getAttribute("userid"));
		ResultSet rs = ps.executeQuery();
%>
<table border = 1><tr><th>Pid</th><th>Pcat</th><th>Pname</th><th>Price</th><th>Description</th><th>Discount</th><th>Image</th><th></th><tr>
<%
	double tprice = 0;
	int pid;
	String pcat,pname,pdes,img;
	double price,discount;
	while(rs.next())
	{
		pid=rs.getInt("pid");
		//out.println("before invalid column name");
		pcat=rs.getString("pcategory");
		pname = rs.getString("pname");
		price = rs.getDouble("pprice");
		pdes = rs.getString("pdescription");
		discount = rs.getDouble("pdiscount");
		img = "img/"+rs.getString("pimage");
		tprice += price*(1-0.01*discount);
%>
<tr><td><%=pid%></td><td><%=pcat%></td><td><%=pname%></td><td><%=price%></td><td><%=pdes%></td><td><%=discount%></td><td><img src=<%=img%> height=200 width=200></td><td><a href=removeCart.jsp?pid=<%=pid%>>Remove from cart</a></td></tr>
<%
	}
	con.close();
%>
<tr><td colspan=7>Total price Rs.<%=tprice%>/-</td></tr>
<tr><td colspan=8><input type=submit value=CONFIRM><td></tr></table>
<%
	}catch(Exception e){out.println(e);}
%>
</form>
