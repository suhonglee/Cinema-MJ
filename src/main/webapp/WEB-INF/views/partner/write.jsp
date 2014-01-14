<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
   	<link href="${CONTEXT }/resources/css/main.css" rel="stylesheet" media="screen">
   	<link href="${CONTEXT }/resources/css/sample.css" rel="stylesheet" media="screen">
   	<link href='http://fonts.googleapis.com/css?family=Crete+Round|Oswald' rel='stylesheet' type='text/css'>
	<style>
		@import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

		h1{
			font-family: 'Nanum Gothic Coding', serif;
			height: 30px;
			line-height: 30px;
			font-size: 18px;
			font-weight: bold;
			color: #666;
			margin:0;
		}
		h2{
			font-family: 'Nanum Gothic Coding', serif;
			height: 20px;
			line-height: 20px;
			font-size: 15px;
			font-weight: bold;
			color: #aaa;
			margin:0;
		}
		.write-wrapper{
			width: 1070px;
			margin: 0px auto;
		}
		.write-header{
			width: 1020px;
			height: 20px;
			background: url(${CONTEXT }/resources/img/icon/title_pattern.png) left top;
			margin-bottom: 60px;
		}
		.write-header span{
			background: #fff;
			padding: 7px 7px 7px 7px;
			font-family: 'Nanum Gothic Coding', serif;
			font-size: 15px;
			font-weight: bold;
			padding-bottom:80px;
		}
		.write-title{
			font-family: "Nanum Gothic", sans-serif;
			font-size: 14px;
			width: 70%; 
			padding-right: 30px;
			padding-left: 30px;
			margin: 0px auto;
		}
		#fwrite{
			margin-top: 30px;
		}
		.input-style{	
			width: 80%;	
		}
		#title{
			width: 80%;
		}
		#content{
			width: 80%;
			height: 300px;
			margin-left: 75px;
		}
		.write-title > form > div > span {
			float: left;
			width: 10%;
			display: block;
			font-family: sans-serif;
			font-weight:600;
			color: #242424;
		}
		.foot-button{
			padding-top:5px;
			padding-bottom:10px;
			padding-right:60px;
		}
		.foot-button > div{
			width: 60px;
		}
		.bbs-button{
			width: 60px;
			height: 25px;
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
			margin-left: 628px;
			margin-top: -20px;
		}
		.bbs-button:hover{
			top: 1px;
		}
				#bbslist{
			margin-top: 30px;
		}
		.bbslist-header{
			height: 30px;
			list-style-type: none;
			border-bottom: 1px solid #242424;
			background-color: #242424;
			margin-bottom: 0px;
		}
		.bbslist-header > li{
			float: left;
			display: inline;
			text-align: center;
			font-family: sans-serif;
			font-weight: 700;
			font-size: 15px;
			color: #fff;
		}
		.bbslist-header > li > p{
			line-height: 30px;
		}
		.bbslist-header > li:first-child{width: 10%;}
		.bbslist-header > li:nth-child(2){width: 55%;}
		.bbslist-header > li:nth-child(3){width: 20%;}
		.bbslist-header > li:nth-child(4){width: 15%;}
		.bbslist-item{
			overflow: hidden;
			list-style-type: none;
			border-bottom: 1px solid #ccc;
			background-color: #fff;
			padding: 3px;
			margin-bottom: 2px;
		}
		.bbslist-item:hover{
			background-color: #e5e5e5;
		}
		.bbslist-item-wrapper{
			position:relative;
			top: -10px;
		}
		.bbslist-item > li{
			width: 25%;
			float: left;
			display: inline;
			text-align: center;
		}
		.bbslist-item > li:hover{

		}
		.bbslist-item > li:first-child{width: 10%;}
		.bbslist-item > li:nth-child(2){width: 55%;}
		.bbslist-item > li:nth-child(3){width: 20%;}
		.bbslist-item > li:nth-child(4){width: 15%;}
		
		.write-button , .go-main-button{
			position: relative;
			float:right;
			right: 1px; 
			width: 80px;
			height: 30px;
			margin: 3px;
			background-color: #000;
			-moz-box-shadow: 2px 2px 3px #777;
			-webkit-box-shadow: 2px 2px 3px #777;
			box-shadow: 2px 2px 3px #777;
			border-radius: 1px 1px 1px 1px;
		}
		.write-button > a , .go-main-button > a{
			font-weight: 600;
			display: block;
			color: #fff;
			text-align: center;
			text-decoration: none;
			position: relative;
			top: 5px;
			width: 80px;
			margin: 0px auto;
		}
		.write-button:hover , .go-main-button:hover{
			top: 1px;
		}
		.write-button{
			background-color : #555;
			border: solid 1px #333;
		}
		.go-main-button{
			background-color : #A9302A;
			border: solid 1px #99201A;
		}
		.contents-area{
			max-width: 1020px;
			padding: 25px;
			margin: 0px auto;
			background-color: #fff;
			border-bottom: 100px solid #F5F5F5;
		}
		#bbslist-header-title{
			width:100%;
			height:100px;
			border-bottom: 1px solid #e4e4e4;
			border-top: 1px solid #e4e4e4;
			margin-top:30px;
			background: #ffffff; /* Old browsers */
			background: -moz-linear-gradient(top,  #ffffff 0%, #f6f6f6 47%, #ededed 100%); /* FF3.6+ */
			background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(47%,#f6f6f6), color-stop(100%,#ededed)); /* Chrome,Safari4+ */
			background: -webkit-linear-gradient(top,  #ffffff 0%,#f6f6f6 47%,#ededed 100%); /* Chrome10+,Safari5.1+ */
			background: -o-linear-gradient(top,  #ffffff 0%,#f6f6f6 47%,#ededed 100%); /* Opera 11.10+ */
			background: -ms-linear-gradient(top,  #ffffff 0%,#f6f6f6 47%,#ededed 100%); /* IE10+ */
			background: linear-gradient(to bottom,  #ffffff 0%,#f6f6f6 47%,#ededed 100%); /* W3C */
			filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#ededed',GradientType=0 ); /* IE6-9 */
		}
		#bbslist-header-title > div{
			width: 1020px;
			height: 50px;
			padding: 25px;
			margin: 0px auto;
		}
		.bbslist-header-bottom{
			width: 100%;
			height: 8px;
			background: url(${CONTEXT }/resources/img/icon/title_pattern.png) left top;
			margin-top:0px;
			margin-bottom:50px;
		}	
		.bbslist-inform-right > p {
			width: 100px;
			height: 15px;
			margin: 0px auto;
			padding-top:0px;
			padding-left:958px;
		}
		.bbslist-inform-button {
			font-family: 'Nanum Gothic Coding', serif;
			background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #363636), color-stop(1, #242424) );
			background:-moz-linear-gradient( center top, #363636 5%, #242424 100% );
			filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#363636', endColorstr='#242424');
			background-color:#363636;
			-webkit-border-top-left-radius:0px;
			-moz-border-radius-topleft:0px;
			border-top-left-radius:0px;
			-webkit-border-top-right-radius:0px;
			-moz-border-radius-topright:0px;
			border-top-right-radius:0px;
			-webkit-border-bottom-right-radius:0px;
			-moz-border-radius-bottomright:0px;
			border-bottom-right-radius:0px;
			-webkit-border-bottom-left-radius:0px;
			-moz-border-radius-bottomleft:0px;
			border-bottom-left-radius:0px;
			text-indent:0;
			border:1px solid #383838;
			display:inline-block;
			color:#ffffff;
			font-size:13px;
			font-weight:bold;
			font-style:normal;
			height:27px;
			line-height:27px;
			width:60px;
			text-decoration:none;
			text-align:center;
		}
		.bbslist-inform-button:hover {
			background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #242424), color-stop(1, #363636) );
			background:-moz-linear-gradient( center top, #242424 5%, #363636 100% );
			filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#242424', endColorstr='#363636');
			background-color:#242424;
			color: #fff;
		}
		.bbslist-inform-button:active {
			position:relative;
		}
		
		
		#sampleForm > span{
			width: 130px;
			display: block;
			float: left;
		}
	</style>
</head>
<body>
<!-- MENU=======================================-->
		<div class="top-menu"><jsp:include page="../topmenu.jsp" flush="false"/></div>
		
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
		<div id="bbslist-header-title">
			<div>
				<h1>WRITE</h1>
				<h2>EDITOR</h2>
			</div>
		</div>
		<!--header 빗금-->
		<div class="bbslist-header-bottom">
		</div>	
		
		
		
	<div class="contents-area">
		<div class="board-Wrapper">
			<div class="write-wrapper">
				<div class="write-title">
					<div id="progressbar"></div>
					<form:form modelAttribute="partner" action="${CONTEXT }/partner/${method}" onsubmit="return checkImage()" method="POST" enctype="multipart/form-data">
						<input type="hidden" name="no" value="${partner.no }"/>
						<div>
							<span>카테고리</span>
							<form:select path="category">
								<form:option value="1" label="BABY"/>
								<form:option value="2" label="SNAP"/>
								<form:option value="3" label="PRODUCTION"/>			
							</form:select>
							<form:errors path="category"/>
							<br/>
							<span>제목 </span>
							<form:input path="title" id="title" title="title"/><form:errors path="title"/>
							<br/>
							<form:textarea path="content" rows="5" cols="30"/>
							<form:errors path="content"/>
							<br/>
							<input type="file" name="imageFile" id="imageFile" onchange="fileCheck(this)"/>
							<br/>
							<input type="submit" value="확인" onclick="showProgressBar()"/>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!-- FOOTER=======================================-->
	<div class="footer"><jsp:include page="../footer.jsp" flush="false"/> </div>
	
</body>
<script src="${CONTEXT }/resources/js/FrameWork/jquery-1.8.3.min.js"></script>
<script src="${CONTEXT }/resources/js/FrameWork/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${CONTEXT }/resources/js/main.js"></script>
<script src="${CONTEXT }/resources/js/spin.js"></script>
<script>
	var opts = {
		  lines: 12, // The number of lines to draw
		  length: 10, // The length of each line
		  width: 6, // The line thickness
		  radius: 15, // The radius of the inner circle
		  corners: 1, // Corner roundness (0..1)
		  rotate: 90, // The rotation offset
		  direction: 1, // 1: clockwise, -1: counterclockwise
		  color: '#000', // #rgb or #rrggbb or array of colors
		  speed: 1.5, // Rounds per second
		  trail: 100, // Afterglow percentage
		  shadow: false, // Whether to render a shadow
		  hwaccel: false, // Whether to use hardware acceleration
		  className: 'spinner', // The CSS class to assign to the spinner
		  zIndex: 2e9, // The z-index (defaults to 2000000000)
		  top: '20', // Top position relative to parent in px
		  left: '70' // Left position relative to parent in px
	};
	var target = document.getElementById('progressbar');
	var spinner = new Spinner(opts).spin(target);
	$("#progressbar").hide();
	function showProgressBar()
	{
		$("#progressbar").show();
	}
	function fileCheck(file)
	{
		extensionArray = new Array(".jpg",".jpeg",".png",".bmp");
		fileName = file.value;
		fileExtension = fileName.substring(fileName.lastIndexOf('.'),fileName.length).toLowerCase();
		if(extensionArray.indexOf(fileExtension) < 0)
		{
			file.value="";
			alert(fileExtension+' 파일은 첨부할 수 없습니다.');
		}
	}
	function checkImage()
	{
		console.log($("#imageFile").val());
		if($("#title").val().length<5 || $("#title").val().length>29)
		{
			alert('제목이 5자 이상 30자 미만이어야 합니다.');
			$("#progressbar").hide();
			return false;
		}
		if($("#content").val().length<20 || $("#content").val().length>20000)
		{
			alert('내용이 20자 이상이어야 합니다.');
			$("#progressbar").hide();
			return false;
		}
		if($("#imageFile").val()=="")
		{
			alert('이미지가 첨부되지 않았습니다');
			$("#progressbar").hide();
			return false;
		}
		return true;
	}
</script>
</html>
