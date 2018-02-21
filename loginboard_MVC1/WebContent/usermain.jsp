<% 
	response.setHeader("cache-control", "no-store");
	response.setHeader("pragma", "no-cache");
	response.setHeader("expires", "0");
	%>

<%@page import="com.hk.dtos.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8");%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 	LoginDto ldto = (LoginDto)session.getAttribute("ldto");
// 	if(ldto==null){
// 		pageContext.forward("login.jsp");
// 	}

%>
<h1>일반사용자모드</h1>
<div>
	<span>${ldto.name}님 반갑습니다.(등급:${ldto.role})</span>
	<a href="controller.jsp?command=logout">로그아웃</a>
</div>
<div><a href="controller.jsp?command=userinfo&seq=${ldto.seq}">나의정보</a></div>
</body>
</html>