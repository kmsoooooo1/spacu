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
	String place_string = (String)session.getAttribute("place_id");
	int place_id = 0;
	if(place_string == null){
		%>
			<script type="text/javascript">
				alert("장소를 선택해 주세요.");
				location.href="locationList.jsp";
			</script>
		<%
	}else{
		place_id = Integer.parseInt(place_string);
	}
	
	locationDAO dao = new locationDAO();
	dao.deleteLocation(place_id);
	session.removeAttribute("location_id");
%>
<script type="text/javascript">
	alert("삭제 완료, 리스트로 이동합니다.");
	location.href="locationList.jsp";
</script>
</body>
</html>