package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCUtil {
	
	// 
	public static Connection getConnection() {
		try {
			Class.forName("org.h2.Driver");
			String url = "jdbc:h2:tcp://localhost/~/test";
			return DriverManager.getConnection(url, "sa", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void close(Statement stmt, Connection conn) {
		try {
			if(stmt != null)
				stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//위에서 닫았지만 혹시 모르니까 null을 넣어서 이중단속
			stmt = null;
		}
		
		try {
			if(conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn = null;
		}
	}
	
	public static void close(ResultSet rs, Statement stmt, Connection conn) {
		try {
			if(rs != null)
				rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//위에서 닫았지만 혹시 모르니까 null을 넣어서 이중단속
			rs = null;
		}
		
		try {
			if(stmt != null)
				stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//위에서 닫았지만 혹시 모르니까 null을 넣어서 이중단속
			stmt = null;
		}
		
		try {
			if(conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn = null;
		}
	}
	
}//end of class
