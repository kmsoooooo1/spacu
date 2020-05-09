<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/basic.css">
<link rel="stylesheet" href="../css/userdelete.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Monoton&display=swap" rel="stylesheet">
</head>
<body>
<header id="header">
	<div class="header_inner">
		<span class="header_logo">SPACU</span>
	</div>
</header>
<div class="container">
	<div class="container_inner">
		<span class="container_title">회원탈퇴</span>
		<form action="deletePro.jsp" method="post" name="fr">
		<div class="input_div">
			<input class="input_area" type="password" name="pw" placeholder="비밀번호 확인">
		</div>
		<div class="input_div">
			<input class="input_button" type="submit" value="확인"><button type="button" class="input_button" onclick="history.back();">뒤로</button>
		</div>
		</form>
	</div>
</div>
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>