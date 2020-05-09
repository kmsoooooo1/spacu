<%@page import="com.wework.member.memberBean"%>
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
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	int level = Integer.parseInt(request.getParameter("level"));
	int point = Integer.parseInt(request.getParameter("beforepoint")) + Integer.parseInt(request.getParameter("addpoint"));
	
	memberDAO dao = new memberDAO();
	memberBean mb = dao.getMember(id);
	
	mb.setLevel(level);
	mb.setPoint(point);
	
	int chk = dao.updateMember(mb);
	dao.closeDB();
	
	if(chk>0){
	%>
		<script type="text/javascript">
			alert("수정성공!");
			location.href="userList.jsp";
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