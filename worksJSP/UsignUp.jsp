<jsp:useBean id="ob" class="user.User" scope="session"/>
<jsp:setProperty name="ob" property="*"/>
<%
    int t=ob.insert();
    //out.println(t);
    if(t>0)
        out.println("<h3>Registration successfull</h3>");
%>
<a href=index.html>go to loginPage</a>