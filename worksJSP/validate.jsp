<%@ include file="connect.jsp"%>
<%
try{
    PreparedStatement ps = con.prepareStatement("select * from shopAdmin where userID=? and password=?");
    ps.setString(1,request.getParameter("uid"));
    ps.setString(2,request.getParameter("pwd"));
    out.println("userid : "+request.getParameter("uid"));
    out.println("password : "+request.getParameter("pwd"));
    //out.println("<h3>uid : "+request.getParameter("uid")+" pwd : "+request.getParameter("pwd"));
    ResultSet rs = ps.executeQuery();    
    if(rs.next())
    {
        session.setAttribute("uid",rs.getString(1));
        response.sendRedirect("adminHome.jsp");
    }
    else
    {
%>
<%@ include file="alogin.html"%>
<font color=red>Invalid User ID or Password</font>
<% 
    }con.close();
}catch(Exception e){out.println(e);}
%>