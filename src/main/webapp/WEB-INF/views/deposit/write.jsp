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
			background: url(img/icon/title_pattern.png) left top;
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
		.write-title > form > div > .write-label {
			float: left;
			width: 10%;
			display: block;
			font-family: sans-serif;
			font-weight:600;
			color: #242424;
		}
		.foot-button{
			position: relative;
			top: 20px;
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
		.bbs-button:after{	
		}
		/*
			===========리스트
		*/
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
			background: url(img/icon/title_pattern.png) left top;
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
		.on-submit-btn,
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
		.on-submit-btn:hover,
		.bbslist-inform-button:hover {
			background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #242424), color-stop(1, #363636) );
			background:-moz-linear-gradient( center top, #242424 5%, #363636 100% );
			filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#242424', endColorstr='#363636');
			background-color:#242424;
			color: #fff;
		}
		.on-submit-btn:ACTIVE,
		.bbslist-inform-button:active {
			position:relative;
		}
		
		#errors-div{
			margin: auto 0px;
			width:60%;
			margin-bottom: 20px;
		}
		#errors-div > span{
			display:block;
			width:100%;
			color:red;
			font-size: 12px;
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
	
	<div id="bbslist-header-title">
		<div>
			<h1>견적의뢰.문의</h1>
			<h2>RESERVATION BOARD</h2>
		</div>
	</div>
	<!--header 빗금-->
	<div class="bbslist-header-bottom">
	</div>
	
	
	
	<!-- CONTENTS=======================================-->
		
	<div class="contents-area">
		<div class="board-Wrapper">
			<div class="write-wrapper">
				<div class="write-header"><span>Write</span></div>
				<div class="write-title">
					<form:form modelAttribute="deposit" id="fwrite" action="${CONTEXT }/deposit/" method="POST" onsubmit="return writeValid()">
						<div id="errors-div">
							<form:errors path="title"/>
							<form:errors path="content"/>
							<form:errors path="writer"/>
							<form:errors path="password"/>
							<form:errors path="tel"/>
							<form:errors path="email"/>
						</div>
						<div>
							<span class="write-label">제 목</span>
							<form:input type="text" path="title" id="title" cssClass="input-style" placeholder="제목을 입력하세요"/>
						</div>
						<form:textarea path="content"/>
						<div>
							<span class="write-label">작 성 자</span>
							<form:input type="text" path="writer" cssClass="input-style" placeholder="이름"/>
						</div>
						<div>
							<span class="write-label">비밀번호</span> 
							<form:input type="password" path="password" cssClass="input-style" placeholder="비밀번호"/>
						</div>
						<div>
							<span class="write-label">연락처</span> 
							<form:input type="text" path="tel" cssClass="input-style" placeholder="010-0000-0000 형식으로 입력해주세요."/>
						</div>
						<div>
							<span class="write-label">이메일</span>
							<form:input type="text" path="email" cssClass="input-style" placeholder="Email"/>
						</div>
						<div>
							<span class="write-label">입금자명</span>
							<form:input type="text" path="depositor" cssClass="input-style" placeholder=""/>
						</div>
						<div>
							<span class="write-label">입금은행</span>
							<form:input type="text" path="depositBank" cssClass="input-style" placeholder=""/>
						</div>
						<div>
							<span class="write-label">입금금액</span>
							<form:input type="text" path="depositMoney" cssClass="input-style" placeholder=""/>
						</div>
							<div>
								<div class="foot-button">
									<input class="on-submit-btn bbs-button" type="submit" value="글쓰기"/>
								</div>
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
<script>
	function writeValid()
	{
		return true;
		var id = $("#writer").val();
		if(id.indexOf("admin") != -1 || id.indexOf("관리") != -1 || id.indexOf("운영") != -1 || id.indexOf("시네마MJ") != -1)
		{
			alert('아이디엔 관리자를 의미하는 단어가 포함될 수 없습니다');
			return false;
		}
		if($("#writer").val().length<2 || $("#writer").val().length>20)
		{
			alert('작성자명이 2자 이상 20자 미만이어야 합니다.');
			return false;
		}
		if($("#password").val().length<5 || $("#password").val().length>20)
		{
			alert('비밀번호가 6자 이상 20자 미만이어야 합니다.');
			return false;
		}
		var telArr = $("#tel").val().split('-');
		if(telArr.length<3 || $("#tel").val().length<12 || $("#tel").val().length>13)
		{
			alert('연락처가 잘못되었습니다.');
			return false;
		}
		if($("#email").val().length>50)
		{
			alert('이메일이 잘못되었습니다.');
			return false;
		}
		if($("#title").val().length<5 || $("#title").val().length>29)
		{
			alert('제목이 5자 이상 30자 미만이어야 합니다.');
			return false;
		}
		if($("#content").val().length<20 || $("#content").val().length>20000)
		{
			alert('내용이 20자 이상이어야 합니다.');
			return false;
		}
		return true;
	}
</script>
</html>
