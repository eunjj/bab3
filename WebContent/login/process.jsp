<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 자바 코드 작성
	//한글 깨짐방지
	request.setCharacterEncoding("UTF-8");
	//username,email,password,comfirm-password

	String name = request.getParameter("username");
	String password = request.getParameter("password");

	System.out.println(name);
	System.out.println(password);

	//이름과 패스워드 체크
	//임시로 이름과 패스워드 지정
	String regName = "아이디";
	String regPw = "111";
	boolean isLogin = false;
	//만약에 로그인을 시도하는사람이 아이디와 20190826이면
	if (name.equals(regName) && password.equals(regPw)) {
		//로그인성공
		System.out.println("로그인 성공");
		isLogin = true;
		//아니면
	} else {
		System.out.println("로그인 실패");
		//로그인실패
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<br>

	<h1>로그인 처리</h1>
	<%
		if (isLogin) {
	%>
	<script>alert("로그인 성공")</script>
	이름:
	<b style="color: Tomato;"><%=name%></b>
	<br> 비밀번호:
	<b style="color: Tomato;"><%=password%></b>
	<br>
	<%
		} else {
	%>
	<script>
	alert("로그인 실패!!");
	
	location.href="../sign.jsp";
	
	</script>
	<% } %>
	
</body>
</html>