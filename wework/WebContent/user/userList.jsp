<%@page import="com.wework.member.memberBean"%>
<%@page import="com.wework.member.memberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/basic.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Monoton&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/userList.css">
</head>
<body>
<%
	memberDAO dao = new memberDAO();
	List<memberBean> list = dao.MemberList();
	
	dao.closeDB();
%>
<header id="header">
	<div class="header_inner">
		<h2 class="header_logo"><a href="../reserv/main.jsp">SPACU</a></h2>
	</div>
</header>

<div class="container">
	<div class="container_inner">
		<h2 class="container_title">회원정보</h2>
		<table class="userList">
			<tr>
				<th class="list_th">순 번</th>
				<th class="list_th">아이디</th>
				<th class="list_th">권 한</th>
				<th class="list_th">이 름</th>
				<th class="list_th">생년월일</th>
				<th class="list_th">성 별</th>
				<th class="list_th">전화번호</th>
				<th class="list_th">이메일</th>
				<th class="list_th">포인트</th>
				<th class="list_th">가입일자</th>
				<th class="list_th">이메일 확인</th>
			</tr>
<%
	int cnt = 0;
	for(memberBean mb : list){
		cnt++;
%>
			<tr class="list_tr" onclick="location.href='adminUpdate.jsp?id=<%=mb.getId() %>'">
				<td class="list_td"><%=cnt %></td>
				<td class="list_td"><%=mb.getId() %></td>
				<td class="list_td"><%=mb.getLevel() %></td>
				<td class="list_td"><%=mb.getName() %></td>
				<td class="list_td"><%=mb.getBirth() %></td>
				<td class="list_td"><%=mb.getGender() %></td>
				<td class="list_td"><%=mb.getPhone() %></td>
				<td class="list_td"><%=mb.getEmail() %></td>
				<td class="list_td"><%=mb.getPoint() %></td>
				<td class="list_td"><%=mb.getReg_date() %></td>
				<td class="list_td"><%=mb.isEmailcheck() %></td>
			</tr>
	
<%	} %>
		</table>
		<div class="form_div">
			<form action="userList.jsp" method="post" name="fr">
				<input class="text_area" type="text" name="search">
				<select class="select_area" name="search_case">
					<option value="id">아이디</option>
					<option value="name">이름</option>
					<option value="email">이메일</option>
					<option value="reg_date">가입일자</option>
				</select>
				<input class="input_button" type="submit" value="검색">
			</form>
		</div>
	</div>
</div>







</body>
</html>