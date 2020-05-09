<%@page import="com.wework.reservation.lpcode"%>
<%@page import="com.wework.member.msession"%>
<%@page import="com.wework.location.locationDAO"%>
<%@page import="com.wework.location.locationBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/locationinsert.css">
<link rel="stylesheet" href="../css/basic.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Monoton&display=swap" rel="stylesheet">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</head>
<body>
<%
	msession ms = (msession)session.getAttribute("ms");
	if(ms == null){
		%>
			<script type="text/javascript">
				alert("로그인이 필요한 페이지입니다.");
				location.href="../user/login.jsp";
			</script>
		<%
	}else{
		int level = ms.getLevel();
		if(level < 2){
		%>
			<script type="text/javascript">
				alert("관리자 페이지입니다.");
				location.href="../index.jsp";
			</script>
		<%
		}
	}
	
	lpcode code = (lpcode)session.getAttribute("code");
	if(code == null){
	%>
		<script type="text/javascript">
			alert("장소를 선택해 주세요.");
			location.href="locationList.jsp";
		</script>
	<%
	}
	locationDAO dao = new locationDAO();
	locationBean lb = dao.getLocation(code.getLocation_id());
	dao.closeDB();
	if(lb != null){
%>
<header id="header">
		<div class="header_inner">
			<h2 class="header_logo"><a href="../reserv/main.jsp">SPACU</a></h2>
		</div>
	</header>
<div id="container">
	<div class="container_inner">
		<h1 class="container_title">장소 정보 수정</h1>
		<form action="updatePro.jsp" method="post" name="fr">
			<p class="info_part">
				<label><span class="input_label">장 소 명</span> <input class="input_area1" type="text" name="location_name" readonly="readonly" value="<%=lb.getLocation_name()%>"></label><button class="input_button" type="button" onclick="window.open('locationCheck.jsp','_blank','width=500,height=400',false);" disabled="disabled">장소명 확인</button><br>
				<span class="input_label">지 역 권</span>
				<select class="input_area2" name="location_region">
					<option selected="selected" value="">지역을 선택하세요</option>
					<option value="부산진구" <%if(lb.getLocation_region().equals("부산진구")){%> selected="selected" <%} %>>부산진구</option>
					<option value="북구" <%if(lb.getLocation_region().equals("북구")){%> selected="selected" <%} %>>북구</option>
					<option value="남구" <%if(lb.getLocation_region().equals("남구")){%> selected="selected" <%} %>>남구</option>
					<option value="해운대구" <%if(lb.getLocation_region().equals("해운대구")){%> selected="selected" <%} %>>해운대구</option>
				</select><br><br>
				<label><span class="input_label">연 락 처</span> <input class="input_area2" type="text" name="phone" placeholder="연락처" value="<%=lb.getPhone()%>"></label><br>
				<label><span class="input_label">영 업 시 간</span> <input class="input_area2" type="text" name="worktime" placeholder="XX~XX시간 등 서술형으로 작성" value="<%=lb.getWorktime() %>"></label><br>
				<label><span class="input_label">휴 무 일</span> <input class="input_area2" type="text" name="holyday" placeholder="월,화 혹은 월요일 화요일 등 서술형으로 작성" value="<%=lb.getHolyday() %>"></label><br>
				<label><span class="input_label">장소 한줄 소개</span> <input class="input_area2" type="text" name="location_exp" value="<%=lb.getLocation_exp()%>"></label><br>
				<label><span class="input_label text_label">내 용</span>
				<textarea class="input_text" name="text"><%=lb.getText() %></textarea></label>
			</p>
			<p class="address_part">
				<label><span class="input_label">우 편 번 호</span></label><input class="input_area1" type="text" id="sample4_postcode" name="postnum" placeholder="우편번호" readonly="readonly" value="<%=lb.getPostnum()%>">
				<input class="input_button" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<label><span class="input_label">도로명주소</span></label><input class="input_area2" type="text" id="sample4_roadAddress" name="newaddr" placeholder="도로명주소" readonly="readonly" value="<%=lb.getNewaddr()%>"><br>
				<label><span class="input_label">지번주소</span></label><input class="input_area2" type="text" id="sample4_jibunAddress" name="oldaddr" placeholder="지번주소" readonly="readonly" value="<%=lb.getOldaddr()%>"><br>
				<span id="guide" style="color:#999;display:none"></span><br>
				<label><span class="input_label">상세주소</span></label><input class="input_area2" type="text" id="sample4_detailAddress" name="detail" placeholder="상세주소" value="<%=lb.getDetail()%>"><br>
				<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"><br>
			</p>
			<div class="button_div"><input class="input_button" type="submit" value="수정하기"><button class="input_button" type="button" onclick="location.href='locationList.jsp'">목록으로</button></div>
		</form>
	</div>
<%	} %>
</div>
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>