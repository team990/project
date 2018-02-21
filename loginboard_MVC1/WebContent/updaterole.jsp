<%@page import="com.hk.dtos.LoginDto"%>
<%@page import="com.hk.daos.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원등급변경</h1>
	<form action="controller.jsp" method="post">
		<input type="hidden" name="seq" value="${dto.seq}"/>
		<input type="hidden" name="name" value="updateuser"/>
		<table border="1">
			<tr>
				<th>번호</th>
				<td>${dto.seq}></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${dto.id}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${dto.name}</td>
			</tr>
			<tr>
				<th>등급</th>
				<td>
				<select name="role">
				<option value="admin" ${dto.role=="admin"?"selected":""}>관리자</option>
				<option value="manager" ${dto.role=="manager"?"selected":"" }>정회원</option>
				<option value="user" ${dto.Role=="user"?"selected":""}>일반회원</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="변경완료" />
				<input type="button" value="목록" onclick="location.href='userlist.jsp'"/>
				</td>
							
			</tr>
		</table>
	</form>
</body>
</html>