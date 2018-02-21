	<% 
	response.setHeader("Cache-Control", "No-store");
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Expires", "0");
	
	%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8");%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
onload=function(){
	history.forward();

}

function registForm() {
	location.href="regist.jsp";
}

</script>

<style type="text/css">
</style>


</head>
<body>
<!-- 주소창에 아이디 비밀번호가 호출되기 때문에 겟 방식으로 하면 절대안되고 폼태그 post 방식으로 해야 한다 -->
<form action="controller.jsp" method="post">
<input type="hidden" value="login" name="command"/>
<table border="1">
<tr>
	<th>아이디</th>
	<td><input type="text" name="id" autocomplete="off"/></td>
</tr>
<tr>
	<th>비밀번호</th>
	<td><input type="password" name="password" /></td>
</tr>
<tr>
	<td colspan="2">
	<input type="submit" value="로그인"/>
	<input type="button" value="회원가입" onclick="registForm()"/>
	</td>
</tr>
</table>
</form>
</body>
</html>