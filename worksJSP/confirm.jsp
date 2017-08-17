<%@include file="connect.jsp"%>

<%
	try{
		PreparedStatement ps = con.prepareStatement("select pid from shopproductstemp where userid=?");
		ps.setString(1,(String)session.getAttribute("userid"));
		ResultSet rs = ps.executeQuery();
		int pid=0;
		java.util.Date ob = new java.util.Date();
		String dt = String.valueOf(ob);
		while(rs.next())
		{
			pid=rs.getInt(1);
			PreparedStatement ps1 = con.prepareStatement("insert into shopproductsorder values(?,?,?)");
			ps1.setString(1,(String)session.getAttribute("userid"));
			ps1.setInt(2,(pid));
			ps1.setString(3,dt);
			ps1.executeUpdate();
		}
		PreparedStatement ps2 = con.prepareStatement("delete from shopproductstemp where userid=?");
		ps2.setString(1,(String)session.getAttribute("userid"));
		ps2.executeUpdate();
		out.println("<h1>Happy Shopping … :) ");
		con.close();
	}catch(Exception e){}
%>