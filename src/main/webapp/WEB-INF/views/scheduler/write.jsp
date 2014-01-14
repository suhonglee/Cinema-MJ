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
	<title>CINEM ADREAM</title>
	<meta name="viewport" content="width=device-width initial-scale=1.0">
	<link href="${CONTEXT}/resources/css/FrameWork/jquery-ui-1.9.2.custom.css" rel="stylesheet">
</head>
<body>
	<form:form id="schedulerForm"  modelAttribute="scheduler" action="${CONTEXT }/scheduler/" method="post" >
		<div><form:errors path="*"/></div>
		날짜 : <input type="text" id="datepicker" readonly="true">
		<form:select path="hour">
			<c:forEach begin="1" end="24" step="1" var="i">
				<form:option value="${i }">${i }</form:option>
			</c:forEach>
		</form:select>
		<form:input type="hidden" path="year"/><form:input type="hidden" path="month"/><form:input type="hidden" path="day"/>
		시
		<form:select path="minute">
			<c:forEach begin="0" end="59" step="1" var="i">
				<form:option value="${i }">${i }</form:option>
			</c:forEach>
		</form:select>
		분
		<br/>
		장소 : <form:input type="text" path="place"/>
		<br/>
		신부명 : <form:input type="text" path="bride"/>
		<br/>
		제목 : <form:input type="text" path="title"/>
		<br/>
		<form:textarea path="content"/>
		<input type="button" value="확인" onclick="schedulerSubmit()"/>
	</form:form>
</body>
<script src="${CONTEXT }/resources/js/FrameWork/jquery-1.8.3.min.js"></script>
<script src="${CONTEXT }/resources/js/FrameWork/jquery-ui-1.9.2.custom.min.js"></script>
<script>
	//달력 아이콘 필요함
	$(function() {
	  $( "#datepicker" ).datepicker({
		showOn: "button",
		buttonImage: "../resources/css/FrameWork/jquery-ui-images/calendar.gif",
		buttonImageOnly:true,
	    showOtherMonths: true,
	    selectOtherMonths: true,
	    dateFormat: "yy-mm-dd"
	  });
	});
	function schedulerSubmit()
	{
		if($("#datepicker").val().length!=10)
		{
			alert('날짜를 선택하세요');
			return;
		}
		var date = $("#datepicker").val().split("-");
		$("#year").val(date[0]);
		$("#month").val(date[1]);
		$("#day").val(date[2]);
		$("#schedulerForm").submit();
	}
</script>
</html>
