<%@include file="connect.jsp"%>
<html>
    <body>
            <a href=userHome.jsp>Home</a>|
            <a href=cartMng.jsp>Cart Management
            <%
                PreparedStatement pss = con.prepareStatement("Select count(*) from shopProductsTemp where userid=?");
                pss.setString(1,(String)session.getAttribute("userid"));
                ResultSet rss = pss.executeQuery();
                rss.next();
                int cart = Integer.parseInt(rss.getString(1));
                out.print("("+cart+")");        
            %></a>|
            <a href=profile.jsp>Profile</a>|
            <a href=logout.jsp>Logout</a>
    </body>
</html>
   