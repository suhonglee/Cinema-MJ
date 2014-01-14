<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html lang="kr">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>CINEMA M.J</title>
		<meta name="viewport" content="width=device-width initial-scale=1.0">
    	<!-- Bootstrap -->
    	<link href="${CONTEXT}/resources/css/main.css" rel="stylesheet" media="screen">
    	<link href="${CONTEXT}/resources/css/contents2.css" rel="stylesheet" media="screen">
    	<link href="${CONTEXT}/resources/css/FrameWork/bootstrap.css" rel="stylesheet" media="screen">
    	<link href="${CONTEXT}/resources/css/FrameWork/bootstrap-responsive.css" rel="stylesheet" media="screen">
		<style>
			.main-contents > img{
				width: 93%;
			}
			
			  .contents-area
    		, .main-contents 
    		, .a-side{
    			height: 900px;
    		}
		</style>
	</head>
	<body>
		<!-- MENU=======================================-->
		<div class="top-menu"><jsp:include page="topmenu.jsp" flush="false"/></div>
		
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
			<div class="a-side">
				<div class="side-menu">
					<div class="side-menu-title">
						<h4>PRODUCT</h4>
					</div>
					<ul>
						<li class="selected-menu"><a href="product">Process</a ></li>
						<li><a href="product_composition">Composition</a></li>
					</ul>
				</div>
			</div>
			<div class="main-contents">
				<img src="${CONTEXT}/resources/img/company/c_detail01_01.jpg">  
			</div>
		</div>
		<!-- FOOTER=======================================-->
		<div class="footer"><jsp:include page="footer.jsp" flush="false"/></div>
	</body>
	<!-- jQuery , bootstrap -->
	<script src="${CONTEXT}/resources/js/FrameWork/jquery-1.8.3.min.js"></script>
	<script src="${CONTEXT}/resources/js/FrameWork/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="${CONTEXT}/resources/js/main.js"></script>
</html>
