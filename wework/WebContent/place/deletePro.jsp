<%@page import="com.wework.reservation.lpcode"%>
<%@page import="com.wework.member.msession"%>
<%@page import="com.wework.place.placeDAO"%>
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
	String pw = request.getParameter("pass");
	
	msession ms = (msession)session.getAttribute("ms");
	if(ms == null){
	%>
		<script type="text/javascript">
			alert("로그인이 필요한 페이지입니다.");
		</script>
	<%
	}else{
		if(ms.getLevel()<2){
	%>
		<script type="text/javascript">
			alert("관리자 전용페이지입니다.");
			location.href="../index.jsp";
		</script>
	<%
		}
	}
	
	lpcode code = (lpcode)session.getAttribute("code");
	if(code == null){
	%>
		<script type="text/javascript">
			alert("장소선택 오류!");
			location.href="../locations/locationList.jsp";
		</script>
	<%
	}	
	
	memberDAO dao = new memberDAO();
	int chk = dao.idCheck(ms.getId(), pw);
	dao.closeDB();
	if(chk > 0){
		//	비밀번호 확인완료
		placeDAO pdao = new placeDAO();
		chk = pdao.deletePlace(code.getPlace_id());
		if(chk>0){
			session.removeAttribute("place_id");
		%>
			<script type="text/javascript">
				alert("삭제완료");
				location.href="../locations/locationInfo.jsp";
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