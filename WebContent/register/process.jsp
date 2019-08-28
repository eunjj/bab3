<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 자바 코드 작성
	//한글 깨짐방지
	request.setCharacterEncoding("UTF-8");
	//username,email,password,comfirm-password

	String name = request.getParameter("username");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String cpassword = request.getParameter("confirm-password");

	System.out.println(name);
	System.out.println(email);
	System.out.println(password);
	System.out.println(cpassword);

	//위 받아온 데이터들을 DB에 저장하는 방법을 해야함
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
</head>
<body>
	회원가입 처리
	<br> 이름:<%=name%><br> 이메일:<%=email%><br> 회원가입이 완료되었습니다.
	<br>
	<a href="../sign.jsp">로그인 하기</a>	
</body>
</html>