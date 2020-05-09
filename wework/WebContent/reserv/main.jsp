<%@page import="com.wework.img.imgBean"%>
<%@page import="com.wework.img.imgDAO"%>
<%@page import="com.wework.location.locationBean"%>
<%@page import="java.util.List"%>
<%@page import="com.wework.location.locationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/basic.css">
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<%
	locationDAO dao = new locationDAO();
	List<locationBean> list = dao.getLocationList(0,9);
	dao.closeDB();
	imgDAO idao = new imgDAO();
%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<div class="container">
		<div class="section_1 section">
			<div class="section1_inner">
				<h2 class="div_title">등록된 공간</h2>	
				<div class="arrow_div">
					<span class="arrow_text" onclick=""></span>
				</div>
				<div class="list_wrap">
					<div class="list_container">
						<ul class="location_ul">
						
					<%	if(list != null){ 
							imgBean ib = null;
							for(locationBean lb : list){
								ib = idao.getMainImg(lb.getLocation_id(),0);
								System.out.println(ib);
								if(ib == null) ib = new imgBean();
								
					%>
							<li class="location_list">
								<p class="l_img_wrap" onclick="location.href='insert.jsp?id=<%=lb.getLocation_id()%>'"><img class="list_img" src="<%=ib.getImg_src()%>"></p>
								<span class="list_name"><%=lb.getLocation_name() %></span>
								<p>
									<span class="list_exp"><%=lb.getLocation_exp() %></span>
								</p>
							</li>
					<%		} 
						}
					
						idao.closeDB();
						%>
						</ul>
					</div>
				</div>
				<div class="arrow_div">
					<span class="arrow_text" onclick=""></span>
				</div>
				<span class="more_span"><a href="locations.jsp">더보기</a></span>
			</div>
		</div>
<!-- 		<div class="section_2 section"> -->
<!-- 			<div class="section2_inner"> -->
<!-- 				<h2 class="div_title">사용자 리뷰</h2> -->
<!-- 				<div class=""> -->
<!-- 				</div> -->
<!-- 				<span class="more_span">더보기</span> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<div class="section_3 section">
			<div class="section3_inner">
				<h2 class="div_title div_title3">사용자 문의</h2>
				<div class="email_wrap">
					<div class="email_back"></div>
					<div class="email_div">
						<form action="sendEmail.jsp" method="post" name="fr">
							<span class="email_exp">문의글을 관리자 메일로 바로 발송됩니다.</span><br>
							<input class="email_text" type="text" name="writer" placeholder="이메일 주소">
							<input class="email_text" type="text" name="title" placeholder="제목을 입력하세요.">
							<textarea class="email_area" name="emailText" placeholder="문의 내용을 작성하세요."></textarea>
							<input class="email_button" type="submit" value="문의하기">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"/>
</body>
</html>