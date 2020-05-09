<%@page import="com.wework.img.imgDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wework.img.imgBean"%>
<%@page import="com.wework.reservation.lpcode"%>
<%@page import="com.oreilly.servlet.multipart.FilePart"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	lpcode code = (lpcode)session.getAttribute("code");
	if(code == null){
	%>
		<script type="text/javascript">
			alert("장소선택 오류!");
			location.href="../locations/locationList.jsp";
		</script>
	<%
	}
	imgBean ib = null;;
	List<imgBean> list = null;
	String uploadPath = request.getRealPath("/upload");
	String fileName = null;
	String OriginFileName = null;
	int maxSize = 15 * 1024*1024;
	String imgPath = null;
	
	try{
		MultipartRequest multi = new MultipartRequest(
								request,
								uploadPath,
								maxSize,
								"utf-8",
								new DefaultFileRenamePolicy());
		
		list = new ArrayList<imgBean>();

		System.out.println("Path : " + uploadPath);
		
		fileName = multi.getFilesystemName("file1");
		if(fileName != null){
			imgPath = "../upload/" + fileName;
			System.out.println("imgPath : " + imgPath);
			ib = new imgBean(0,code.getLocation_id(),code.getPlace_id(),imgPath);
			System.out.println("ib : " + ib);
			list.add(ib);
		}
		fileName = multi.getFilesystemName("file2");
		if(fileName != null){
			imgPath = "../upload/" + fileName;
			System.out.println("imgPath : " + imgPath);
			ib = new imgBean(0,code.getLocation_id(),code.getPlace_id(),imgPath);
			System.out.println("ib : " + ib);
			list.add(ib);
		}
		
		fileName = multi.getFilesystemName("file3");
		if(fileName != null){
			imgPath = "../upload/" + fileName;
			System.out.println("imgPath : " + imgPath);
			ib = new imgBean(0,code.getLocation_id(),code.getPlace_id(),imgPath);
			System.out.println("ib : " + ib);
			list.add(ib);
		}
		System.out.println(list);
		
		imgDAO dao = new imgDAO();
		int chk = dao.insertImgList(list);
		dao.closeDB();
		if(chk>0){
		%>
			<script type="text/javascript">
				alert("이미지를 업로드했습니다.");
				location.href="../locations/locationInfo.jsp?id=<%=code.getLocation_id()%>";
			</script>
		<%
		}else{
		%>
			<script type="text/javascript">
				alert("등록실패!");
				history.back();
			</script>
		<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>