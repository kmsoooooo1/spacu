<%@page import="com.wework.reservation.lpcode"%>
<%@page import="com.wework.member.msession"%>
<%@page import="com.wework.location.locationDAO"%>
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
	msession ms = (msession)session.getAttribute("ms");
	lpcode code = (lpcode)session.getAttribute("code");
	
	String pw = request.getParameter("pass");
	
	
	memberDAO dao = new memberDAO();
	int chk = dao.idCheck(ms.getId(), pw);
	dao.closeDB();
	if(chk > 0){
		//	비밀번호 확인완료
		locationDAO ldao = new locationDAO();
		chk = ldao.deleteLocation(code.getLocation_id());
		if(chk>0){%>
			<script type="text/javascript">
				alert("삭제완료");
				location.href="locationList.jsp";
			</script>
	<%	}else{%>
			<script type="text/javascript">
				alert("삭제실패");
				history.back();
			</script>
	<%	}
	}else{%>
	<script type="text/javascript">
		alert("비밀번호가 틀립니다.");
		history.back();
	</script>
<%	}
%>
</body>
</html>