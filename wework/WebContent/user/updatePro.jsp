<%@page import="com.wework.member.msession"%>
<%@page import="com.wework.member.memberBean"%>
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
	
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");

	msession ms = (msession)session.getAttribute("ms");
	memberDAO dao = new memberDAO();
	memberBean mb = dao.getMember(ms.getId());
	mb.setName(name);
	mb.setBirth(birth);
	mb.setGender(gender);
	mb.setPhone(phone);
	mb.setEmail(email);
	
	int chk = dao.updateMember(mb);
	
	dao.closeDB();
	
	if(chk > 0){
	%>
	<script type="text/javascript">
		alert("변경 성공!");
		location.href="info.jsp";
	</script>		
	<%		
	}else{
	%>
	<script type="text/javascript">
		alert("수정 실패");
		history.back();
	</script>
	<%
	}
%>

</body>
</html>