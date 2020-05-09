<%@page import="com.wework.reservation.lpcode"%>
<%@page import="com.wework.member.msession"%>
<%@page import="com.wework.place.placeDAO"%>
<%@page import="com.wework.place.placeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/basic.css">
<link rel="stylesheet" href="../css/placeInfo.css">
</head>
<body>
<%
	
	msession ms = (msession)session.getAttribute("ms");
	int level = ms.getLevel();
	int location_id = 0;
	int place_id = 0;
	lpcode code = (lpcode)session.getAttribute("code");
	if(code == null){
		%>
			<script type="text/javascript">
				alert("장소선택 오류!");
				location.href="../locations/locationList.jsp";
			</script>
		<%
	}else{
		location_id = code.getLocation_id();
	}
	
	String id = request.getParameter("id");
	if(id != ""){
		place_id = Integer.parseInt(id);
	}else{
	%>
		<script type="text/javascript">
			alert("공간을 선택하세요.");
			location.href="../locations/locationInfo.jsp";
		</script>
	<%
	}
	code.setPlace_id(place_id);
	session.setAttribute("code", code);
	placeDAO dao = new placeDAO();
	placeBean pb = dao.getPlace(place_id);
	dao.closeDB();
%>
<jsp:include page="../inc/header.jsp"/>
<div class="container">
	<div class="container_inner">
		<h2 class="container_title">공간 정보</h2>
		<table class="place_info">
<%if(pb != null){ %>
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
			<tr  class="info_tr">
				<th class="info_th">공간 이름</th><td class="info_td"><%=pb.getPlace_name()%></td>
			</tr>
			<tr class="info_tr">
				<th class="info_th">공간 유형</th><td class="info_td"><%=pb.getPlace_type()%></td>
			</tr>
			<tr class="info_tr">
				<th class="info_th">최소 예약시간</th><td class="info_td"><%=pb.getMinhour()%></td>
			</tr>
			<tr class="info_tr">
				<th class="info_th">시간당 가격</th><td class="info_td"><%=pb.getPerhour()%></td>
			</tr>
			<tr class="info_tr">
				<th class="info_th">최대 수용 인원</th><td class="info_td"><%=pb.getMaxsize()%></td>
			</tr>
			<tr class="info_tr">
				<th class="info_th">등록 날짜</th><td class="info_td"><%=pb.getReg_date()%></td>
			</tr>
<%	}else{ %>
			<tr class="info_tr">
				<td class="info_td">공간 정보가 없습니다.</td>
			</tr>
<%	} %>
		</table>
		<div class="button_div">
			<button class="input_button" type="button" onclick="location.href='placeUpdate.jsp'">수정하기</button>
			<button class="input_button" type="button" onclick="location.href='deleteCheck.jsp'">삭제하기</button>
			<button class="input_button" type="button" onclick="location.href='../uploadImg/upload.jsp?l=<%=code.getLocation_id()%>&p=<%=code.getPlace_id()%>'">사진 업로드</button>
			<button class="input_button" type="button" onclick="location.href='../uploadImg/imgList.jsp'">사진 목록</button>
			<button class="input_button" type="button" onclick="location.href='../locations/locationInfo.jsp?id=<%=location_id%>'">뒤로</button>
		</div>
	</div>
</div>
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>