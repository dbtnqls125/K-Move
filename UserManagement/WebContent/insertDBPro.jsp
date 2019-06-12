<%@page import="java.sql.*"%>

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
			request.setCharacterEncoding("utf-8"); // Post방식으로 받을 때 한글이 깨지지 않도록 UTF-8로 설정.
			
			//1. DB연동 드라이버 로드
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 어떠한 클래스가 로딩 될지 모르기 때문에 Class 클래스의 forName()함수를 이용해서 해당 클래스를 메모리로 로드  JDBC Driver 등록
			
			//2. 연결 정보
			String url = "jdbc:mysql://localhost:3307/kmove?serverTimezone=UTC"; //자신의 mysql 경로 
			String user = "kmove"; //자신의 사용자 명
			String pwd = "kmove"; //비번
			
			//3. 연결 생성																									// 특정 데이터베이스와의 연결
			Connection con = DriverManager.getConnection(url, user, pwd); //지정된 데이터베이스 URL에 대한 연결 설정.
			
			
			//4. 생성된 연결을 통해 SQL문 실행 의뢰 준비
			
			String sql = "insert into login values(?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			//SQL 문이 사전 컴파일되어 PreparedStatement 객체에 저장된다. 
			//SQL문장을 여러 번 효율적으로 실행할 수 있다.
			
			pstmt.setString(1, request.getParameter("id"));
			pstmt.setString(2, request.getParameter("pwd"));
			
			//5. sql문 실행
			int i = pstmt.executeUpdate();
			//INSERT, UPDATE, DELETE 등의 데이터 조작 언어(DML)만 사용 가능.
		
			
			// 6. 객체 해제
			pstmt.close(); //pstmt 닫음
			con.close(); //con 닫음
			
	
	%>
	<%=i %>행이 입력되었습니다.!
	<input type ="button" onclick="location.href='index.jsp'" value="사용자 관리로 돌아가기">
</body>
</html>