<%@page import="com.wework.member.memberDAO"%>
<%@page import="com.wework.member.msession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String pw = request.getParameter("pw");
	
	msession ms = (msession)session.getAttribute("ms");
	memberDAO dao = new memberDAO();
	
	int chk = -1;
	if(ms == null){
	%>
		<script type="text/javascript">
			alert("로그인이 필요한 페이지입니다.");
			location.href="login.jsp";
		</script>
	<%
	}else{
		
		chk = dao.idCheck(ms.getId(), pw);
	}
	
	if(chk>0){
		chk = dao.deleteMember(ms.getId());
		if(chk>0){
			session.invalidate();
		%>
			<script type="text/javascript">
				alert("이용해 주셔서 감사합니다.");
				location.href="../index.jsp";
			</script>
		<%
		}else{
		%>
			<script type="text/javascript">
				alert("탈퇴 실패");
				history.back();
			</script>
		<%
		}
	}else{
	%>
	<script type="text/javascript">
		alert("비밀번호가 틀렸습니다.");
		history.back();
	</script>
	<%
	}
	
	
%>
	

</body>
</html>