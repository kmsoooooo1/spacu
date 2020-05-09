<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/basic.css">
<link rel="stylesheet" href="../css/passwordCheck.css">
<script type="text/javascript">
	function check(){
		if(document.fr.pw.value == ""){
			alert("비밀번호를 입력해 주세요.");
			return false;
		}
		document.fr.submit();
	}
</script>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
	<div class="container">
		<div class="container_inner">
			<h2 class="container_title">비밀번호 확인</h2>
			<form action="deletePro.jsp" method="post" name="fr">
				<div class="input_div"><input class="input_area" type="password" name="pass" placeholder="비밀번호 확인"></div>
				<div class="input_div"><button class="input_button" type="button" onclick="return check();">확인</button><button class="input_button" type="button" onclick="location.href='placeInfo.jsp'">뒤로</button></div>
			</form>
		</div>
	</div>
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>