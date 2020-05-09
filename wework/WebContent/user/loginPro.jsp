<%@page import="com.wework.member.msession"%>
<%@page import="com.wework.member.memberDAO"%>
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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	memberDAO dao = new memberDAO();
	int chk = dao.idCheck(id, pw);
	
	if(chk>0){
		String[] arr = dao.loginPro(id);
		msession ms = new msession();
		
		ms.setId(arr[0]);
		ms.setLevel(Integer.parseInt(arr[1]));
		
		session.setAttribute("ms", ms);
		
%>
		<script type="text/javascript">
			alert("로그인 성공!");
			location.href="../index.jsp";
		</script>
<%	}else if(chk == 0){ %>
		<script type="text/javascript">
			alert("비밀번호를 다시 확인해 주세요!");
			history.back();
		</script>
<%	}else{ %>
		<script type="text/javascript">
			alert("존재하지 않는 아이디입니다.");
			history.back();
		</script>
<%	} 
	dao.closeDB();
%>
</body>
</html>