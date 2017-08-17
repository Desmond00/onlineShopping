<jsp:useBean id="ob" class="user.User" scope="session"/>
<jsp:setProperty name="ob" property="*"/>
<%
int t = ob.validate();
if(t>0)
{
    response.sendRedirect("userHome.jsp");
    session.setAttribute("userid",request.getParameter("email"));
    session.setAttribute("cart",0);
}
else
{
%>
<font color=red>Invalid UserID or Password</font>
<br>
<%@include file="ulogin.html" %>
<%
}
%>