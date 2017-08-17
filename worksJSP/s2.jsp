<jsp:useBean id="ob" class="p1.Student" scope="session"/>
<jsp:setProperty name="ob" property="*"/>
<form action=s3.jsp method=post>
    College<input type=text name=clg>
    <br><input type=submit value=submit>
</form>