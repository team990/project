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
</head>
<script>
// function userinfo(seq) {
// 	location.href="userinfo.jsp?seq="+seq;
// }
</script>

<body>


<h1>나의정보수정하기</h1>

	<form action="controller.jsp" method="post">
	<input type="hidden" name="command" value="update">
	<input type="hidden" name ="seq" value="${dto.seq}"/>
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
	<td><input type="text" name="addr" value="${dto.address}"/></td>
	</tr>
	<tr>
	<th>전화번호</th>
	<td><input type="text" name="phone" value="${dto.phone}" />
	</td>
	</tr>
	<tr>
	<th>이메일</th>
	<td><input type="text" name="email" value="${dto.email }"/></td>
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
	<input type="submit" value="수정완료">
	<input type="button" value="취소" onclick="location.href='userinfo.jsp?seq=${dto.seq}'"/>
	
	<%-- 		<input type="button" value="취소" onclick="userinfo(<%=dto.getSeq()%>)"/> --%>
	</td>
	</tr>
	</table>
	</form>
</body>
</html>