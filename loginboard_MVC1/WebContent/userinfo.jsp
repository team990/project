<%@page import="com.hk.dtos.LoginDto"%>
<%@page import="com.hk.daos.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8");%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	//수정폼으로 이동
	function updateform(seq) {
		location.href="controller.jsp?command=updateform&seq="+seq;
	}
	function deluser(seq){
		
		location.href="controller.jsp?command=deluser&seq="+seq;
	}
</script>

</head>
<body>

<h1>나의정보보기</h1>

	<table border="1">
	
	<tr>
	<th>아이디</th>
	<td>${dto.id}</td>
	</tr>
	<tr>
	<th>이름</th>
	<td>${dto.name}</td>
	</tr>
	<tr>
	<th>주소</th>
	<td>${dto.address}</td>
	</tr>
	<tr>
	<th>전화번호</th>
	<td>${dto.phone}</td>
	</tr>
	<tr>
	<th>이메일</th>
	<td>${dto.email}</td>
	</tr>
	<tr>
	<th>등급</th>
	<td>${dto.role=="manager"?"정회원":"일반회원"}</td>
	</tr>
	<tr>
	<th>가입일자</th>
	<td>${dto.regDate}</td>
	</tr>
	<tr>
	<td colspan="2">
	<input type="button" value="수정" onclick="updateform(${dto.seq})">
	<input type="button" value="탈퇴" onclick="deluser(${dto.seq})">
	<input type="button" value="메인으로 가기" onclick="location.href='usermain.jsp'">
	</td>
	</tr>
	
	</table>
</body>
</html>