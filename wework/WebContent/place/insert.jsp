<%@page import="com.wework.member.msession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/insertplace.css">
<link rel="stylesheet" href="../css/basic.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Monoton&display=swap" rel="stylesheet">
<script type="text/javascript" src="check.js"></script>
</head>
<body>
<%
	msession ms = (msession)session.getAttribute("ms");
	int level = ms.getLevel();
	if(level<2){
		%>
			<script type="text/javascript">
				alert("기업고객 전용 페이지입니다.");
				location.href="../index.jsp";
			</script>
		<%
	}
%>
	<header id="header">
		<div class="header_inner">
			<h2 class="header_logo"><a href="../reserv/main.jsp">SPACU</a></h2>
		</div>
	</header>
	<div class="container">
		<div class="container_inner">
			<form action="insertPro.jsp" method="post" name="fr">
				<span class="inner_title">공간을 등록하세요</span>
				<div class="input_div"><label><span class="input_label">공간 이름</span><input type="text" class="input_area" name="place_name"></label></div>
				<div class="input_div input_div2"><span class="input_label label2">공간 타입</span>
				<div class="checkbox_div">
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="공연장"><span class="check_lebel">공연장</span></label></div>
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="다목적홀"><span class="check_lebel">다목적홀</span></label></div>
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="독립오피스"><span class="check_lebel">독립오피스</span></label></div>
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="레저시설"><span class="check_lebel">레저시설</span></label></div>
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="루프탑"><span class="check_lebel">루프탑</span></label></div>
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="브라이덜샤워"><span class="check_lebel">브라이덜샤워</span></label></div>
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="세미나실"><span class="check_lebel">세미나실</span></label></div>
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="스터디룸"><span class="check_lebel">스터디룸</span></label></div>
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="스튜디오"><span class="check_lebel">스튜디오</span></label></div>
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="엠티장소"><span class="check_lebel">엠티장소</span></label></div>
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="연습실"><span class="check_lebel">연습실</span></label></div>
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="작업실"><span class="check_lebel">작업실</span></label></div>
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="카페"><span class="check_lebel">카페</span></label></div>
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="코워킹스페이스"><span class="check_lebel">코워킹스페이스</span></label></div>
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="파티룸"><span class="check_lebel">파티룸</span></label></div>
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="한옥"><span class="check_lebel">한옥</span></label></div>
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="할인"><span class="check_lebel">할인</span></label></div>
					<div class="check_inner"><label><input type="checkbox" name="place_type" value="회의실"><span class="check_lebel">회의실</span></label></div>
				</div></div>
				<div class="input_div"><label><span class="input_label">시간 당 가격</span><input class="input_area2" type="text" name="perhour" placeholder="(단위 : 원/시간)"></label></div>
				<div class="input_div"><label><span class="input_label">최소 예약 시간</span><input class="input_area2" type="text" name="minhour"  placeholder="(단위 : 시간)"></label>
				<label><span class="input_label label3">최대인원</span><input class="input_area2" type="text" name="maxsize"  placeholder="(단위 : 명)"><br></label></div>
				<div class="input_div"><button class="input_button" type="button" onclick="check();">등록하기</button><button class="input_button" type="button" onclick="">뒤로</button></div>
			</form>
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"/>
</body>
</html>