<%@page import="com.wework.reservation.lpcode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/basic.css">
<link rel="stylesheet" href="../css/upload.css">

</head>
<body>
<%
	String l=request.getParameter("l");
	String p=request.getParameter("p");
	
	lpcode code = new lpcode();
	
	if(l=="" || l== null){
	%>
		<script type="text/javascript">
			location.href="../locations/locationList.jsp";
		</script>
	<%
	}else{
		code.setLocation_id(Integer.parseInt(l));
	}
	if(p=="" || p== null){
		code.setPlace_id(0);
	}else{
		code.setPlace_id(Integer.parseInt(p));
	}
	session.setAttribute("code", code);
%>
<jsp:include page="../inc/header.jsp"/>
<div class="container">
	<div class="container_inner">
		<h2 class="container_title">사진 등록</h2>
		<form action="uploadPro.jsp" method="post" name="fr" enctype="multipart/form-data">
			<input class="input_area" type="file" name="file1">
			<input class="input_area" type="file" name="file2">
			<input class="input_area" type="file" name="file3">
			<div class="button_div"><input class="input_button" type="submit" value="사진등록"><button class="input_button" type="button" onclick="history.back();">뒤로</button></div>
		</form>
	</div>
</div>
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>