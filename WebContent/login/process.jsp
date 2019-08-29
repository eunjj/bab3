<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 자바 코드 작성
	//한글 깨짐방지
	request.setCharacterEncoding("UTF-8");
	//username,email,password,comfirm-password

	String name = request.getParameter("username");
	String password = request.getParameter("password");
	//DB에서 받아온 정보로 name과 password를 비교
	Connection conn = null;	
	Boolean connect = false;
	boolean isLogin = false; //html 부분에서 사용
		
		
		
		try {
			Context init = new InitialContext();		 
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/kndb");
			conn = ds.getConnection();
			
			String sql="SELECT * FROM users WHERE email = ? AND pw = ?";	
			PreparedStatement pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, name);	
			pstmt.setString(2, password);	
			
			
			ResultSet rs = pstmt.executeQuery();		
			if (rs.next()) {		
				System.out.println(rs.getString("name"));	
				System.out.println("님 반갑습니다!!");
				isLogin=true;	//데이터가 있으면 true 변경
			
				
			} else {		
				System.out.println("아이디나 비밀번호가 틀립니다.");	
			}		
					
			
			connect = true;
			conn.close();
			
			
		} catch (Exception e) {			
			connect = false;		
			e.printStackTrace();		
		}			
					
		if (connect == true) {			
			out.println("연결되었습니다.");		
		} else {			
			out.println("연결실패.");		
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
	<script>
		alert("로그인 성공")
	</script>
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

		location.href = "../sign.jsp";
	</script>
	<% } %>

</body>
</html>