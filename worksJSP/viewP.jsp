<%@ include file="adminMenu.html"%>
<%@ include file="connect.jsp"%>

<%
    PreparedStatement ps = con.prepareStatement("select * from ShopProducts");
    ResultSet rs = ps.executeQuery();
    String flg = request.getParameter("flag");
    String fl = (String)session.getAttribute("flag1");
    //out.println("<font color=red>"+fl+"</font>");
    int flag=0;
    //out.println("<h1>"+flg+"</h1>");
    //if(!flg.equals(""))
     //   int flag = Integer.parseInt(flg);
    //out.println("<h1>FLAG : "+request.getParameter("flag")+"</h1>");
    //out.println(flg);
    if(flg != null )
        flag = Integer.parseInt(flg);
    while(rs.next())
    {
        int pid = rs.getInt(1);
        String pname = rs.getString(2);
        String pcat = rs.getString(3);
        Double pprice = rs.getDouble(4);
        String pdes = rs.getString(5);
        Double pdis = rs.getDouble(6);
        String pimg = "img/"+rs.getString(7);
        String pimg1 = rs.getString(7);
        //out.println("Hello image : "+pimg1);
        if(flag == pid)
        {
            out.println(pid);
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
    <td><input type=file name=pimg ></td>
    <input type=hidden name=pimg1 value=<%=pimg1%>>
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
<form action=test.jsp method=post>
<table>
<input type=hidden name=flag value=<%=pid%>>
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
    <td><img src=<%=pimg%> name=pimg alt=<%=pname%> style="width:304px;height:228px;"></td>
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
    //out.println(fl);
    if(fl!=null && request.getParameter("pid")!=null)
    {
        int pid1 = Integer.parseInt(request.getParameter("pid"));
        //out.println("<h3>pid : "+pid1+"</h1>");
    if(fl.equals("updated") && pid1 == pid)
        out.println("<font color=red>Product updated successfully</font>");
    }
    }
%>


//base64