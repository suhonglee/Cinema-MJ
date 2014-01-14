<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>CINEMA M.J</title>
	<meta name="viewport" content="width=device-width initial-scale=1.0">
   	<link href="${CONTEXT}/resources/css/FrameWork/bootstrap.css" rel="stylesheet" media="screen">
   	<link href="${CONTEXT}/resources/css/FrameWork/bootstrap-responsive.css" rel="stylesheet" media="screen">
   	<link href="${CONTEXT}/resources/css/main.css" rel="stylesheet" media="screen">
   	<style>
		.contents-area{
			max-width: 1020px;
			height: 250px;
			margin: 0px auto;
			background-color: #f5f5f5;
		}
		h4{	font-family: 'dotum'; font-size: 45px; font-weight: 100; color: #777; line-height: 50px; }
		
		
		.video_background{}
		
		#video_background ,
		#video_background02{
		}
	</style>
  </head>
<body>
	<!-- MENU=======================================-->
		<div class="top-menu"><jsp:include page="topmenu.jsp" flush="false"/></div>
		
		<div class="social">
			<div class="icon" id="go_blog"> </div>
			<div class="icon" id="go_cafe"> </div>
			<div class="icon" id="go_facebook"> </div>
			<div class="icon" id="go_admin">
				<sec:authorize access="isAnonymous()">
					<a href="${CONTEXT }/login"><img src="${CONTEXT}/resources/img/icon/lock.png" /></a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<a href="${CONTEXT }/j_spring_security_logout"><img src="${CONTEXT}/resources/img/icon/unlock.png" /></a>
				</sec:authorize>
			 </div>
		</div>
		<!-- MOVIE=======================================-->
			<div class="movie-area">
				<div>
					
					<video id="video_background" class="scroll-img" src="${CONTEXT}/resources/movie/main.mp4" autoplay> </video>
					<!--  <object width="100%" height="100%" id="video_background02" style=" width:1903px; height:677px;" >
					    <param name="allowfullscreen" value="true" />
					    <param name="allowscriptaccess" value="always" />
					    <param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=VIDEO_ID&amp;server=vimeo.com&amp;color=00adef&amp;fullscreen=1" />
					    <embed src="http://vimeo.com/user24001943/review/83741587/7fc9341fc5"
					        type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="WIDTH" height="HEIGHT"></embed>
					</object> -->
					<!-- <iframe src="//player.vimeo.com/video/83741587" width="1903px;" height="677px;" 
					frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen autoplay="1" loop="1"
					id="video_background02" class="scroll-img"></iframe> -->
					
				</div>
			</div>
		<!-- CONTENTS=======================================-->
		<div class="contents-area">
			<div class="title-box">
				<div class="title-container" > 
					<div class="right-title"><img src="${CONTEXT}/resources/img/icon/icon_02.png"/></div>
					<div class="title-wrapper">
						<div class="move-title">
							<div class="t1 title"><h3>We want the best.</h3></div>
							<div class="t2 title"><h3>Passion is our philosophy.</h3></div>
							<div class="t3 title"><h4>We will do the business <br/>for the people.</h4></div>
							<div class="t4 title"><h3>We are Cinema M.J</h3></div>
						</div>
					</div>
					<div class="logo-container">
						<div class="inner-logo">
						</div>
					</div>
					<div class="left-title">
						<img src="${CONTEXT}/resources/img/icon/icon_01.png"/>
					</div>
				</div>
			</div>
		</div>
		<!-- FOOTER=======================================-->
		<div class="footer"><jsp:include page="footer.jsp" flush="false"/></div>
		<input class="current-val" type="hidden" value="00"/>
</body>
<script src="${CONTEXT}/resources/js/FrameWork/jquery-1.8.3.min.js"></script>
<script src="${CONTEXT}/resources/js/FrameWork/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${CONTEXT}/resources/js/FrameWork/bootstrap.min.js"></script>
<script src="${CONTEXT}/resources/js/main.js"></script>
<script>

/* function checkBrowser() 
{
	$.browser.chrome = $.browser.webkit && !!window.chrome;
    $.browser.safari = $.browser.webkit && !window.chrome;
         
    if($.browser.msie == true)
    {
    	userAgent = $.browser.version;
		userAgent = userAgent.substring(0,userAgent.indexOf('.'));        
		version = userAgent;
		
		if(version == 6 && 7 && 8)
		{
			$("#video_background02").show();
			alert("머지")
			
		}
		else if(version == 9 && 10 && 11 )
		{
			$("#video_background").show();
		}
		else
		{
			$("#video_background").show();
			
		}   
    }
    else if($.browser.chrome || $.browser.mozilla || $.browser.safari || $.browser.opera== true)
    {
    	$("#video_background").show();
    }
} 
$(window).ready(function(){
	
	checkBrowser() 
}); */
</script>
</html>