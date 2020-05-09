<%@page import="com.wework.reservation.lpcode"%>
<%@page import="com.wework.member.msession"%>
<%@page import="com.wework.place.placeBean"%>
<%@page import="com.wework.place.placeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/insertplace.css">
<link rel="stylesheet" href="../css/basic.css">
<script type="text/javascript" src="check.js"></script>
</head>
<body>
<%
	msession ms = (msession)session.getAttribute("ms");
	lpcode code = (lpcode)session.getAttribute("code");
	int level = 0;
	if(ms != null){
		level = ms.getLevel();
	}
	
	String[] arr = null;
	placeDAO dao = new placeDAO();
	placeBean pb = dao.getPlace(code.getPlace_id());
	dao.closeDB();
	if(pb != null){
		arr = pb.getPlace_type().split(" ");
%>
	<div class="container">
		<div class="container_inner">
			<form action="updatePro.jsp" method="post" name="fr">
				<span class="inner_title">수정하기</span>
				<div class="input_div"><label><span class="input_label">공간 이름</span><input type="text" class="input_area" name="place_name" value="<%=pb.getPlace_name()%>"></label></div>
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
				<div class="input_div"><label><span class="input_label">시간 당 가격</span><input class="input_area2" type="text" name="perhour" value="<%=pb.getPerhour() %>" placeholder="(단위 : 원/시간)"></label></div>
				<div class="input_div"><label><span class="input_label">최소 예약 시간</span><input class="input_area2" type="text" name="minhour" value="<%=pb.getMinhour() %>" placeholder="(단위 : 시간)"></label>
				<label><span class="input_label label3">최대인원</span><input class="input_area2" type="text" name="maxsize" value="<%=pb.getMaxsize() %>"  placeholder="(단위 : 명)"><br></label></div>
				<div class="input_div"><button class="input_button" type="button" onclick="check();">수정하기</button><button class="input_button" type="button" onclick="">뒤로</button></div>
			</form>
		</div>
	</div>
<%	} %>
<script type="text/javascript">
	var checkbox = document.fr.place_type;
	var arr = new Array();
	<% 
	int cnt = 0;
	for(String str : arr){
	%>
		arr[<%=cnt%>] = "<%=str%>";
		for(var i = 0; i<checkbox.length; i++){
			if(checkbox[i].value == arr[<%=cnt%>]){
				checkbox[i].checked = true;
			}
		}
	<%
		cnt++;
	}
	%>
</script>
</body>
</html>