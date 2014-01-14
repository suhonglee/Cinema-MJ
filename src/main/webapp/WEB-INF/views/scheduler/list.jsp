<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  page import="java.util.*"%>
<%@ page import="com.kcontents.cinemadream.domain.Scheduler" %>
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
	<link href="${CONTEXT}/resources/css/FrameWork/jquery-ui-1.9.2.custom.css" rel="stylesheet">
	<style>
		.scheduleTitle
		{
			text-align: center;
			width: 100%;
			margin: 0px auto;
		}
		table
		{
			text-align: left;
			width: 100%;
			margin: 0px auto;
		}
		#titleYear
		{
			width:100px;
		}
		#titleMonth
		{
			width:100px;
		}
		.scheduleHeader
		{
			text-align: center;
			width: 100%;
		}
		/* 일요일 빨간색 */
		.scheduleHeader > tr > th:first-child
		{
			color: red;
		}
		td
		{
			width: 10%;
			height: 50%;
		}
		/* .scheduleList
		{
			width: 10%;
			height: 50%;
		}
		.blankList
		{
			width: 10%;
			height: 50%;
		} */
		.schedule
		{
			min-height: 120px;
		}
	</style>
</head>
<body>
	<%
		int year = (Integer)request.getAttribute("year");
		int month = (Integer)request.getAttribute("month");
		Calendar calendar = Calendar.getInstance();
		calendar.setLenient(false);
	%>
	<div class="scheduleTitle">
		<a href="${CONTEXT }/scheduler/<%=year-1 %>/<%=month %>">이전</a>
		<span id="titleYear"><%=year %></span>
		<a href="${CONTEXT }/scheduler/<%=year+1 %>/<%=month %>">다음</a>
		<br/>
		<a href="${CONTEXT }/scheduler/<%=year %>/<%=month-1 %>">이전</a>
		<span id="titleMonth"><%=month %></span>
		<a href="${CONTEXT }/scheduler/<%=year %>/<%=month+1 %>">다음</a>
	</div>
	<a href="${CONTEXT }/scheduler/write">새로운 스케쥴 작성</a>
	<table>
		<thead class="scheduleHeader">
			<tr>
				<th>일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</tr>	
		</thead>
		<tbody>
		<%
			for(int i=1;i<=31;i++)
			{
				try
				{
					calendar.set(year, month-1, i);
					if(i==1)
					{
						for(int j=0;j<calendar.get(Calendar.DAY_OF_WEEK) - 1;j++)
						{
							out.write("<td class=\"blankList\"></td>");
						}
					}
					switch(calendar.get(Calendar.DAY_OF_WEEK))
					{
					case Calendar.SATURDAY:
						out.write("<td class='scheduleList'><div class='schedule' id='schedule_"+i+"'>"+i+"</div></td>");
						out.write("</tr>");
						break;
					case Calendar.SUNDAY:
						out.write("<tr>");
						out.write("<td class='scheduleList'><div class='schedule' id='schedule_"+i+"'>"+i+"</div></td>");
						break;
					default:
						out.write("<td class='scheduleList'><div class='schedule' id='schedule_"+i+"'>"+i+"</div></td>");
					}
				}catch(IllegalArgumentException e)
				{
					break;
				}
			}
		%>
		</tbody>
	</table>
</body>
<script src="${CONTEXT }/resources/js/FrameWork/jquery-1.8.3.min.js"></script>
<script src="${CONTEXT }/resources/js/FrameWork/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${CONTEXT }/resources/js/main.js"></script>
<script>
	$(function()
	{
		$(".scheduleHeader").tabs();
		$(".scheduleList").menu();
		$("#titleYear").button();
		$("#titleMonth").button();
	});
	$.ajax({
		type: "GET"
		,url: "${CONTEXT}/scheduler/${year}/${month}/schedule"
	}).done(function(data){
		$.each(data, function(key,val){
			if(data[key].cancel)
			{
				$("#schedule_"+data[key].day).append("<div onclick=\"showSchedule("+data[key].no+")\"><s>"+data[key].title+"</s></div>");
			}
			else
			{
				$("#schedule_"+data[key].day).append("<div onclick=\"showSchedule("+data[key].no+")\">"+data[key].title+"</div>");
			}
		});
	});
	function showSchedule(no)
	{
		var popupUrl="${CONTEXT}/scheduler/schedule/"+no;
		var popupOption="width=370,height=360,resizable=yes,scrollbars=yes,status=no";
		window.open(popupUrl,"",popupOption);
	}
</script>
</html>
