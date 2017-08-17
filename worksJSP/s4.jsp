<jsp:useBean id="ob" class="p1.Student" scope="session"/>
<jsp:setProperty name="ob" property="*"/>
    Name:<%=ob.getName()%><br>
    College:<%=ob.getClg()%><br>
    Phone No:<%=ob.getPhnNo()%>
