<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/basic.css">
<link rel="stylesheet" href="../css/login.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Monoton&display=swap" rel="stylesheet">
</head>
<body>
	<header id="header">
		<div class="header_inner">
			<h2 class="header_logo"><a href="../reserv/main.jsp">SPACU</a></h2>
		</div>
	</header>
	<div class="container">
		<div class="container_inner">
			<form action="loginPro.jsp" method="post">
				<input class="input_area" type="text" name="id" placeholder="아이디">
				<input class="input_area" type="password" name="pw" placeholder="비밀번호">
				<input class="input_button" type="submit" value="로그인"><button class="input_button" type="button" onclick="location.href='join.jsp'">회원가입</button>
			</form>
		</div>
	</div>
</body>
</html>