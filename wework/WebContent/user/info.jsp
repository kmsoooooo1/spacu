<%@page import="com.wework.member.msession"%>
<%@page import="com.wework.member.memberBean"%>
<%@page import="com.wework.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/info.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Monoton&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/basic.css">
<title>Insert title here</title>
</head>
<body>
<%
	msession ms = (msession)session.getAttribute("ms");
	memberBean mb = null;
	if(ms == null){
		%>
			<script type="text/javascript">
				alert("로그인이 필요한 페이지입니다.");
				location.href="login.jsp";
			</script>
		<%
	}else{
		memberDAO dao = new memberDAO();
		mb = dao.getMember(ms.getId());
		dao.closeDB();	
	}
	
	if(mb != null){
%>
<jsp:include page="../inc/header.jsp"/>
<div class="container">
<div class="container_inner">
	<h1 class="container_title">유저정보</h1>
		<table class="info_table">
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
			<tr class="info_tr">
				<th  class="info_th">아이디</th><td class="info_td"><%=mb.getId() %></td>
			</tr>
			<tr class="info_tr">	
				<th class="info_th">이름</th><td class="info_td"><%=mb.getName() %></td>
			</tr>
			<tr class="info_tr">
				<th class="info_th">생년월일</th><td class="info_td"><%=mb.getBirth() %></td>
			</tr>
			<tr class="info_tr">
				<th class="info_th">성별</th><td class="info_td"><%=mb.getGender() %></td>
			</tr>
			<tr class="info_tr">
				<th class="info_th">전화번호</th><td class="info_td"><%=mb.getPhone() %></td>
			</tr>
			<tr class="info_tr">
				<th class="info_th">이메일</th><td class="info_td"><%=mb.getEmail() %></td>
			</tr>
			<tr class="info_tr">
				<th class="info_th">회원유형</th><td class="info_td">
					<%	
						if(mb.getLevel()==3){
					%>
						관리자
					<%
						}else if(mb.getLevel() == 2){
					%>
						기업회원
					<%		
						}else{
					%>
						일반회원
					<%
						}
					%></td>
			</tr>
			<tr class="info_tr">
				<th class="info_th">가입날짜</th><td class="info_td"><%=mb.getReg_date() %></td>
			</tr>
			<tr class="info_tr">
				<th class="info_th">이메일 체크유무</th><td class="info_td"><%if(mb.isEmailcheck()){out.print("Y");}else{out.print("N");}%></td>
			</tr>
		</table>
		<button  class="info_btn" type="button" onclick="location.href='password_check.jsp'">회원정보 수정</button><button class="info_btn" type="button" onclick="location.href='../reserv/main.jsp'">메인페이지로</button><button  class="info_btn" type="button" onclick="location.href='delete.jsp'">회원탈퇴</button>
	</div>
</div>
<%	} %>
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>