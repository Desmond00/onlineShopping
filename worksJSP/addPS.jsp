<%@ include file="adminMenu.html"%>
<%@ include file="connect.jsp"%>
<%
    try{
        String flag = request.getParameter("flag"); 
        //out.println("<h3>Ok</h3>");
        int flag1=0;
        if(flag != null)
            flag1 = Integer.parseInt(flag);
        PreparedStatement ps;
        String flg="";
        if(flag1 != 0)
            {ps = con.prepareStatement("update shopproducts set PID=?, PNAME=?, PCATEGORY=?, PPRICE=?, PDESCRIPTION=?, PDISCOUNT=?, PIMAGE=? where pid=?");
            flg = "updated";
            }
        else
            ps = con.prepareStatement("insert into ShopProducts values(?,?,?,?,?,?,?)");
        ps.setInt(1,Integer.parseInt(request.getParameter("pid")));
        ps.setString(2,request.getParameter("pname"));
        ps.setString(3,request.getParameter("pcat"));
        ps.setDouble(4,Double.parseDouble(request.getParameter("pprice")));
        ps.setString(5,request.getParameter("pdes"));
        ps.setDouble(6,Double.parseDouble(request.getParameter("pdis")));
        if (request.getParameter("pimg") == "")
            ps.setString(7,request.getParameter("pimg1"));
        else
            ps.setString(7,request.getParameter("pimg"));
        //out.println("<h1>img : "+request.getParameter("pimg")+"</h1>");
        //out.println("<h3>img1 : "+request.getParameter("pimg1")+"<h3>");
        if(flag1 != 0)
            ps.setInt(8,Integer.parseInt(request.getParameter("pid")));
        int t=ps.executeUpdate();
        session.setAttribute("flag1",flg);
%>
<%        
        if(flag1 != 0)
        {
            int pid1 = Integer.parseInt(request.getParameter("pid"));
            if(t>0)
                response.sendRedirect("viewP.jsp?pid="+pid1);
        }
        else
        {
            if(t>0)
                out.println("<h3>Product added succesfully");
        }
        con.close();
    }
    catch(Exception e){out.println(e);}
%>