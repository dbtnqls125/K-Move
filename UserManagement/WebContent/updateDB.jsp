
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
			Statement stmt = con. createStatement();
			String id = request.getParameter("id");
			String sql = "select pwd from login where id='"+id+"'";
			out.println(sql);
			
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				String passwd = rs.getString("pwd");
			}
			String passwd="";			
			%>
			<h2>DB에 로그인 데이터 변경</h2>
			<form action="updateDBPro.jsp" method="post">
					아이디 : <input type="text" name="id" value="<%=id%>"> <br>
					암호 : <input type="password" name="pwd" value="<%=passwd%>"> <br>
						<input type="submit" value="입력">
						<input type="reset" name="재설정">
			</form>
			
			<input type="button" value="삭제" onclick="location.href='deleteDB.jsp?id=<%=id%>'">
			
			<%
				rs.close();
				stmt.close();
				con.close();
			%>
</body>
</html>