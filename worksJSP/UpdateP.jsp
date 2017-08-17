<%@include file="adminMenu.html"%>
<%@include file="connect.jsp"%>

<%
    int flag = Integer.parseInt(request.getParameter("flag"));
    PreparedStatement ps = con.prepareStatement("select * from ShopProducts");
    ResultSet rs = ps.executeQuery();
    while(rs.next())
    {
        int pid=rs.getInt(1);
        String pname = rs.getString(2);
        String pcat = rs.getString(3);
        Double pprice = rs.getDouble(4);
        String pdes = rs.getString(5);
        Double pdis = rs.getDouble(6);
        String pimg = "img/"+rs.getString(7);

        if(pid == flag)
        {
%>
<form action=addPS.jsp method=post>
<table>
<input type=hidden name=flag value=<%=flag%>>
<tr>
    <td>ProductID</td>
    <td><%=pid%><input type=hidden name=pid value=<%=pid%>></td>
</tr>
<tr>
    <td>Product Name</td>
    <td><input type=text name=pname value=<%=pname%>></td>
</tr>
<tr>
    <td>Product Category</td>
    <td><input type=text name=pcat value=<%=pcat%>></td>
</tr>
<tr>
    <td>Product Price</td>
    <td><input type=text name=pprice value=<%=pprice%>></td>
</tr>
<tr>
    <td>Description</td>
    <td><textarea name=pdes rows=4 cols=14><%=pdes%></textarea></td>
</tr>
<tr>
    <td>Discount</td>
    <td><input type=text name=pdis maxlength=3 size=2 value=<%=pdis%>>%</td>
</tr>
<tr>
    <td>Image</td>
    <td><input type=file name=pimg value=<%=pimg%>></td>
</tr>
<tr>
    <td colspan=2 align="center">
    <input type=submit value=Update></td>
</tr>
</table>
</form>

<%
    }
    else
    {
%>
<html>
<body>
<form action=updatePS.jsp method=post>
<table>
<tr>
    <td>ProductID  :</td>
    <td><%=pid%></td>
</tr>
<tr>
    <td>Product Name : </td>
    <td><%=pname%></td>
</tr>
<tr>
    <td>Product Category : </td>
    <td><%=pcat%></td>
</tr>
<tr>
    <td>Product Price : </td>
    <td><%=pprice%></td>
</tr>
<tr>
    <td>Description : </td>
    <td><textarea name=pdes rows=4 cols=14 ><%=pdes%></textarea></td>
</tr>
<tr>
    <td>Discount</td>
    <td><%=pdis%>%</td>
</tr>
<tr>
    <td>Image</td>
    <td><img src=<%=pimg%> alt=<%=pname%> style="width:304px;height:228px;"></td>
</tr>
<tr>
    <td colspan=2 align="center">
    <input type=submit value=Edit></td>
</tr>
</table>
</form>
</body>
</html>
<%
        }
    }
%>