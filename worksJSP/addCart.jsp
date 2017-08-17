<%@include file="connect.jsp"%>
	<%
		try{
			PreparedStatement ps = con.prepareStatement("insert into shopProductstemp values(?,?)");
			ps.setInt(2,Integer.parseInt(request.getParameter("pid")));
            //out.println(request.getParameter("pid"));
			ps.setString(1,(String)session.getAttribute("userid"));
			ps.executeUpdate();
			//out.println("<h3>"+request.getParameter("pid")+(String)session.getAttribute("userid")+"</h3>");
			con.close();
            String cat=request.getParameter("pcat");
			response.sendRedirect("searchCart.jsp?pcat="+cat);
		}
catch(Exception e){out.println(e);}
%>