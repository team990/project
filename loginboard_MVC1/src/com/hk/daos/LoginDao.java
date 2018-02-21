package com.hk.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.transform.Result;

import com.hk.dbinfo.DataBase;
import com.hk.dtos.LoginDto;
import com.sun.org.apache.bcel.internal.generic.Select;
import com.sun.org.apache.xml.internal.dtm.DTMDOMException;

public class LoginDao extends DataBase{

	public LoginDao() {
		super();

		//802015
	}

	//--------------------------관리자 기능

	//회원전체정보조회
	public List<LoginDto> getAllUserStatus(){
		//arraylist<LoginDto> list = new ArrayList<LoginDto>();
		List<LoginDto> list = new ArrayList<LoginDto>();
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		//		String sql = " SELECT SEQ,ID,PASSWORD,NAME,ADDRESS,PHONE,EMAIL,ROLE,REGDATE,ENABLED FROM LOGINBOARD ORDER BY REGDATE DESC ";

		//	 concatenation을 할 때, 스트링 버퍼를 사용하는 것이 메모리 효율이 좋다. 객체 한번만 생성.		
		StringBuffer sb = new StringBuffer();
		sb.append(" SELECT SEQ,ID,PASSWORD,NAME,ADDRESS,PHONE,EMAIL,ROLE,REGDATE,ENABLED ");
		sb.append(" FROM LOGINBOARD ORDER BY REGDATE DESC ");

		try {
			conn=getConnection();
			log("2단계");

			psmt=conn.prepareStatement(sb.toString());
			log("3단계");

			rs=psmt.executeQuery();
			log("4단계");

			while(rs.next()) {

				int i = 1;

				LoginDto dto = new LoginDto();

				dto.setSeq(rs.getInt(i++));
				dto.setId(rs.getString(i++));
				dto.setPassword(rs.getString(i++));
				dto.setName(rs.getString(i++));
				dto.setAddress(rs.getString(i++));
				dto.setPhone(rs.getString(i++));
				dto.setEmail(rs.getString(i++));
				dto.setRole(rs.getString(i++));
				dto.setRegDate(rs.getDate(i++));
				dto.setEnabled(rs.getString(i++));

				list.add(dto);

				System.out.println(dto);

			}
			log("5단계");

		} catch (SQLException e) {
			System.out.println("jdbc 실패:getAllUserStatus()"+getClass());
			e.printStackTrace();
		}finally {
			close(rs, psmt, conn);
		}


		return list;


	}

	//사용중인 회원 전체 조회

	public List<LoginDto> getAllUser(){
		//arraylist<LoginDto> list = new ArrayList<LoginDto>();
		List<LoginDto> list = new ArrayList<LoginDto>();
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		//			String sql = " SELECT SEQ,ID,PASSWORD,NAME,ADDRESS,PHONE,EMAIL,ROLE,REGDATE,ENABLED FROM LOGINBOARD ORDER BY REGDATE DESC ";

		//		 concatenation을 할 때, 스트링 버퍼를 사용하는 것이 메모리 효율이 좋다. 객체 한번만 생성.		
		StringBuffer sb = new StringBuffer();

		sb.append(" SELECT SEQ,ID,PASSWORD,NAME,ADDRESS,PHONE,EMAIL,ROLE,REGDATE,ENABLED ");
		sb.append(" FROM LOGINBOARD WHERE ENABLED='Y' ORDER BY REGDATE DESC ");

		try {
			conn=getConnection();
			log("2단계");

			psmt=conn.prepareStatement(sb.toString());
			log("3단계");

			rs=psmt.executeQuery();
			log("4단계");

			while(rs.next()) {

				int i = 1;

				LoginDto dto = new LoginDto();

				dto.setSeq(rs.getInt(i++));
				dto.setId(rs.getString(i++));
				dto.setPassword(rs.getString(i++));
				dto.setName(rs.getString(i++));
				dto.setAddress(rs.getString(i++));
				dto.setPhone(rs.getString(i++));
				dto.setEmail(rs.getString(i++));
				dto.setRole(rs.getString(i++));
				dto.setRegDate(rs.getDate(i++));
				dto.setEnabled(rs.getString(i++));

				System.out.println(dto);
				list.add(dto);


			}
			log("5단계");

		} catch (SQLException e) {
			System.out.println("jdbc 실패:getAllUser()"+getClass());
			e.printStackTrace();
		}finally {
			close(rs, psmt, conn);
		}


		return list;


	}

	//회원등급변경 : role --> "admin","manager"나 "user"등급으로 변경

	public boolean updateRole(int seq, String role) {

		int count = 0;

		Connection conn = null;

		PreparedStatement psmt = null;

		String sql = " update loginboard set role=? where seq=? ";

		try {
			conn = getConnection();
			log("2단계");
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, role);
			psmt.setInt(2, seq);
			log("3단계");
			count = psmt.executeUpdate(); // 실행된 결과는 테이블이 수정된 row의 갯수를 반환 -> 1 row 성공 . count = 1

		} catch (SQLException e) {
			log("jdbc"+getClass(),e);

		}finally {

			close(null, psmt, conn);	
		}

		return count>0?true:false;


	}


	//-------------------------사용자 기능

	//회원가입 : insert 실행! -> 사용자에게 받아야할 값은 id,pw,name,address,phone,email,

	public boolean insertUser(LoginDto dto) {

		int count = 0 ;

		Connection conn = null;
		PreparedStatement psmt = null;

		String sql = " insert into loginboard values(loginboard_seq.nextval,?,?,?,?,?,?,'user',sysdate,'Y') " ;

		try {
			conn = getConnection();
			System.out.println("2단계 성공");
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPassword());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getAddress());
			psmt.setString(5, dto.getPhone());
			psmt.setString(6, dto.getEmail());
			System.out.println("3단계 성공");
			count = psmt.executeUpdate();
			System.out.println("4단계 성공");
		} catch (SQLException e) {
			log("jdbc",e);
		}finally {
			close(null, psmt, conn);
		}
		return count>0?true:false;
	}


	//로그인 : ID와 PW가 일치하는지요! --> id 와 pw 둘다 true인지 확인!

	public LoginDto getLogin(String id,String password) {

		LoginDto dto = new LoginDto();

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		String sql = " select seq, id, name, role, enabled, regdate from loginboard where id=? and password=? and enabled='Y' " ; 

		try {
			conn = getConnection();
			System.out.println("2단계 성공");
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, password);
			System.out.println("3단계 성공");
			rs=psmt.executeQuery();
			System.out.println("4단계 성공");
			while(rs.next()) {

				int i = 1;

				dto.setSeq(rs.getInt(i++));
				dto.setId(rs.getString(i++));
				dto.setName(rs.getString(i++));
				dto.setRole(rs.getString(i++));
				dto.setEnabled(rs.getString(i++));
				dto.setRegDate(rs.getDate(i++));
			}

			System.out.println("5단계");

		} catch (SQLException e) {
			log("JDBC",e);

			e.printStackTrace();
		}finally {
			close(rs, psmt, conn);

		}


		return dto;

	}



	//내 정보조회

	public LoginDto getUser(int seq) {

		LoginDto dto = new LoginDto();

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		String sql = " select seq, id, name, address, phone, email, role, enabled, regdate from loginboard where seq=? " ; 

		try {
			conn = getConnection();
			System.out.println("2단계 성공");
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("3단계 성공");
			rs=psmt.executeQuery();
			System.out.println("4단계 성공");
			while(rs.next()) {

				int i = 1;

				dto.setSeq(rs.getInt(i++));
				dto.setId(rs.getString(i++));
				dto.setName(rs.getString(i++));
				dto.setAddress(rs.getString(i++));
				dto.setPhone(rs.getString(i++));
				dto.setEmail(rs.getString(i++));
				dto.setRole(rs.getString(i++));
				dto.setEnabled(rs.getString(i++));
				dto.setRegDate(rs.getDate(i++));
			}

			log("5단계");

		} catch (SQLException e) {
			log("JDBC",e);

			e.printStackTrace();
		}finally {
			close(rs, psmt, conn);

		}


		return dto;

	}




	//내 정보수정:주소,전화번호,이메일 만

	public boolean updateUser(LoginDto dto) {
		int count = 0;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		String sql = " update loginboard set address=?, phone=?,email=? where seq=? " ;
		
		try {
			conn = getConnection();
			System.out.println("2단계 성공");
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getAddress());
			psmt.setString(2, dto.getPhone());
			psmt.setString(3, dto.getEmail());
			psmt.setInt(4, dto.getSeq());
			System.out.println("3단계 성공");
			count = psmt.executeUpdate();
			System.out.println("4단계 성공");
		} catch (SQLException e) {
			System.out.println("정보수정 실패");
			e.printStackTrace();
		}finally {
			close(null, psmt, conn);
			
		}
		
		return count>0?true:false;
		
	}
	
	//회원탈퇴 : enabled -----> 'Y'를 'N' 으로 undate하기

	public boolean delUser(int seq) {
		int count = 0;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		String sql = " update loginboard set enabled='N' where seq=? ";
		
		try {
			conn = getConnection();
			System.out.println("2단계 성공");
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1,seq);
			System.out.println("3단계 성공");
			count = psmt.executeUpdate();
			System.out.println("4단계 성공");
		} catch (SQLException e) {
			System.out.println("회원탈퇴 실패");
			e.printStackTrace();
		}finally {
			close(null, psmt, conn);
		}
		return count>0?true:false;
	}
	
	//아이디 중복체크: 테이블에 아이디가 존재하는지 조회

	public LoginDto idChk(String id) {
		
		LoginDto dto = new LoginDto();
		
		Connection conn = null;
		
		PreparedStatement psmt = null;
		
		ResultSet rs = null;
		
		String sql = " select id from loginboard where id=? ";
		
		try {
			conn = getConnection();
			log("2단계");
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			log("3단계");
			rs = psmt.executeQuery();
			log("4단계");
			
			while (rs.next()) {
				dto.setId(rs.getString(1));
			}
			log("5단계");
		} catch (SQLException e) {
			System.out.println(" 아이디 중복 체크 실패");
			e.printStackTrace();
		}finally {
			close(rs, psmt, conn);
		}
		
		return dto;
	}
	
}
