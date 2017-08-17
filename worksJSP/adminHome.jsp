<%@ include file="adminMenu.html"%>
<% String nm = (String)session.getAttribute("uid");
out.println("<h3>Welcome "+nm);
%>