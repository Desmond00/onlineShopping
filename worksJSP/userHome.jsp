<%@include file="userMenu.jsp"%>
<hr>
<br>
<jsp:useBean id="ob" class="user.User" scope="session"/>
<%
    //if(session.getAttribute("userName") == null)
        session.setAttribute("userName",ob.getName());
    session.setAttribute("userid",ob.getEmail());
%>
<h3>Welcome <%=session.getAttribute("userName")%></h3>
<form action=searchCart.jsp method=post>
        Category
        <select name="pcat">
        <option value="" disabled="disabled">Choose category</option>
        <%
        try{
            PreparedStatement ps = con.prepareStatement("select distinct(PCATEGORY) from shopproducts");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                String pcat=rs.getString(1);
        %>
            <option value=<%=pcat%>><%=pcat%></option>    
        <%
            }con.close();
        }
        catch(Exception e){out.println(e);}
        %>
        <input type=submit value=search>
        </select>
</form>