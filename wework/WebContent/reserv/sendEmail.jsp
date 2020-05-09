<%@page import="com.wework.email.sendEmail"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
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
	
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String emailText = request.getParameter("emailText");
	
	String Text = writer+ "\n" + emailText;
	
	sendEmail se = new sendEmail();
	se.setWriter(writer);
	se.setTitle(title);
	se.setEmailText(emailText);
	
	System.out.println("title : " + title);
	System.out.println("emailText : " +emailText);
	
	se.start();
%>

	<script type="text/javascript">
		alert("메일보내기 성공!");
		location.href="main.jsp";
	</script>
</body>
</html>