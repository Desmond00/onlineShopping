<jsp:useBean id="ob" class="p1.Student" scope="session"/>
<jsp:setProperty name="ob" property="*"/>
<form action=s4.jsp method=post>
    Phone No. <input type=text name=phnNo><br>
    <input type=submit value=submit>
</form>