<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
  <head>
    <meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>CINEMA M.J</title>
	<meta name="viewport" content="width=device-width initial-scale=1.0">
   	<link href="${CONTEXT }/resources/css/FrameWork/bootstrap.css" rel="stylesheet" media="screen">
   	<link href="${CONTEXT }/resources/css/FrameWork/bootstrap-responsive.css" rel="stylesheet" media="screen">
   	<link href="${CONTEXT }/resources/css/main.css" rel="stylesheet" media="screen">
	<style>
		
		.errorblock {
			color: #ff0000;
			background-color: #ffEEEE;
			border: 3px solid #ff0000;
			padding: 8px;
			margin: 16px;
		}
		#sp-header-title{
			margin: 0px auto;
			height: 100px;
		}
		
		.contents-area{
			max-width: 1020px;
			padding: 70px 25px 50px 25px;
			margin: 0px auto;
			border-top: 100px solid #f5f5f5;
			background-color: #ffffff;
			height: 300px;
		}
		
		.footer{
			position: relative;
			top: 50px;
			margin-top: 100px;
		}
		
		.login-wrapper{
			margin: 0px auto;
			width: 300px;
		}
		
		.btn-wrapper{
			position: relative;
			margin: 0px auto;
			width: 150px;
			list-style: none;
			
		}
		
		.btn-wrapper > li{
			float: left;
		}
		
		
		.bbs-button{
			width: 60px;
			border: 2px solid #333;
			margin-left: 5px;
			background:#242424; /* Old browsers */
			background: -moz-linear-gradient(top,  #242424 0%, #383838 100%); /* FF3.6+ */
			background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#242424), color-stop(100%,#383838)); /* Chrome,Safari4+ */
			background: -webkit-linear-gradient(top,  #242424 0%,#383838 100%); /* Chrome10+,Safari5.1+ */
			background: -o-linear-gradient(top,  #242424 0%,#383838 100%); /* Opera 11.10+ */
			background: -ms-linear-gradient(top,  #242424 0%,#383838 100%); /* IE10+ */
			background: linear-gradient(to bottom,  #242424 0%,#383838 100%); /* W3C */
			filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#242424', endColorstr='#383838',GradientType=0 ); /* IE6-9 */
			color: #fff;
			text-align: center;
			display: block;
			position:relative;
		}
		.bbs-button:hover{
			top: 1px;
		}
		.bbs-button:after{	
		}
		
		#sp-header-title > div > img{
			margin: 20px 45px 50px 45px;
		}
		.btn1{
			height: 30px;
		}
		.btn2{
			height: 26px;
			line-height: 26px;
			text-decoration: none !important;
		}
		.btn2:hover{
			text-decoration: none !important;
			color: #fff;
		}
		
		h4{
			font-family: 'Nanum Gothic Coding', serif;
			height: 20px;
			line-height: 20px;
			font-size: 15px;
			font-weight: bold;
			color: #aaa;
			margin:0;
		}
		.pass-wrapper{
			position: relative;
			left: 30px;
		}
		form{
			margin: 0px;
		}
	
	</style>
  </head>
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


<div class="contents-area">
	
	<div class="login-wrapper">
		<div id="sp-header-title">
			<div>
				<img src="${CONTEXT }/resources/img/header/h_logo02.png">
			</div>
		</div >
		<!--header 빗금-->
		<div class="sp-header-bottom">
		</div>
		<form action="${CONTEXT }/consult/${no}" method="GET" onsubmit="return chkLoginCount()">
			<div class="pass-wrapper">
				<h4>게시글의 비밀번호를 입력하세요.</h4>
				<input type="password" name="password" />
			</div>
			<br/>
			<ul class="btn-wrapper">
				<li>
					<input class="bbs-button btn1" type="submit" value="Confirm"/>
				</li>
				<li>
					<a class="bbs-button btn2" href="${CONTEXT }/consult/">Back</a>
				</li>
			</ul>
		</form>
	
	
	</div>
	
	</div>
	
<!-- FOOTER=======================================-->
	<div class="footer"><jsp:include page="../footer.jsp" flush="false"/> </div>
	
	
</body>
</body>

<!-- jQuery , bootstrap -->
<script src="${CONTEXT }/resources/js/FrameWork/jquery-1.8.3.min.js"></script>
<script src="${CONTEXT }/resources/js/FrameWork/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${CONTEXT }/resources/js/main.js"></script>
<script>
	if(${errorCode}==1 && ${loginNo == no})
	{
		if(${loginCount < 5})
		{
			alert('비밀번호가 일치하지 않습니다.\n5회 이상 입력 실패 시 30분간 시도하실 수 없습니다.\n현재 '+${loginCount}+'번째 시도입니다.');
		}
		else
		{
			alert('5회 이상 실패하셨으므로 더이상 시도하실 수 없습니다.\n30분 이후 시도해주십시오');
		}
	}
	function chkLoginCount()
	{
		if(${errorCode} == 1)
		{
			if(${loginCount} > 5)
			{
				alert('5회 이상 실패하셨으므로 더이상 시도하실 수 없습니다.\n 30분 이후 시도해주십시오');
				$.ajax({
					type: "GET"
					,url: "${CONTEXT}/logout?timeout=1800"
				});
				return false;
			}
		}
		return true;
	}
	

	function doNotReload(){
	    if((event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) //ctrl+N , ctrl+R 
	        || (event.keyCode == 116)) // function F5
	    {
	      event.keyCode = 0;
	      event.cancelBubble = true;
	      event.returnValue = false;
	    }
	}
	document.onkeydown = doNotReload;
	
	
</script>
</html>