<%@page import="com.wework.member.msession"%>
<%@page import="com.wework.member.memberDAO"%>
<%@page import="com.wework.member.memberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/adminUpdate.css">
<link rel="stylesheet" href="../css/basic.css">
</head>
<script type="text/javascript">
	function doAction(){
		if(document.fr.level.disabled == true){
			document.fr.level.disabled = false;
		}
		document.fr.submit();
	}
</script>
<body>
<%
	msession ms = new msession();
	ms = (msession)session.getAttribute("ms");
	
	if(ms == null){%>
		<script type="text/javascript">
			alert("로그인이 필요한 페이지입니다.");
			location.href="login.jsp";
		</script>
<%	}else{
		if(ms.getLevel() < 3){
	%>
		<script type="text/javascript">
			alert("관리자 전용 페이지입니다.");
			location.href="../reserv/main.jsp";
		</script>
	<%
		}
	}
	String id = request.getParameter("id");
	memberBean mb = null;
	int level = 0;
	if(id == null){%>
		<script type="text/javascript">
			alert("회원을 선택하세요");
			location.href="userList.jsp";
		</script>
<%	}else{
		memberDAO dao = new memberDAO();
		mb = dao.getMember(id);
		dao.closeDB();
		level = mb.getLevel();
%>
	<div class="container">
		<div class="container_inner">
		<h2 class="container_title">관리자용 회원관리</h2>
		<table class="info_table">
			<tr>
				<th class="info_th">회원번호</th>
				<td class="info_td"><%=mb.getMember_id() %></td>
				<th class="info_th">아이디</th>
				<td class="info_td"><%=mb.getId() %></td>
			</tr>
			<tr>
				<th class="info_th">이름</th>
				<td colspan="3"><%=mb.getName() %></td>
			</tr>
		</table>
		<form action="adminUpdatePro.jsp?id=<%=id %>" method="post" name="fr">
			<div class="input_div"><span class="input_label">회원등급</span>
				<select class="input_area" name="level" <%if(level == 3){ %> disabled="disabled" <%} %>>
					<option value="1" <%if(level == 1){ %> selected="selected" <%} %>>일반회원</option>
					<option value="2" <%if(level == 2){ %> selected="selected" <%} %>>기업회원</option>
					<option value="3" <%if(level == 3){ %> selected="selected" <%} %>>관리자</option>
				</select>
			</div>
			<div class="input_div">
				<span class="input_label">현재 포인트</span>
				<input class="input_area" type="text" name="beforepoint" value="<%=mb.getPoint()%>" readonly="readonly">
			</div>
			<div class="input_div">
				<span class="input_label">추가 포인트</span>
				<input class="input_area" type="text" name="addpoint" value="0">
			</div>
			<div class="input_div">
				<button class="input_button" type="button" onclick="return doAction();">수정하기</button><button class="input_button" type="button" onclick="history.back();">뒤로</button>
			</div>
		</form>
		</div>
	</div>
<%	} %>
</body>
</html>