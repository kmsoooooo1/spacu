<%@page import="com.wework.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/basic.css">
<link rel="stylesheet" href="../css/idCheck.css">
<title>Insert title here</title>
<script type="text/javascript">
	function check(){
		if(document.fr.id.value ==""){
			alert("아이디를 입력해 주세요!");
			document.fr.id.focus();
			return false;
		}
		document.fr.submit();
	}
	
	function useID(){
		opener.document.fr.id.value = document.fr.id.value;
		window.close();
	}
</script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
%>
	<div class="container">
		<div class="container_inner">
			<div class="form_div">
				<h3 class="container_title">아이디 확인</h3>
				<form action="idCheck.jsp" method="post" name="fr">
					<input class="input_area" type="text" name="id" placeholder="아이디 확인"
						<% if(id != null){ %>
							value=<%=id %>
						<%} %>
					><br>
					<button class="input_button" onclick="return check();">확인하기</button>
				</form>
			</div>
		<%	if(id != null){%>
			<div class="check_box">
		<%
				memberDAO dao = new memberDAO();
				int chk = dao.idCheck(id, null);
				dao.closeDB();
				if(chk == 0){
				%>
					<span class="check_result">이미 존재하는 아이디입니다.</span>
			<%	}else{%>
					<span class="check_result">사용 가능한 아이디입니다!</span><button class="input_button" type="button" onclick="useID();">사용하기</button>
			<%	}
			%>
			</div>
		<%	}
	%>	
		</div>
	</div>


</body>
</html>