<%@page import="com.wework.member.msession"%>
<%@page import="com.wework.member.memberDAO"%>
<%@page import="com.wework.member.memberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/join.css">
<link rel="stylesheet" href="../css/basic.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Monoton&display=swap" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript">
	function check(){
		if(document.fr.name.value == ""){
			alert("이름을 입력해 주세요!");
			document.fr.name.focus();
			return false;
		}
		if(document.fr.birth.value==""){
			alert("생년월일을 입력해 주세요!");
			document.fr.birth.focus();
			return false;
		}
		if(document.fr.phone.value==""){
			alert("전화번호를 입력해 주세요!");
			document.fr.phone.focus();
			return false;
		}
		if(document.fr.email.value==""){
			alert("이메일을 입력해 주세요!");
			document.fr.email.focus();
			return false;
		}
		
		document.fr.submit();
	}
</script>
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
		System.out.println(mb);
		
		dao.closeDB();	
	}
	
	if(mb != null){
%>
<header id="header">
	<div class="header_inner">
		<h2 class="header_logo"><a href="../reserv/main.jsp">SPACU</a></h2>
	</div>
</header>
<div class="container">
	<div class="container_inner">
		<h2 class="container_title">회원 정보 수정</h2>
		<div class="form_div">
			<form action="updatePro.jsp" method="post" name="fr">
				<div class="input_div"><span class="input_label">아이디</span><input class="input_area1" type="text" name="id" placeholder="아이디 확인" readonly="readonly" value="<%=mb.getId()%>">
				</div>
				<div class="input_div"><label><span class="input_label">이름</span><input class="input_area2" type="text" name="name" value="<%=mb.getName()%>"></label></div>
				<div class="input_div"><label><span class="input_label">생년월일</span><input class="input_area2" type="text" name="birth" placeholder="YYYYMMDD" value="<%=mb.getBirth()%>"></label></div>
				<div class="input_div"><span class="input_label">성별</span><input type="radio" name="gender" value="남" <%if(mb.getGender().equals("남")){%> checked="checked" <%}%>> 남 <input type="radio" name="gender" value="여" <%if(mb.getGender().equals("여")){ %> checked="checked" <%} %>>여</div>
				<div class="input_div"><label><span class="input_label">전화번호</span><input class="input_area1" type="text" name="phone" readonly="readonly" value="<%=mb.getPhone()%>"></label>
				<button class="input_button" type="button" onclick="window.open('phoneCheck.jsp','_blank','width=500,height=400',false);">전화번호 확인</button></div>
																										<!-- 	전화번호 확인 페이지 확인 필요 -->
				<div class="input_div"><label><span class="input_label">이메일</span><input class="input_area1" type="email" name="email" value="<%=mb.getEmail()%>"></label>
				<button class="input_button" type="button" onclick="">이메일확인</button></div>
				<div class="input_div"><button class="input_button" type="button" onclick="return check();">회원정보 수정</button><button class="input_button" type="button" onclick="location.href='info.jsp'">뒤로</button></div>
			</form>
		</div>
	</div>
</div>
<%	}else{
	%>
		정보없음.
	<%
	}
	
%>
</body>
</html>