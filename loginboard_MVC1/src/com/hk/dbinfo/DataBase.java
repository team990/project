package com.hk.dbinfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DataBase {

	// 생성자에 1단계 구현하기
	public DataBase() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			log("1단계");
		} catch (ClassNotFoundException e) {
			log("1단계",e);
		}

	}

	//jdbc 성공했을 때. 메시지 출력 하는 메서드를 만든다. 모든 단계에 만들어주면 귀찮아지니까!
	public void log(String msg) {
		System.out.println(msg +":성공!!"+getClass());

		
	}

	//jdbc 실패했을 때.
	public void log(String msg, Exception e ) {
		System.out.println(msg+":실패!!"+getClass()+":"+e);

	}

	//2단계 커넥션타입의 클래스.  

	public Connection getConnection() throws SQLException {
		Connection conn = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user="hk";
		String password="hk";

		conn=DriverManager.getConnection(url, user, password);

		
		return conn;

	}

	//6단계
	public void close(ResultSet rs, PreparedStatement psmt, Connection conn) {

		try {
			if(rs!=null) {
				rs.close();
			}
			if(psmt!=null) {
				psmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
			log("6단계");
		} catch (SQLException e) {
			e.printStackTrace();
			log("6단계",e);
		}

	}

}