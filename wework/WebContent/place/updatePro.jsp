<%@page import="com.wework.reservation.lpcode"%>
<%@page import="com.wework.place.placeDAO"%>
<%@page import="com.wework.place.placeBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	<jsp:useBean id="pb" class="com.wework.place.placeBean"/>
	<jsp:setProperty property="*" name="pb"/>
	
<%
	lpcode code = (lpcode)session.getAttribute("code");
	String str = String.join(" ", request.getParameterValues("place_type"));
	pb.setPlace_type(str);
	pb.setLocation_id(code.getLocation_id());
	pb.setPlace_id(code.getPlace_id());
	System.out.println(pb);
	placeDAO dao = new placeDAO();
	int chk = dao.updatePlace(pb);
	dao.closeDB();
	
	if(chk>0){%>
		<script type="text/javascript">
			alert("수정 성공!");
			location.href="placeInfo.jsp?id=<%=code.getPlace_id()%>";
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