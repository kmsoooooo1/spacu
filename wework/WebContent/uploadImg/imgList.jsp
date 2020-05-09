<%@page import="com.wework.reservation.lpcode"%>
<%@page import="com.wework.img.imgBean"%>
<%@page import="java.util.List"%>
<%@page import="com.wework.img.imgDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/basic.css">
<link rel="stylesheet" href="../css/imgList.css">
</head>
<script type="text/javascript">
	function check(){
		var arr = document.fr.list_select;
		var cnt = 0;
		for(var i = 0; i<arr.length; i++){
			if(arr[i].checked == true){
				cnt++;
			}
		}
		if(cnt<1){
			alert("유형을 선택해 주세요.");
			return false;
		}
		
		document.fr.submit();
	}
</script>
<body>
<%
	lpcode code = (lpcode)session.getAttribute("code");
	imgDAO idao = new imgDAO();
	List<imgBean> list = null;
	
	if(code == null){%>
		<script type="text/javascript">
			alert("공간선택 오류!");
			location.href="../locations/locationList.jsp";
		</script>	
<%	}else{
		list = idao.getList(code.getLocation_id(), code.getPlace_id());
	}
	
	idao.closeDB();
		
%>
<jsp:include page="../inc/header.jsp"/>
<div class="container">
	<div class="container_inner">
		<h2 class="container_title">이미지 목록</h2>
		<form action="deletePro.jsp" method="post" name="fr">
		<div class="list_wrap">
	<% 	if(list != null){
			for(imgBean ib : list){
	%>
		<ul>
			<li>
				<div class="list_div">
					<img class="list_img" src="<%=ib.getImg_src()%>" onclick="location.href='<%=ib.getImg_src()%>'"><input type="checkbox" name="list_select" value="<%=ib.getImg_id()%>">
				</div>
			</li>
		</ul>
	<%		}
		}else{ %>
		<p>등록된 이미지가 없습니다.</p>
	<%	} %>
		</form>
		</div>
		<div class="button_div">
			<button class="input_button" onclick="check();">삭제</button>
			<button class="input_button" onclick="history.back();">뒤로</button>
		</div>
	</div>
</div>
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>
