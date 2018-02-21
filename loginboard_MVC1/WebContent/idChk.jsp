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
function confirmId (bool) {

	if(bool){
		
		//
		opener.document.getElementsByName("password")[0].focus();
		
	}else {
		opener.document.getElementsByName("id")[0].value="";
		opener.document.getElementsByName("id")[0].focus();
	}
		self.close(); //현재팝업창 닫기
}
</script>

</head>
<%
 Boolean iss=(Boolean)request.getAttribute("iss");
%>
<body>

<table>
	<tr>
	<td><%=iss?"사용할수 있는 아이디 입니다.":"중복된 아이디 입니다." %><td>
	</tr>
	<tr>
		<td><button onclick="confirmId(<%=iss%>)">확인</button></td>
	
</table>

</body>
</html>