<%@page import="java.util.List"%>
<%@page import="com.wework.reservation.lpcode"%>
<%@page import="com.wework.member.msession"%>
<%@page import="com.wework.place.placeBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wework.place.placeDAO"%>
<%@page import="com.wework.location.locationDAO"%>
<%@page import="com.wework.location.locationBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/basic.css">
<link rel="stylesheet" href="../css/locationInfo.css">
<title>Insert title here</title>
</head>
<body>
<%
	msession ms = (msession)session.getAttribute("ms");
	String id = null;
	int level = 0;
	if(ms == null){
%>
		<script type="text/javascript">
			alert("로그인이 필요한 페이지입니다.");
			location.href="../user/login.jsp";
		</script>
<%	}else{
		id = ms.getId();
		level = ms.getLevel();
	}
	if(level<2){
%>
		<script type="text/javascript">
			alert("관리자 전용 페이지입니다.");
			location.href="../reserv/main.jsp";
		</script>
<%
	}
	
	String location_id = request.getParameter("id");
	lpcode code = (lpcode)session.getAttribute("code");
	if(code == null){
		code = new lpcode();
	}
	code.setPlace_id(0);
	if(location_id != null){
		code.setLocation_id(Integer.parseInt(location_id));
	}
	
	session.setAttribute("code", code);
	
	locationDAO ldao = new locationDAO();
	locationBean lb = ldao.getLocation(code.getLocation_id());
	
	ldao.closeDB();
	
	placeDAO pdao = new placeDAO();
	List<placeBean> list = pdao.getPlaceList(code.getLocation_id());
	
	pdao.closeDB();
	
%>

<jsp:include page="../inc/header.jsp"/>
	<div class="container">
		<div class="container_inner">
		<h2 class="container_title">장소 정보</h2>
			<div class="location_div">
		<%	if(lb!=null){%>
				<div class="location_info1">
					<div class="location_img">
					
					</div>
					<table class="info1_table">
						<tr class="info1_tr">
							<th>코드</th>
							<td><%=lb.getLocation_id() %></td>
						</tr>
						<tr class="info1_tr">
							<th>장소 이름</th>
							<td><%=lb.getLocation_name() %></td>
						</tr>
						<tr class="info1_tr">
							<th>지역</th>
							<td><%=lb.getLocation_region() %></td>
						</tr>
						<tr class="info1_tr">
							<th>연락처</th>
							<td><%=lb.getPhone() %></td>
						</tr>
						<tr class="info1_tr">
							<th>주소</th>
							<td>
								<span class="addr_span"><%=lb.getPostnum() %></span>
								<span class="addr_span"><%=lb.getNewaddr() %></span>
								<span class="addr_span"><%=lb.getDetail() %></span>
							</td>
						</tr>
						<tr class="info1_tr">
							<th>영업시간</th>
							<td><%=lb.getWorktime() %></td>
						</tr>
						<tr class="info1_tr">
							<th>휴무</th>
							<td><%=lb.getHolyday() %></td>
						</tr>						
					</table>
				</div>
				<div class="location_info2">
					<h2 class="location_exp"><%=lb.getLocation_exp() %></h2>
					<div class="location_txt">
						<%=lb.getText() %>
					</div>
				</div>
		<%	}else{%>
				<p class="none_location">등록된 정보가 없습니다.</p>
		<%	}%>
			</div>
			<div class="place_div">
				<h3 class="place_title">공간 리스트</h3>
				<table class="place_table">
					<colgroup>
						<col width="10%">
						<col width="25%">
						<col width="35%">
						<col width="20%">
						<col width="10%">
					</colgroup>
					<tr class="place_tr">
						<th class="place_th">순번</th>
						<th class="place_th">공간 이름</th>
						<th class="place_th">공간 타입</th>
						<th class="place_th">시간당 가격</th>
						<th class="place_th">최대 인원 수</th>
					</tr>
		<%		if(list.size()>0){ 
					int cnt = 0;
					for(placeBean pb : list){
						cnt++;
					%>
					<tr class="place_tr" onclick="location.href='../place/placeInfo.jsp?id=<%=pb.getPlace_id()%>'">
						<td class="place_td"><%=cnt++ %></td>
						<td class="place_td"><%=pb.getPlace_name() %></td>
						<td class="place_td"><%=pb.getPlace_type() %></td>
						<td class="place_td"><%=pb.getPerhour() %></td>
						<td class="place_td"><%=pb.getMaxsize() %></td>
					</tr>
		<%			}
				}else{ %>
					<tr>
						<td class="place_td" colspan="4">등록된 공간이 없습니다.</td>
					</tr>
		<%		} %>
				</table>
		
				<button class="input_btn" type="button" onclick="location.href='../place/insert.jsp'">공간등록</button>
			</div>
			<button class="input_btn" type="button" onclick="location.href='update.jsp'">정보수정</button>
			<button class="input_btn" type="button" onclick="location.href='deleteCheck.jsp'">장소삭제</button>				
			<button class="input_btn" type="button" onclick="location.href='../uploadImg/upload.jsp?l=<%=code.getLocation_id()%>&p='">이미지 등록</button>
			<button class="input_btn" type="button" onclick="location.href='locationList.jsp'">목록으로</button>
			<button class="input_btn" type="button" onclick="location.href='../uploadImg/imgList.jsp'">이미지리스트</button>
		</div>
	</div>
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>