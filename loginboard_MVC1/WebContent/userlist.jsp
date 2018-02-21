<%@page import="com.hk.dtos.LoginDto"%>
<%@page import="java.util.List"%>
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
<body>
<% 
List<LoginDto> lists =(List<LoginDto>)request.getAttribute("lists");
	
%>
	<h1>회원정보조회(사용중)</h1>
	
	
	<table border="1">
	<col width="50px">
	<col width="100px">
	<col width="100px">
	<col width="100px">
	<col width="100px">
	<tr>
	<th>번호</th>
	<th>아이디</th>
	<th>이름</th>
	<th>등급</th>
	<th>등급변경</th>
	</tr>
	<% 
		if(lists==null||lists.size()==0){
		%>	
		
		<tr><td colspan="5">---가입된 회원이 없습니다--</td></tr>
		
		<%	
		}else{
			
			for(LoginDto dto:lists){
				//Logindto dto 정보를 담을 객체를 생성. 정보를 꺼내올 객체 lists. lists의 크기만큼 꺼내서 dto에 담는다.
				%>
				<tr>
				<td><%=dto.getSeq()%></td>
				<td><%=dto.getId() %></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getRole() %></td>
				<td><button onclick="location.href='controller.jsp?command=updaterole&seq=<%=dto.getSeq()%>'">변경</button></td>
				</tr>
				<% 
				
			}
		}
	%>
	
	<tr><td colspan="5"><button onclick="location.href='adminmain.jsp'">메인으로 가기</button></td></tr>
	<% 
	
	%>
	
	</table>
	


</body>
</html>