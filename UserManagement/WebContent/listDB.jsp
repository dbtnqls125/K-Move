<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
			request.setCharacterEncoding("utf-8"); // Post방식으로 받을 때 한글이 깨지지 않도록 UTF-8로 설정.
			
			//1. DB연동 드라이버 로드
			Class.forName("com.mysql.jdbc.Driver");
			// 어떠한 클래스가 로딩 될지 모르기 때문에 Class 클래스의 forName()함수를 이용해서 해당 클래스를 메모리로 로드  JDBC Driver 등록
			
			//2. 연결 정보
			String url = "jdbc:mysql://localhost:3307/kmove?serverTimezone=UTC"; 
			String user = "kmove"; 
			String pwd = "kmove"; 
			
			//3. 연결 생성																									// 특정 데이터베이스와의 연결
			Connection con = DriverManager.getConnection(url, user, pwd); //지정된 데이터베이스 URL에 대한 연결 설정.
			
			
			//4. 생성된 연결을 통해 SQL문 실행 의뢰 준비
			Statement stmt = con.createStatement();
			String sql = "select * from login";
			
			//5. sql실행 시키고 그 결과를 가져온다.
			ResultSet rs = stmt.executeQuery(sql); //executeQuery(sql) = DDL
			
			//6. SQL실행 결과 화면 출력
			while(rs.next()){
				String col1 = rs.getString(1);
				%>
				<a href="updateDB.jsp?id=<%=col1%>"><%=col1%></a>
				<% String col2 = rs.getString(2);  %> 
				<%=col2 %>
				<br>
	<%		}

			//7. 객체 해제
			rs.close();
			stmt.close();
			con.close();
%>


</body>
</html>