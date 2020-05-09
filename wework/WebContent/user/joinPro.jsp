<%@page import="com.wework.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>joinPro.jsp</h1>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mb" class="com.wework.member.memberBean"/>
<jsp:setProperty property="*" name="mb"/>
<%
	mb.setLevel(1);
	memberDAO dao = new memberDAO();
	dao.insertMember(mb);
	dao.closeDB();
%>
<script type="text/javascript">
	alert("회원가입 완료!");
	location.href="login.jsp";
</script>

</body>
</html>