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

<script type="text/javascript">

	function cancelReg(){
		
		location.href="login.jsp";
	}


	function idChk(id) {
		//open("url","title","prop")
		open("controller.jsp?command=idchk&id="+id,"","width=200px,height=200px");
		// 				?이름 =" + 값
	}
</script>

</head>
<body>
	<h1>회원가입</h1>
	<form action="controller.jsp" method="post">
	<input type="hidden" value="regist" name="command">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" id="idchk" required="required" />
					<input type="button" value="중복확인" onclick="idChk(idchk.value)" />
					
<!-- 												위 택스트에(id="idchk")에 입력된 value를 받아와서 클릭된 곳으로 바로 넘겨준다 -->
				</td>
				<!-- 		required 필수로 입력하게 하는것. 입력안할시 다음으로 넘어가지 않게 해줘용-->
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password" required="required" /></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" required="required" /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" required="required" /></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" required="required" /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email" required="required" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="가입완료"/>
				<input type="button" value="취소" onclick="cancelReg()"/></td>
			
			</tr>
		</table>
	</form>
</body>
</html>