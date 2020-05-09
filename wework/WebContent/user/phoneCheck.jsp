<%@page import="com.wework.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check(){
		if(document.fr.phone.value == ""){
			alert("전화번호를 입력해 주세요!");
			document.fr.phone.focus();
			return false;
		}
		document.fr.submit();
	}
	function useNumber(){
		opener.document.fr.phone.value = document.fr.phone.value;
		window.close();
	}
</script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String phone = request.getParameter("phone");
	int chk = -1;
	if(phone == null){
		phone = "";
	}else{
		memberDAO dao = new memberDAO();
		chk = dao.getPhone(phone);
		dao.closeDB();
	}
%>
	<form action="phoneCheck.jsp" method="post" name="fr">
		전화번호 : <input type="text" name="phone" value=<%=phone %>><br>
		<button type="button" onclick="check();">확인</button>
	</form>
<%	if(chk > 0){%>
		이미 등록된 전화번호입니다.
<%	}else if(chk == 0){ %>
		사용 가능한 전화번호입니다.<button type="button" onclick="useNumber();">사용하기</button>
<%	} %>
</body>
</html>