<%@page import="com.wework.location.locationDAO"%>
<%@page import="com.wework.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check(){
		if(document.fr.id.value ==""){
			alert("장소명을 입력해 주세요!");
			document.fr.id.focus();
			return false;
		}
		document.fr.submit();
	}
	
	function useID(){
		opener.document.fr.location_name.value = document.fr.id.value;
		window.close();
	}
</script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
%>

<%	if(id != null){%>
		<div class="check_box">
<%
		locationDAO dao = new locationDAO();
		int chk = dao.locationCheck(id);
		dao.closeDB();
		if(chk>0){
		%>
			이미 존재하는 장소입니다.
	<%	}else{%>
			사용 가능한 장소입니다!<button type="button" onclick="useID();">사용하기</button>
	<%	}
	%>
	
<%	}
%>	
	</div>
	<form action="locationCheck.jsp" method="post" name="fr" autocomplete="off" >
		장소명 : <input type="text" name="id"
			<% if(id != null){ %>
				value="<%=id %>"
			<%} %>
		><br>
		<button onclick="return check();">확인하기</button>
	</form>
	


</body>
</html>