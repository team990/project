<%@page import="java.util.List"%>
<%@page import="com.hk.dbinfo.util"%>
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

<% String command = request.getParameter("command"); 

	LoginDao dao = new LoginDao();
	
	if(command.equals("regist")){
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		boolean iss = dao.insertUser(new LoginDto(id,password,name,address,phone,email));
		
		if(iss){
			%>
			<script type="text/javascript">
			alert("회원가입을 축하합니다.")
			location.href="login.jsp";
			</script>
			
			<%
			
		}else{
			%>
			<script type="text/javascript">
			alert("회원가입 실패!");
			location.href="regist.jsp";
			</script>
			<%
		}
		
	}else if(command.equals("login")){
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		LoginDto ldto = dao.getLogin(id, password);
		
		if(ldto.getId()!=null){ //회원정보가 존재한다면? --> 회원이 확인되면
			
			//scope용어의 정의 : 객체 전달 범위(page, request, session, application)
			session.setAttribute("ldto", ldto);
//			session.setMaxInactiveInterval(10*60); //최대유지 시간 10분! session의 객체들을 모두 삭제
			
			if(ldto.getRole().toUpperCase().equals("ADMIN")){
				response.sendRedirect("adminmain.jsp"); //자바에서 페이지 이동 하는 메서드
				
			}else if(ldto.getRole().toUpperCase().equals("USER")){
//				response.sendRedirect("usermain.jsp");
				out.print(util.jsForward("안녕하세요", "usermain.jsp"));
			}else if(ldto.getRole().toUpperCase().equals("MANAGER")){
				response.sendRedirect("usermain.jsp");
			}
				
			}else{
				//jsForward(String msg,String url) : 자바에서 자바스크립트 코드를 실행할 수 있는 기능을 제공한다
				out.print(util.jsForward("아이디와 패스워드를 확인하세요!!", "login.jsp"));
				
				
			}
			}else if (command.equals("userstatus")) {
			
				List<LoginDto> lists = dao.getAllUserStatus();
				
				request.setAttribute("lists", lists);
				
				pageContext.forward("userstatus.jsp");
				
			}else if(command.equals("userlist")){
			
				List<LoginDto> lists = dao.getAllUser();
				
				request.setAttribute("lists", lists);
				
				pageContext.forward("userlist.jsp");
		
			}else if(command.equals("userinfo")){
				
			int seq =Integer.parseInt(request.getParameter("seq"));
			
			 LoginDto dto = dao.getUser(seq);
			 
			 request.setAttribute("dto", dto);
			 
			 pageContext.forward("userinfo.jsp");
			
			}else if(command.equals("updateform")){
				
				int seq =Integer.parseInt(request.getParameter("seq"));
				
				 LoginDto dto = dao.getUser(seq);
				 
				 request.setAttribute("dto", dto);
				 
				 pageContext.forward("updateform.jsp");
			
			}else if(command.equals("update")){
				
				int seq =Integer.parseInt(request.getParameter("seq"));
			
				String addr=request.getParameter("addr");
				String phone=request.getParameter("phone");
				String email=request.getParameter("email");
				
				boolean iss = dao.updateUser(new LoginDto(seq,addr,phone,email));
				
				if(iss){
							out.print(util.jsForward("수정성공","controller.jsp?command=userinfo&seq="+seq));		
				}else{
							out.print(util.jsForward("수정실패", "controller.jsp?command=updateform&seq="+seq));	
					
				}
				
			}else if(command.equals("updaterole")){
				
				int seq = Integer.parseInt(request.getParameter("seq"));
				LoginDto dto = dao.getUser(seq);
				
				request.setAttribute("dto", dto);
				
				pageContext.forward("updaterole.jps");
				
			}else if(command.equals("updateuser")){
				int seq = Integer.parseInt(request.getParameter("seq"));
				String role = request.getParameter("role");

				
				boolean iss = dao.updateRole(seq, role);
				 
				if(iss){
					
					out.print(util.jsForward("회원등급을 변경합니다.","controller.jsp?command=userlist"));
				
				}else{
					
					out.print(util.jsForward("회원등급 변경 실패ㅜㅜ" , "controller.jsp?command=updaterole&seq="+seq));
				}
				
			}else if(command.equals("deluser")){
				
				int seq = Integer.parseInt(request.getParameter("seq"));
				boolean iss = dao.delUser(seq);
				
				if(iss){
					session.invalidate();
					out.print(util.jsForward("탈퇴가 완료되었습니다.", "login.jsp"));
				}else{
					
					out.print(util.jsForward("탈퇴 실패", "login.jsp"));
				}
			}else if(command.equals("logout")){
				
				session.invalidate();
				out.print(util.jsForward("로그아웃합니다", "login.jsp"));
			
			
			}else if(command.equals("idchk")){
			 	String id = request.getParameter("id");
				LoginDto dto = dao.idChk(id);

				boolean iss= true;
				
				if(dto.getId()!=null){
					
					iss=false;
					
				}
				
				request.setAttribute("iss", iss);
				pageContext.forward("idChk.jsp");
			}
				
				%>	

</head>
<body>

</body>
</html>