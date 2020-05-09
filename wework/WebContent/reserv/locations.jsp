<%@page import="com.wework.img.imgDAO"%>
<%@page import="com.wework.img.imgBean"%>
<%@page import="com.wework.location.pageNum"%>
<%@page import="com.wework.reservation.lpcode"%>
<%@page import="com.wework.location.locationBean"%>
<%@page import="com.wework.location.locationDAO"%>
<%@page import="com.wework.place.placeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/locations.css">
<link rel="stylesheet" href="../css/basic.css">
<script type="text/javascript">
	function change(){
		var region = document.getElementsByClassName("region")[0].value;
		location.href="locations.jsp?region="+region;
	}
</script>
</head>
<body>
	<jsp:include page="../inc/header.jsp"/>

<%
	pageNum pn = new pageNum();

	String region = request.getParameter("region");
	String pageCount = request.getParameter("pageCount");
	int p = 0;
	if(pageCount!=null){
		p = Integer.parseInt(pageCount)-1;
	}
	System.out.println(region);
	locationDAO dao = new locationDAO();
	List<locationBean> list = null;
	if(region==null || region==""){
		list = dao.getLocationList(p,pageNum.pageSize);
	}else{
		list = dao.getLocationList(p,pageNum.pageSize,region);
	}
	
	dao.closeDB();
%>
	<div id="container">
		<div class="container_banner"></div>
		<div class="container_inner">
			<div class="inner_title">
				<p class="location_text">등록된 공간 보기</p>
				<select class="region" onchange="change();">
					<option value=""
						<%if(region == null){ %> selected="selected" <%} %>>전체</option>
					<option value="부산진구"
						<%if(region != null && region.equals("부산진구")){ %> selected="selected" <%} %>>부산진구</option>
					<option value="북구"
						<%if(region != null && region.equals("북구")){ %> selected="selected" <%} %>>북구</option>
					<option value="남구"
						<%if(region != null && region.equals("남구")){ %> selected="selected" <%} %>>남구</option>
				</select>
			</div>
			
			<div class="location_list_div">
<%
			if(list.size()>0){
				imgDAO idao = new imgDAO();
				imgBean ib = null;
%>				
				<ul class="location_ul">
<%
				for(locationBean lb:list){
					
					 ib = idao.getMainImg(lb.getLocation_id(), 0);
%>
					<li class="location_list">
						<p class="l_img_wrap" onclick="location.href='insert.jsp?id=<%=lb.getLocation_id()%>'"><img class="list_img" src="
																													<%if(ib != null){%>
																														<%=ib.getImg_src() %>
																													<%}else{%>
																														null
																													<%}%>
																													"></p>
						<span class="list_name"><%=lb.getLocation_name() %></span>
						<p>
							<span class="list_exp"><%=lb.getLocation_exp() %></span>
						</p>
					</li>			
<%					
				}
				idao.closeDB();
%>
				</ul>
<%
			}else{
%>
			<span>등록된 공간이 없습니다.</span>
<%
			}
%>
			</div>
			<div class="list_count">
				<ul class="list_ul">
<%	for(int i=1; i<=pn.pageNum; i++){%>
					<li class="list_num"><a href="locations.jsp?region=<%if(region != null){ %><%=region %><%}else{ %><%} %>&pageCount=<%=i%>">[<%=i %>]</a></li>
<%	} %>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"/>
</body>
</html>