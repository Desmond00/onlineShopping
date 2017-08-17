<%@ include file="adminMenu.html"%>
<%@ include file="connect.jsp"%>
<form action=addPS.jsp method=post>

<%      int pid=0;
        try{
            PreparedStatement ps = con.prepareStatement("select max(pid) from ShopProducts");
            ResultSet rs = ps.executeQuery();
            if(rs.next())
                pid = rs.getInt(1);
            pid++;
            con.close();
        }catch(Exception e){}
%>
<table>
<tr>
    <td>ProductID</td>
    <td><%=pid%><input type=hidden name=pid value=<%=pid%>></td>
</tr>
<tr>
    <td>Product Name</td>
    <td><input type=text name=pname></td>
</tr>
<tr>
    <td>Product Category</td>
    <td><input type=text name=pcat></td>
</tr>
<tr>
    <td>Product Price</td>
    <td><input type=text name=pprice></td>
</tr>
<tr>
    <td>Description</td>
    <td><textarea name=pdes rows=4 cols=14></textarea></td>
</tr>
<tr>
    <td>Discount</td>
    <td><input type=text name=pdis maxlength=3 size=2>%</td>
</tr>
<tr>
    <td>Image</td>
    <td><input type=file name=pimg></td>
</tr>
<tr>
    <td colspan=2 align="center">
    <input type=submit value=Insert></td>
</tr>
</table>
</form>
</body>
</html>


    