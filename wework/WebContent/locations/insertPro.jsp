<%@page import="com.wework.location.locationDAO"%>
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
%>
<jsp:useBean id="lb" class="com.wework.location.locationBean"/>
<jsp:setProperty property="*" name="lb"/>
<%
	locationDAO dao = new locationDAO();
	System.out.println(lb);
	int chk = dao.insertLocation(lb);
	dao.closeDB();
	
	if(chk > 0){
%>
<script type="text/javascript">
	alert("등록 성공!");
	location.href="locationList.jsp";
</script>
<% 	}else{%>
	<script type="text/javascript">
		alert("등록실패");
		history.back();
	</script>
<%	}
%>
</body>
</html>