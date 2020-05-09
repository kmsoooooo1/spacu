<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/join.css">
<link rel="stylesheet" href="../css/basic.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Monoton&display=swap" rel="stylesheet">
<script type="text/javascript" src="checkJoin.js"></script>
<title>Insert title here</title>
</head>
<body>
<header id="header">
	<div class="header_inner">
		<h2 class="header_logo"><a href="../reserv/main.jsp">SPACU</a></h2>
	</div>
</header>
<div class="container">
	<div class="container_inner">
		<h2 class="container_title">회원가입</h2>
		<div class="form_div">
			<form action="joinPro.jsp" method="post" name="fr">
				<div class="input_div"><span class="input_label">아이디</span><input class="input_area1" type="text" name="id" placeholder="아이디 확인" readonly="readonly">
				<button class="input_button" type="button" onclick="window.open('idCheck.jsp','_blank','width=500,height=400',false);">아이디확인</button></div>
				<div class="input_div"><label><span class="input_label">비밀번호</span><input class="input_area2" type="password" name="pw" placeholder="비밀번호"></label></div>
				<div class="input_div"><label><span class="input_label"></span><input class="input_area2" type="password" name="pw_chk" placeholder="비밀번호 확인"></label></div>
				<div class="input_div"><label><span class="input_label">이름</span><input class="input_area2" type="text" name="name"></label></div>
				<div class="input_div"><label><span class="input_label">생년월일</span><input class="input_area2" type="text" name="birth" placeholder="YYYYMMDD"></label></div>
				<div class="input_div"><span class="input_label">성별</span><input type="radio" name="gender" value="남" checked="checked"> 남 <input type="radio" name="gender" value="여">여</div>
				<div class="input_div"><label><span class="input_label">전화번호</span><input class="input_area1" type="text" name="phone" readonly="readonly"></label>
				<button class="input_button" type="button" onclick="window.open('phoneCheck.jsp','_blank','width=500,height=400',false);">전화번호 확인</button></div>
																										<!-- 	전화번호 확인 페이지 확인 필요 -->
				<div class="input_div"><label><span class="input_label">이메일</span><input class="input_area1" type="email" name="email"></label>
				<button class="input_button" type="button" onclick="">이메일확인</button></div>
				<div class="input_div"><button class="input_button" type="button" onclick="return check();">회원가입</button><button class="input_button" type="button" onclick="location.href='login.jsp'">로그인</button></div>
			</form>
		</div>
	</div>
</div>
</body>
</html>