<%@include file="connect.jsp"%>
<%
	try{
	PreparedStatement ps = con.prepareStatement("delete from shopproductstemp where pid=? and userid=?");
	ps.setInt(1,Integer.parseInt(request.getParameter("pid")));
	ps.setString(2,(String)session.getAttribute("userid"));
	ps.executeUpdate();
	response.sendRedirect("cartMng.jsp");
	con.close();
	}catch(Exception e){}
%>