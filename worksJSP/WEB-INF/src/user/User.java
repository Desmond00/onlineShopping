package user;
import connect.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class User
{
    String email,pass,name,addr,phnNo;
    public void setEmail(String email)
    {
        this.email=email;
    }
    public String getEmail()
    {
        return email;
    }
    public void setPass(String pass)
    {
        this.pass=pass;
    }
    public String getPass()
    {
        return pass;
    }
    public void setName(String name)
    {
        this.name=name;
    }
    public String getName()
    {
        return name;
    }
    public void setAddr(String addr)
    {
        this.addr=addr;
    }
    public String getAddr()
    {
        return addr;
    }
    public void setPhnNo(String phnNo)
    {
        this.phnNo=phnNo;
    }
    public String getPhnNo()
    {
        return phnNo;
    }
    public int insert()throws IOException
    {
        int t=0;
        PrintWriter pw = null;
        try{
            Conn ob=new Conn();
            Connection con=ob.c1();
            PreparedStatement ps = con.prepareStatement("insert into ShopUser values(?,?,?,?,?)");
            ps.setString(1,email);
            ps.setString(2,pass);
            ps.setString(3,name);
            ps.setString(4,addr);
            ps.setString(5,phnNo);
            t=ps.executeUpdate();
            con.close();
        }
        catch(Exception e)
        {
            HttpServletResponse res;
            pw = res.getWriter();
            pw.println(e);
        }
        return t;
    }
    public int validate()
    {
        int t=0;
        try{
            Conn ob=new Conn();
            Connection con=ob.c1();
            PreparedStatement ps = con.prepareStatement("select * from shopUser where email=? and password=?");
            ps.setString(1,email);
            ps.setString(2,pass);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
                t=1;
            con.close();
        }catch(Exception e){}
        return t;
    }
}