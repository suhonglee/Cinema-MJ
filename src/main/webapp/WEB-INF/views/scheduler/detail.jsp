<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>CINEMA DREAM</title>
	<meta name="viewport" content="width=device-width initial-scale=1.0">
	<style>
	</style>
  </head>
<body>
	<a href="javascript: cancelSchedule()">
		<c:if test="${scheduler.cancel eq false}">
			일정 취소하기
		</c:if>
		<c:if test="${scheduler.cancel eq true }">
			일정 활성화하기
		</c:if>
	</a>
	<br/>
	일정 : 
	<span>
		${scheduler.year }-${scheduler.month }-${scheduler.day } ${scheduler.hour }:${scheduler.minute }
	</span>
	<br/>
	장소 : ${scheduler.place }
	<br/>
	신부명 : ${scheduler.bride }
	<br/>
	제목 : ${scheduler.title }
	<br/>
	내용<br/>
	${scheduler.content }
</body>
<!-- jQuery , bootstrap -->
	<script src="${CONTEXT }/resources/js/FrameWork/jquery-1.8.3.min.js"></script>
	<script src="${CONTEXT }/resources/js/FrameWork/jquery-ui-1.9.2.custom.min.js"></script>
	<script>
		function cancelSchedule()
		{
			$.ajax({
				type: "POST"
				,data: {"_method":"DELETE"
					 ,"cancel":"${scheduler.cancel}"}
				,url: "${CONTEXT}/scheduler/schedule/${scheduler.no}"
			}).done(function(data){
				if(data==true)
				{
					window.opener.location.reload();
					window.close();
				}
				else
				{
					alert("일정 취소에 실패하였습니다");
				}
			})
		}
	</script>
</html>