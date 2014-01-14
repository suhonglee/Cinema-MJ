<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>CINEMA M.J</title>
	<meta name="viewport" content="width=device-width initial-scale=1.0">
   	<!-- Bootstrap -->
   	<link href="${CONTEXT }/resources/css/FrameWork/bootstrap.css" rel="stylesheet" media="screen">
   	<link href="${CONTEXT }/resources/css/FrameWork/bootstrap-responsive.css" rel="stylesheet" media="screen">
	<link href="${CONTEXT }/resources/css/sample_detail.css" rel="stylesheet" media="screen">
	<link href="${CONTEXT }/resources/css/main.css" rel="stylesheet" media="screen">	
	<style>
		body{
			margin-top: 72px;
			background-color: #efefef;
		}
		.vimeo{
			width: 1000px;
			height: 563px;
			background-color: #ccc;
			margin: 40px 10px 40px 10px;	
		}
		#ggomsu_player{
			width: 1000px;
			height: 563px;
		} 
		
		
		.sp-bottom > p{
			word-break: all;
		}
	</style>
</head>
<style>
	
</style>
<body>
	<!-- MENU=======================================-->
	<div class="top-menu"><jsp:include page="../topmenu.jsp" flush="false"/> </div>
	
	<div class="social">
		<div class="icon"> </div>
		<div class="icon"> </div>
		<div class="icon"> </div>
		<div class="icon">
			<sec:authorize access="isAnonymous()">
				<a href="${CONTEXT }/login"><img src="${CONTEXT}/resources/img/icon/lock.png" /></a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<a href="${CONTEXT }/j_spring_security_logout"><img src="${CONTEXT}/resources/img/icon/unlock.png" /></a>
			</sec:authorize>
		</div>
	</div>
	
	<!-- CONTENTS=======================================-->
	<div id="sp-header-title">
		<div>
			<h1>${sample.title }</h1>
			<h2>Cinema Dream</h2>
		</div>
	</div>
	<!--header 빗금-->
	<div class="sp-header-bottom">
	</div>
	<div class="sp-wrapper">
		<div class="sp-inform">
			<div class="sp-inform-left" >
				<img src="${sample.thumbnailUrl}" style="width:500px;"/>
			</div>
			<div class="sp-inform-right">
				<h4 class="sp-title"> 
					<span>INFORM</span>
				</h4>
				<table class="sp-table" width="100%">
					<tbody>
						<tr>
							<td ><strong>카테고리 :</strong></td>
							<td class="sample-cate">${sample.category }</td>
						</tr>
						<tr>
							<td ><strong>글번호 :</strong></td>
							<td>${sample.no }</td>
						</tr>
						<tr>
							<td ><strong>조회수 :</strong></td>
							<td>${sample.hit }</td>
						</tr>
						<tr>
							<td ><strong>작성일 :</strong></td>
							<td>${sample.time }</td>
						</tr>
					</tbody>
				</table>
				<p>
					<span class="sp-inform-button"><a href="${CONTEXT }/sample/">목록</a></span>
					<sec:authorize access="hasRole('ROLE_ADMIN')"> 
					<span class="sp-inform-button"><a href="${CONTEXT }/sample/update/${sample.no}">수정</a></span>
					<span class="sp-inform-button"><a href="#" onclick="deleteSample()">삭제</a></span>
					<span class="sp-inform-button"><a href="${CONTEXT }/sample/write">글쓰기</a></span>
					</sec:authorize>
				</p>
			</div>
		</div>
		<div class="sp-bottom">
			<h4 class="sp-title"> 
				<span>MOVIE</span>
			</h4>
			<div class="vimeo">
				<div class="iframe_wrapper">
					<iframe name="ggomsu_player" id="ggomsu_player" 
					src="http://player.vimeo.com/video/${sample.videoId }?fullscreen=1&autoplay=1&loop=1" 
					frameborder="0" 
					webkitallowfullscreen mozallowfullscreen allowfullscreen hidefocus="true"></iframe>
				</div>
			</div>
			<p>
				${sample.content }
			</p>
		</div>
			<!--bottom 빗금-->
		<div class="sp-footer">
			<h4 class="sp-title"> 
				<span>MOVIE-LIST</span>				
			</h4>
			<ul class="bottom-set">
				<c:forEach items="${near}" var="near">
					<c:if test="${near.no < sample.no}">
						<li>Previous : <a href="${CONTEXT }/sample/${near.no}">${near.title }</a>
					</c:if>
					<c:if test="${near.no > sample.no}">
						<li>Next : <a href="${CONTEXT }/sample/${near.no}">${near.title }</a>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- FOOTER=======================================-->
	<div class="footer"><jsp:include page="../footer.jsp" flush="false"/> </div>
	
</body>
<!-- jQuery , bootstrap -->
<script src="${CONTEXT }/resources/js/FrameWork/jquery-1.8.3.min.js"></script>
<script src="${CONTEXT }/resources/js/FrameWork/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${CONTEXT }/resources/js/main.js"></script>
<script>

	function deleteSample()
	{
		if(confirm('삭제하시겠습니까?'))
		{
		   var req = new XMLHttpRequest();
		   req.open("DELETE","${CONTEXT }/sample/${sample.no}",true);
		   req.setRequestHeader("Accept","application/json");
		   req.setRequestHeader("Content-Type","application/json; charset=utf-8");
		   req.onreadystatechange = function()
		   {
		      if(this.readyState == 4 && this.status==200)
		      {
		         if(this.responseText=="true")
		         {
		            location.replace("${CONTEXT}/sample/");
		         }
		         else if(this.responseText=="false")
		         {
		            alert('삭제에 실패하였습니다');
		         }
		         else
		         {
		            alert('접근 권한이 없습니다');
		         }
		      }
		   }
		   req.send();
		}
	}
	
	
	$(document).ready(function()
	{
		var cate = $(".sample-cate").text();
		
		if (cate == 1) 
			$(".sample-cate").text("WEDDING");
		else if(cate == 2)
			$(".sample-cate").text("BABY");
		else if(cate == 3)
			$(".sample-cate").text("PRODUCTION");
	});
	
	
</script>
</html>
