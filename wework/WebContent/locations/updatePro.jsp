<%@page import="com.wework.reservation.lpcode"%>
<%@page import="com.wework.location.locationDAO"%>
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
%>
<jsp:useBean id="lb" class="com.wework.location.locationBean"/>
<jsp:setProperty property="*" name="lb"/>
<%
	lpcode code = (lpcode)session.getAttribute("code");
	System.out.println(code);
	if(code != null){
		lb.setLocation_id(code.getLocation_id());
	}
	locationDAO dao = new locationDAO();
	int chk = dao.updateLocation(lb);
	dao.closeDB();
	if(chk > 0){%>
		<script type="text/javascript">
			alert("수정 성공");
			location.href="locationInfo.jsp";
		</script>
<%	}else{%>
		<script type="text/javascript">
			alert("수정실패");
			history.back();
		</script>
<%	}
%>
</body>
</html>