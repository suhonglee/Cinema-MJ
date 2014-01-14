<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
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
		top: 20px;
		margin: 0px auto;
		width: 150px;
		list-style: none;
	}
	
	.btn-wrapper > li{
		float: left;
	}
	
	
	.bbs-button{
		width: 60px;
		height: 25px;
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
	
	
	
	</style>
</head>
<body>
	<!-- MENU=======================================-->
	<div class="top-menu"><jsp:include page="topmenu.jsp" flush="false"/> </div>
	
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
			<c:if test="${isFailed == true}">
				<div class="errorblock">
					로그인에 실패하였습니다.<br /> 
					Caused : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
				</div>
			</c:if>
			<form name='f' action="<c:url value='j_spring_security_check' />"
				method='POST'>
				<table>
					<tr>
						<td>ID :</td>
						<td><input type='text' name='j_username' value=''>
						</td>
					</tr>
					<tr>
						<td>PASS :</td>
						<td><input type='password' name='j_password' />
						</td>
					</tr>
				</table>
				<ul class="btn-wrapper">
					<li ><input class="bbs-button" name="submit" type="submit"
						value="Login" />
					</li>
					<li ><input class="bbs-button" name="reset" type="reset" 
						value="Cancle"/>
					</li>
				</ul>
			</form>
		</div>
	</div>
	
	<!-- FOOTER=======================================-->
	<div class="footer"><jsp:include page="footer.jsp" flush="false"/> </div>
	
</body>

<!-- jQuery , bootstrap -->
<script src="${CONTEXT }/resources/js/FrameWork/jquery-1.8.3.min.js"></script>
<script src="${CONTEXT }/resources/js/FrameWork/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${CONTEXT }/resources/js/main.js"></script>


</html>