<%@page import="com.wework.member.msession"%>
<%@page import="com.wework.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String pw = request.getParameter("pw");
	int chk = -1;
	msession ms = (msession)session.getAttribute("ms");
	if(ms == null){
	%>
		<script type="text/javascript">
			alert("로그인이 필요한 페이지입니다.");
			location.href="login.jsp";
		</script>
	<%
	}else{

		memberDAO dao = new memberDAO();
		chk = dao.idCheck(ms.getId(), pw);
		dao.closeDB();
	}
	
	if(chk>0){
		session.setAttribute("pw", pw);
		response.sendRedirect("Update.jsp");
	}else{
%>
	<script type="text/javascript">
		alert("비밀번호가 틀립니다!");
		history.back();
	</script>
<%
	}

%>
</body>
</html>