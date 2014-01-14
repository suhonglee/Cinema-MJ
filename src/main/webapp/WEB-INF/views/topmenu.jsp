<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<link href="${CONTEXT}/resources/css/topmenu.css" rel="stylesheet" media="screen">
		<link href='http://fonts.googleapis.com/css?family=Crete+Round|Oswald' rel='stylesheet' type='text/css'>
    	<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
	</head>
	<body>
		<div class="logo"> </div>
		<ul class="main-menu-container">
			<li value="1" class="href01">
				<p class="change-menu01">COMAPNY &nbsp;&nbsp;<i>/</i></p>
				<div class="point01 pointer" > </div>
			</li>
			<li class="href02">
				<p class="change-menu02">SAMPLE &nbsp;<i>/</i></p>
				<div class="point02 pointer"> </div>
			</li>
			<li class="href03">
				<p class="change-menu03">PRODUCT &nbsp;<i>/</i></p>
				<div class="point03 pointer"> </div>
			</li>
			<li class="href04">
				<p class="change-menu04">PARTNER &nbsp;<i>/</i></p>
				<div class="point04 pointer"> </div>
			</li>
			<li class="href05">
				<p class="change-menu05">RESERVATION &nbsp;<i>/</i></p>
				<div class="point05 pointer"> </div>
			</li>
			<li class="href06">
				<p class="change-menu06">CONFIRMATION &nbsp;<i>/</i></p>
				<div class="point06 pointer"> </div>
			</li>
			<li class="href07">
				<p class="change-menu07">COMMUNITY</p>
				<div class="point07 pointer"> </div>
			</li>
		</ul>
	</body>
	<script src="${CONTEXT}/resources/js/FrameWork/jquery-1.8.3.min.js"></script>
	<script src="${CONTEXT}/resources/js/FrameWork/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="${CONTEXT}/resources/js/menu.js"></script>
	<script>



		$(".href01").click(function()
		{
			location.href = "${CONTEXT}/company";
		});
		$(".href02").click(function()
		{
			location.href = "${CONTEXT}/sample/";
		});
		$(".href03").click(function()
		{
			location.href = "${CONTEXT}/product";
		});
		$(".href04").click(function()
		{
			location.href = "${CONTEXT}/partner/";
		});
		$(".href05").click(function()
		{
			location.href = "${CONTEXT}/consult/";
		});
		$(".href06").click(function()
		{
			location.href = "${CONTEXT}/deposit/";
		});
		$(".href07").click(function()
		{
			location.href = "${CONTEXT}/community/";
		});
		$(".logo").click(function()
		{
			location.href = "${CONTEXT}/";
		});




				
		
		
		
		
	
	</script>
</html>
