package pic_shop.com.dao;
import java.sql.*;
public class SqlConnection {

	static Connection conn;
	static String url = "jdbc:mysql://127.0.0.1:3306/pic_shop";
	static String Drvier ="com.mysql.cj.jdbc.Driver";
	static String id = "root";
	static String pw = "mysql";
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException{
		Class.forName(Drvier);
		conn = DriverManager.getConnection(url,id,pw);
		
		return conn;
	}
}
