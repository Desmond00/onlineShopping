<%
    session.setAttribute("image",request.getParameter("pimg"));
    //out.println(request.getParameter("pimg"));
    response.sendRedirect("viewP.jsp?flag="+request.getParameter("flag"));
%>