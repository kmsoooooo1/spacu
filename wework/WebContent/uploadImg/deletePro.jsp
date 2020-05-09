<%@page import="com.wework.reservation.lpcode"%>
<%@page import="com.wework.img.imgDAO"%>
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

	lpcode code = (lpcode)session.getAttribute("code");

	String[] img = request.getParameterValues("list_select");
	
	int chk = -1;
	imgDAO dao = new imgDAO();
	
	for(String str : img){
		chk = dao.deleteImg(Integer.parseInt(str));
		if(chk<0){
			break;
		}
	} 
	
	if(chk>0){
		session.removeAttribute("place_id");
	%>
		<script type="text/javascript">
			alert("삭제완료");
			location.href="../locations/locationInfo.jsp?id=<%=code.getLocation_id()%>";
		</script>
<%	}else{%>
		<script type="text/javascript">
			alert("삭제실패");
			history.back();
		</script>
<%	}
%>
</body>
</html>