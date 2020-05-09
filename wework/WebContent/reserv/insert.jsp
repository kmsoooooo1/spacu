<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.wework.img.imgBean"%>
<%@page import="com.wework.img.imgDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.wework.place.placeDAO"%>
<%@page import="com.wework.place.placeBean"%>
<%@page import="com.wework.location.locationBean"%>
<%@page import="com.wework.location.locationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/insertreserv.css">
<link rel="stylesheet" href="../css/basic.css">
<script type="text/javascript">
	function toggle(i){
		var select = document.getElementsByClassName("place_info");
		var cost = document.getElementsByClassName("place_perhour")[i];
		for(var j = 0; j<select.length; j++){
			select[j].style.display = 'none';
		}
		select[i].style.display='block';
		document.fr.cost.value=cost.value;
		document.fr.perhour.value=cost.value;
	}
	
	function reserv_check(){
		if(document.fr.place_name.checked ==false){
			alert("장소체크");
			return false;
		}
		if(document.fr.starttime.value == ""){
			alert("시작시간");
			return false;
		}
		if(document.fr.usetime.value==""){
			alert("사용시간");
			return false;
		}
		if(document.fr.people.value==""){
			alert("사용인원");
			return false;
		}
		if(document.fr.cost.value==""){
			alert("총 요금");
			return false;
		}
		
		document.fr.submit();
	}
	function getCost(){
		document.fr.cost.value=document.fr.perhour.value*document.fr.usetime.value;
	}
	
	function img_change(i,cnt, arr){
		var num = document.getElementsByClassName('place_img_num')[cnt].value;
		if(i>0){
			num++;
			if(num==arr.length){
				num=0;
			}
			document.getElementsByClassName('place_img')[cnt].style.backgroundImage="url('" + arr[num]  + "')";
		}else{
			num--;
			if(num<0){
				num=(arr.length-1);
			}
			document.getElementsByClassName('place_img')[cnt].style.backgroundImage="url('" + arr[num]  + "')";
		}
		document.getElementsByClassName('place_img_num')[cnt].value = num;
	}
	
	function location_change(i){
		var num = document.getElementsByClassName('location_img_num')[0].value;
		if(i>0){
			num++;
			if(num==larr.length){
				num=0;
			}
			document.getElementsByClassName('location_img')[0].style.backgroundImage="url('" + larr[num]  + "')";
		}else{
			num--;
			if(num<0){
				num=(larr.length-1);
			}
			document.getElementsByClassName('location_img')[0].style.backgroundImage="url('" + larr[num]  + "')";
		}
		document.getElementsByClassName('location_img_num')[0].value = num;
	}
</script>
</head>
<body>
	<jsp:include page="../inc/header.jsp"/>
<% 	int cnt = 0;
	Calendar cal = Calendar.getInstance();
	
	String year = String.valueOf(cal.get(Calendar.YEAR));
	String month = (cal.get(Calendar.MONTH)+1<10)?"0"+String.valueOf(cal.get(Calendar.MONTH)+1):String.valueOf(cal.get(Calendar.MONTH)+1);
	String day = (cal.get(Calendar.DATE)<10)?"0"+String.valueOf(cal.get(Calendar.DATE)):String.valueOf(cal.get(Calendar.DATE));
	
	String date = year + "-" + month + "-" + day;

	String str = request.getParameter("id");
	int id = 0;
	if(str == null){%>
		<script type="text/javascript">
			alert("장소를 선택해주세요.");
			location.href="locations.jsp";
		</script>
<%	}else{
		id = Integer.parseInt(str);
	}
	
	locationDAO dao = new locationDAO();
	locationBean lb = dao.getLocation(id);
	List<imgBean> locationImg = null;
	dao.closeDB();
	
	if(lb != null){
		placeDAO pdao = new placeDAO();
		List<placeBean> list = pdao.getPlaceList(id);
		pdao.closeDB();
		imgDAO idao = new imgDAO();
		locationImg = idao.getList(id, 0);
		if(locationImg.size()>0){
		%>
			<script type="text/javascript">
				var larr = new Array();
			<%	for(imgBean ib : locationImg){%>
					larr[<%=cnt%>]="<%=ib.getImg_src()%>"; 
				<%	cnt++;
				}%>
			</script>
		<%} %>

	<div id="container">
		<div class="container_inner">
			<div class="location_info_div">
				<h1 class="location_name"><%=lb.getLocation_name() %></h1>
				<h2 class="location_exp1"><%=lb.getLocation_exp() %></h2>
				<div class="location_img" style="background-image:
												<%if(locationImg.size()>0){ %>
												url('<%=locationImg.get(0).getImg_src()%>');
												<%}else{ %>
												url('null');
												<%}%>
												">
					<div class="img_btn l_img_btn img_btn_l" onclick="location_change(-1);"><</div>
					<input class="location_img_num" type="hidden" value="0">
					<div class="img_btn l_img_btn img_btn_r" onclick="location_change(1);">></div>
				</div>
				<h2 class="location_exp2"><%=lb.getLocation_exp() %></h2>
				<h4 class="info">공간 소개</h4>
				<p class="location_text"><%=lb.getText() %>
				</p>
				<span class="info1">영업시간 </span><span class="info2"><%=lb.getWorktime() %></span>
				<hr>
				<span class="info1">휴무일</span><span class="info2"><%=lb.getHolyday() %></span>
			</div>
			<div class="reserv_div">
				<h3>예약 선택</h3>
				<form action="insertPro.jsp?id=<%=id %>" method="post" name="fr">
				<%
		
		cnt = 0;
%>		
		
		<% 	if(list.size() > 0){
				for(placeBean pb : list){
					
					List<imgBean> imgList = idao.getList(id, pb.getPlace_id());
					System.out.println(imgList);
					
						if(imgList.size()>0){
					%>
					<script type="text/javascript">
						var arr<%=cnt%>	= new Array();
							<%for(int i = 0; i<imgList.size(); i++){%>
						arr<%=cnt%>[<%=i%>] = "<%=imgList.get(i).getImg_src()%>";
							<%}%>
					</script>
					<%
						}
					
		%>
					<input type="radio" name="place_name" value="<%=pb.getPlace_id()%>" onclick="toggle(<%=cnt%>);"><span class="formtitle"><%=pb.getPlace_name() %></span><br>
					<div class="place_info">
						<%if(imgList.size()>0){ %>
						<div class="place_img" style="background-image: url('<%=imgList.get(0).getImg_src() %>')">
						<%}else{ %>
						<div class="place_img" style="background-image: url('null')">
						<%} %>
						<div class="img_btn p_img_btn img_btn_l" onclick="img_change(-1,<%=cnt%>,arr<%=cnt%>)"><</div><div class="img_btn p_img_btn img_btn_r" onclick="img_change(1,<%=cnt%>,arr<%=cnt%>)">></div></div>
						<input class="place_img_num" type="hidden" value="0">
						<input class="place_perhour" type="hidden" value="<%=pb.getPerhour() %>"> 
						<span class="p_info_title">공간유형</span><span class="p_info_text"><%=pb.getPlace_type() %></span><br>
						<span class="p_info_title">예약시간</span><span class="p_info_text">최소 <%=pb.getMinhour() %> 시간부터</span><br>
						<span class="p_info_title">예약인원</span><span class="p_info_text">최소 1명 ~ 최대 <%=pb.getMaxsize() %> 명</span><br>
					</div>
					
		<%
					cnt ++;
					}
				}
		%>
					<div class="reserv_info">
						<input type="hidden" name="maxsize" value="0">
						<input type="hidden" name="minhour" value="0">
						<label><span class="p_info_title">예약날짜</span><input class="input_area" type="date" name="date" value="<%=date %>" min=""></label>
						<label><span class="p_info_title">예약시간</span><input class="input_area" type="time" name="starttime" value="09:00:00"></label>
						<label><span class="p_info_title">이용시간</span><select name="usetime" class="input_area" onchange="getCost();">
							<option value="1" selected="selected">1시간</option>
							<option value="2">2시간</option>
							<option value="3">3시간</option>
							<option value="4">4시간</option>
							<option value="5">5시간</option>
							<option value="6">6시간</option>
							<option value="7">7시간</option>
							<option value="8">8시간</option>
							<option value="9">9시간</option>
						</select></label>
						<label><span class="p_info_title">예약인원</span><input class="input_area" type="text" name="people"></label>
						<label><span class="p_info_title">총사용료</span><input class="input_area" type="text" name="cost" readonly="readonly"></label>
						<input type="hidden" name="status" value="예약완료">
						<input type="hidden" name="perhour" value="0">
						<label><span class="p_info_title">코멘트</span><input class="input_area" type="text" name="comment"></label>
						<button class="input_button" type="button" onclick="reserv_check();">예약하기</button>
					</div>	
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"/>
</body>
<%		idao.closeDB();
	}else{
		
	}
%>

</html>