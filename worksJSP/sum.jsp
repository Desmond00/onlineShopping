<jsp:useBean id="ob" class="p1.Add" scope="page" />
<jsp:setProperty name="ob" property="*"/>
First Number : <jsp:getProperty name="ob" property="fno"/>
<br><br>
Second Number : <%=ob.getSno()%>
<br><br>
Sum :<%=ob.Addition()%>