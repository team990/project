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
	

	
	
<%-- 	
// 		LoginDto ldto = (LoginDto)session.getAttribute("ldto"); //(loginDto)로 형변환을 시켜서 넣어야한다. scope 객체는 기본이 object이기 때문에 큰 형태가 보이기 떄문에
	
// 		if(ldto==null){
			
// //			response.sendRedirect("login.jsp"); 선보고 후조치
// // 			request.setAttribute("ldto",ldto); 아래것과 같이 쓰면 값을 가지고 페이지를 이동
//  			pageContext.forward("login.jsp");
// 		}
	--%>

<body>
<h1>관리자모드</h1>
<div><span>${ldto.name}님 환영합니다.(등급:${ldto.role}</span>
		<a href="controller.jsp?command=logout">로그아웃</a>
</div>
<div><a href="controller.jsp?command=userstatus">회원상태정보조회</a></div>
<div><a href="controller.jsp?command=userlist">회원정보조회(사용계정)</a></div>
</body>
</html>