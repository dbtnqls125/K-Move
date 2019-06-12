<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>DB에 로그인 데이터 입력</h2>
	<form action="insertDBPro.jsp" method="post">
		아이디 : <input type="text" name="id"> <br>
		암호 : <input type="password" name="pwd"> <br>
		<input type="submit" value="입력">
		<input type="reset" name="재설정">
	</form>
</body>
</html>