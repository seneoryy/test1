package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JdbcUtil {
	public static Connection getConnection() {
		Connection conn=null;
		try {
			Context ctx=new InitialContext();
			Context envCtx=(Context)ctx.lookup("java:comp/env");
			DataSource ds=(DataSource)envCtx.lookup("jdbc/MysqlDB");
			conn=ds.getConnection();
			conn.setAutoCommit(false);
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return conn;
	}
	
	public static void close(Connection conn) {
		try {
			conn.close();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static void close(Statement stmt) {
		try {
			stmt.close();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			rs.close();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static void commit(Connection conn) {
		try {
			conn.commit();
			System.out.println("commit success");
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			conn.rollback();
			System.out.println("rollback success");
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}







