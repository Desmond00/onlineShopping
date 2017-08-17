package connect;
import java.sql.*;

public class Conn 
{
    Connection con = null;
    public Connection c1()
    {
        try{
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","123456");
        }
        catch(Exception e){}
        return con;
    }
}