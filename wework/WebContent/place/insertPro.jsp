<%@page import="com.wework.reservation.lpcode"%>
<%@page import="com.wework.place.placeBean"%>
<%@page import="com.wework.place.placeDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	lpcode code = (lpcode)session.getAttribute("code");
	int location_id = code.getLocation_id();
	
	if(location_id < 1){
	%>
		<script type="text/javascript">
			alert("장소를 선택해 주세요.");
			location.href="../locations/locationList.jsp";
		</script>
	<%
	}
	
	
	String[] arr = request.getParameterValues("place_type");
	System.out.println(arr);
	String type = String.join(" ", arr);

	placeBean pb = new placeBean(0,
			location_id,
			request.getParameter("place_name"),
			type,
			Integer.parseInt(request.getParameter("minhour")),
			Integer.parseInt(request.getParameter("perhour")),
			Integer.parseInt(request.getParameter("maxsize")),
			""
			);
	
	System.out.println(pb);
	
	int chk = -1;
	placeDAO dao = new placeDAO();
	chk = dao.insertPlace(pb);
	dao.closeDB();
	
	if(chk > 0){
		System.out.println("insertPlace 성공");
		%>
			<script type="text/javascript">
				alert("등록 성공!");
				location.href="../locations/locationInfo.jsp";
			</script> 
		<%
	}else{
		System.out.println("등록 실패");
		%>
			<script type="text/javascript">
				alert("등록 실패.. 뒤로 돌아갑니다.");
				history.back();
 			</script> 
		<%
	}
%>


</body>
</html>