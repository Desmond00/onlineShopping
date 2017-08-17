<%@include file="userMenu.jsp"%>
<head>
    <style>tr:hover{background-color:#f5f5f5}</style>
</head>
<body>
<center>
<%
	try{
        PreparedStatement ps = con.prepareStatement("select * from shopproducts where pcategory=?");
		ps.setString(1,(String)request.getParameter("pcat"));
		ResultSet rs = ps.executeQuery();
		int pid;
		double pprice,pdis;
		String pcat,pname,pdes,pimg;
		//String ppid;
%>
<table border="1"><tr><th>ProductID</th><th>Name</th><th>Category</th><th>Price</th><th>Description</th><th>Discount</th><th>Image</th></tr>
		<%while(rs.next())
		{
			pid=rs.getInt(1);
			pname=rs.getString(2);
			pcat=rs.getString(3);
			pprice=rs.getDouble(4);
			pdes=rs.getString(5);
			pdis=rs.getDouble(6);
			pimg=rs.getString(7);
           // out.println(pprice);
			//ppid=String.valueOf(pid);
			int f=0;
			PreparedStatement pst=con.prepareStatement("select * from ShopProductstemp where Userid=? and pid=?");
			pst.setString(1,(String)session.getAttribute("userid"));
			pst.setInt(2,pid);
			ResultSet rst=pst.executeQuery();
		%>
		<form action=addCart.jsp method=get>
		<tr>
		<td><%=pid%></td>
		<td><%=pname%></td>
		<td><%=pcat%></td>
		<td><%=pprice%></td>
		<td><%=pdes%></td>
		<td><%=pdis%></td>
		<td><img src=./img/<%=pimg%> height=100 width=100></img></td>
		<input type=hidden name="pid" value=<%=pid%>>
        <input type=hidden name=pcat value=<%=pcat%>>
        <td>
		<%
			//out.println("<h3>"+(String)session.getAttribute("userid")+pid+"</h3>");
		//out.println("<h3>"+pid+"</h3>");
		//if(f==1)
		if(rst.next())
			out.println("Product added in your cart");
		else
			{
		%>
		<input type=submit value="ADD to cart">
		<%
		}
		%>
		</td>
		</tr>
		</form>
		<%
		}
		con.close();
		%>
		</table></center>
		
		<%
	    }catch(Exception e){out.println(e);}
%>
</body>