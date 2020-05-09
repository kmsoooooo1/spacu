<%@page import="com.wework.member.msession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	msession ms = (msession)session.getAttribute("ms");
	String id = null;
	int level = 0;
	if(ms != null){
		id = ms.getId();
		level = ms.getLevel();
	}
%>
<link rel="stylesheet" href="../css/header.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Monoton&display=swap" rel="stylesheet">
<script type="text/javascript">
	function logout(){
		if(confirm("정말 로그아웃 하시겠습니까?")){
			location.href="../user/logout.jsp";
		}else{
			return;
		}
	}
</script>
<header id="header">
	<div class="header_inner">
		<div class="header_logo">
			<h2 class="logo_title" onclick="location.href='../index.jsp'">SPACU</h2><span class="logo_exp">우리들의 공간대여</span>
		</div>
		<div class="header_nav_div">
		<%if(id == null){ %>
			<ul class="header_nav">
				<li><a href="../user/login.jsp">로그인</a></li>
				<li><a href="../user/join.jsp">회원가입</a></li>
			</ul>
		<%}else{ %>
			<ul class="header_nav">
		<%	
			if(level == 3){ %>
				<li><a href="../user/userList.jsp">유저관리</a></li>
		<%	}else if(level == 2){ %>
				<li><a href="../locations/locationList.jsp">장소관리</a></li>
		<%	} %>
				<li><%=id %>님, 안녕하세요.</li>
				<li><a href="../user/info.jsp">마이페이지</a></li>
				<li onclick="logout();">로그아웃</li>
			</ul>
		</div>
	<%} %>
	</div>
</header>