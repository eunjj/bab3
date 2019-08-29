<%@page import="java.sql.PreparedStatement"%>		
<%@page import="javax.sql.DataSource"%>		
<%@page import="javax.naming.InitialContext"%>		
<%@page import="javax.naming.Context"%>		
<%@page import="java.sql.Connection"%>		
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection conn = null;	
		Boolean connect = false;

		
		
		
		try {
			Context init = new InitialContext();		 
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/kndb");
			conn = ds.getConnection();
			
			String sql="SELECT * FROM users WHERE email = ? AND pw = ?";	
			PreparedStatement pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, "a@a.com");	
			pstmt.setString(2, "1");	
			
			
			ResultSet rs = pstmt.executeQuery();		
			if (rs.next()) {		
				System.out.println(rs.getString("name"));	
				System.out.println(rs.getString("pw"));	
				System.out.println(rs.getString("email"));	
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
</body>
</html>