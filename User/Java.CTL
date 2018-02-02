#TITLE=30.Microshaoft Java
#INFO
New Cliptext library
#SORT=n

#T=JDBC SQL
import java.sql.*;
import com.microsoft.sqlserver.jdbc.*;

public class Class1
{
	public static void main(String[] args)
	{
		String connectionUrl = "jdbc:sqlserver://192.168.1.202:1433;databaseName=VasCenter;User=sa;Password=sa@tie";
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try
		{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(connectionUrl);
			String SQL = "SELECT 'asdas' as F;";
			stmt = con.createStatement();
			rs = stmt.executeQuery(SQL);
			displayRow("test", rs);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if (rs != null)
			{
				try 
				{ 
					rs.close();
				}
				catch (Exception e)
				{
				}
			}
			if (stmt != null)
			{
				try
				{
					stmt.close();
				}
				catch (Exception e)
				{
				}
			}
			if (con != null)
			{	
				try
				{
					con.close();
				}
				catch (Exception e)
				{
				}
			}
		}
	}

	public static void displayRow(String title, ResultSet rs)
	{
		try
		{
			System.out.println(title);
			while (rs.next())
			{
				System.out.println(rs.getString("F")); //+ " : " + rs.getString("Name"));
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}


#