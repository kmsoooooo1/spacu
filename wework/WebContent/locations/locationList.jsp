<%@page import="com.wework.location.pageNum"%>
<%@page import="com.wework.member.msession"%>
<%@page import="com.wework.location.locationDAO"%>
<%@page import="com.wework.location.locationBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/locationList.css">
<link rel="stylesheet" href="../css/basic.css">
</head>
<body>
<%
	msession ms = (msession)session.getAttribute("ms");
	System.out.println(ms);
	if(ms == null){
%>	
	<script type="text/javascript">
		alert("로그인이 필요한 페이지입니다.");
		location.href="../user/login.jsp";
 	</script>
<%		
	}else{
		int level = ms.getLevel();
		if(level<2){
		%>
			<script type="text/javascript">
 				alert("관리자 전용페이지입니다.");
 				location.href="index.jsp";
 			</script>
	<%
		}
	}
	
	pageNum pn = new pageNum();
	
	String pageCount = request.getParameter("pageCount");
	int p = 0;
	if(pageCount!=null){
		p = Integer.parseInt(pageCount)-1;
	}
	
	locationDAO dao = new locationDAO();
	ArrayList<locationBean> list = dao.getLocationList(p,pageNum.pageSize);
	dao.closeDB();
	
%>
<jsp:include page="../inc/header.jsp"/>
<div class="container">
	<div class="container_inner">
		<h2 class="container_title">장소 목록</h2>
		<table class="list_table">
			<colgroup>
				<col width="40%">
				<col width="15%">
				<col width="15%">
				<col width="30%">
			</colgroup>
			<tr class="list_tr">
				<th class="list_th">장소명</th>
				<th class="list_th">지역</th>
				<th class="list_th">연락처</th>
				<th class="list_th">주소</th>
			</tr>
	<% 
		if(list.size()>0){
			for(locationBean lb : list){
				System.out.println(lb);
	%>
			<tr class="list_tr">
				<td class="list_td"><a href="locationInfo.jsp?id=<%=lb.getLocation_id()%>"><%=lb.getLocation_name() %></a></td>
				<td class="list_td"><%=lb.getLocation_region() %></td>
				<td class="list_td"><%=lb.getPhone() %></td>
				<td class="list_td"><%=lb.getNewaddr() + "<br> " + lb.getDetail() %></td>
			</tr>
	<%		}
		}else{ %>
			<tr>
				<td colspan="4">등록된 장소가 없습니다.</td>
			</tr>
	<%	} %>
		</table>
		<div class="list_count">
		<ul class="list_ul">
<%	for(int i=1;i<=pn.pageNum; i++){ %>
			<li  class="list_num"><a href="locationList.jsp?pageCount=<%=i%>">[<%=i %>]</a></li>
<% 	}%>
		</ul>
		</div>
		<div class="input_div">
			<button class="input_button" type="button" onclick="location.href='insert.jsp'">새로등록</button>
			<button class="input_button" type="button" onclick="location.href='../index.jsp'">메인페이지</button>
		</div>
	</div>
</div>
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>