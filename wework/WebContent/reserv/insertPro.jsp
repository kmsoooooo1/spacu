<%@page import="com.wework.member.memberDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.wework.reservation.reservDTO"%>
<%@page import="com.wework.reservation.reservDAO"%>
<%@page import="com.wework.member.msession"%>
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
	String location_id = request.getParameter("id");
	reservDTO dto = null;
	msession ms = (msession)session.getAttribute("ms");
	int chk = -1;
	if(ms==null){
	%>
		<script type="text/javascript">
			alert("로그인이 필요한 페이지입니다.");
			location.href="../user/login.jsp";
		</script>
	<%
	}else{
		
		memberDAO mdao = new memberDAO();
		int member_id = mdao.getMember_id(ms.getId());
		mdao.closeDB();
		
		int place_id = Integer.parseInt(request.getParameter("place_name"));
		String date = request.getParameter("date");
		String starttime = request.getParameter("starttime");
		int usetime = Integer.parseInt(request.getParameter("usetime"));
		int people = Integer.parseInt(request.getParameter("people"));
		int cost = Integer.parseInt(request.getParameter("cost"));
		String comment = request.getParameter("comment");
		String status = request.getParameter("status");
		System.out.println("status : " + status);
		dto = new reservDTO(0,
				member_id,
				place_id,
				date,
				starttime,
				people,
				usetime,
				cost,
				comment,
				status);
		System.out.println(dto);
		
		reservDAO rdao = new reservDAO();
		chk = rdao.insertReserv(dto);
		rdao.closeDB();
	}

	if(chk>0){
	%>
	<script type="text/javascript">
		alert("예약성공");
		location.href="insert.jsp?id=<%=location_id%>";
	</script>
	<%
	}else{
	%>
		<script type="text/javascript">
			alert("예약실패");
			history.back();
		</script>
	<%
	}

%>
</body>
</html>