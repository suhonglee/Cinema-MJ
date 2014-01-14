<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
  <head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>CINEMA M.J</title>
	<meta name="viewport" content="width=device-width initial-scale=1.0">
   	<!-- Bootstrap -->
   	<link href="${CONTEXT }/resources/css/FrameWork/bootstrap.css" rel="stylesheet" media="screen">
   	<link href="${CONTEXT }/resources/css/FrameWork/bootstrap-responsive.css" rel="stylesheet" media="screen">
	<link href="${CONTEXT }/resources/css/reservation_board_detail.css" rel="stylesheet" media="screen">	
		<link href="${CONTEXT }/resources/css/main.css" rel="stylesheet" media="screen">
	
	<style>
		body{
			margin-top: 72px;
			background-color: #efefef;
		}
		.dpbd-inform{
			width: 1020px;
			height: 110px; 
			margin: 0px auto;
			overflow: hidden;
		}
		.reply-form-wrapper{
			position: relative;
			top: 30px;
			width: 720px;
			height: 260px;
			margin: 0px auto;
		}
		  #id
		, #password{
			width: 307px;
			height: 25px;
		}
		#content{
			width: 680px;
			height: 120px;
		}
		.reply-form-tag{
			height: 30px;
			font-size: 15px;
			line-height: 30px;
		}
		.comment-item{
			width: 93%;
			padding: 5px 20px 10px 20px;
			border-bottom: 1px solid #ddd;
			margin: 0px auto;
		}
		.btnDeleteReply{
			
		}
		.btnDeleteReply:hover{
			border-bottom: 1px solid #aaa;
		}
		.error-msg{
			color: red;
			font-size: 8px;
		}
		.comment-item
		, .comment-item > span
		{
			font-family: 'Nanum Gothic Coding', serif;
		}
		#replywrite{
			position: relative;
			left:  615px;
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

	<div id="dpbd-header-title">
		<div>
			<h1>예약 입금확인게시판</h1>
			<h2>CONFIRMATION BOARD</h2>
		</div>
	</div>
	<!--header 빗금-->
	<div class="dpbd-header-bottom">
	</div>
	<div class="dpbd-wrapper">
		<div class="dpbd-inform">
			<table class="dpbd-table" width="100%">
				<tbody>
					<tr>
						<td><strong>CINEMADREAM RESERVATION BOARD</strong></td>	
					</tr>
				</tbody>
				<div class="dpbd-inform-right">
					<span class="dpbd-inform-button"><a href='${CONTEXT }/deposit/'>목 록</a></span>
					<span class="dpbd-inform-button" onclick="deleteConfirm()"> 글삭제</span>	
				</div>
			</table>
			<table class="dpbd-header-table" width="100%">
				<tbody>
					<tr>
						<td class="table-title-td"><strong>작성일 :</strong></td>
							<td>${deposit.time }</td>
							<td class="table-title-td"><strong>글쓴이 :</strong></td>
							<td>${deposit.writer }</td>
							<td class="table-title-td"><strong>연락처 :</strong></td>
							<td>${deposit.tel }</td>
							<td class="table-title-td"><strong>이메일 :</strong></td>
							<td>${deposit.email }</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="dpbd-bottom">
				<p>
					${deposit.content }
				</p>
			</div>
				<!--bottom 빗금-->
			<div class="dpbd-footer">
				<h4 class="dpbd-title2"> 
					<span>Leave a reply</span>				
				</h4>
				<div class="reply-form-wrapper">
					<form id="replyForm">
						<span class="reply-form-tag">ID</span> 
						<sec:authorize access="isAnonymous()"> 
							<input type="text" id="id" name="id"/>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')"> 
							<input type="text" id="id" name="id" value="관리자" readonly/>
						</sec:authorize>
						<span class="reply-form-tag">PW</span>
						<sec:authorize access="isAnonymous()"> 
							<input type="password" id="password" name="password"/>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')"> 
							<input type="password" id="password" name="password" value="tempPwd" readonly/>
						</sec:authorize>
						<textarea id="content" name="content"></textarea><br/>
						<input type="button" id="replywrite" value="댓글등록" onclick="postReply()"/>
					</form>
					<div style="float: right; position: relative; top: -200px; right: 50px;">
						<span class="error-msg" id="error_id"></span><br/>
						<span class="error-msg" id="error_password"></span><br/>
						<span class="error-msg" id="error_content"></span>
					</div>
				</div>
			</div>
			<hr/>
			<div id="replylist">
			</div>
		</div>
		
		
		
	
	
	
	<!-- FOOTER=======================================-->
	<div class="footer"><jsp:include page="../footer.jsp" flush="false"/> </div>
				
	
</body>
<script src="${CONTEXT }/resources/js/FrameWork/jquery-1.8.3.min.js"></script>
<script src="${CONTEXT }/resources/js/FrameWork/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${CONTEXT }/resources/js/main.js"></script>
<script>
	selectReply();
	function deleteConfirm()
	{
		if(confirm('정말 삭제하시겠습니까?'))
		{
			$.ajax({
				type:"POST"
				,url: "${CONTEXT}/deposit/${no}"
				,data: {"_method":"DELETE"}
			}).done(function(data){
				if(data==true)
				{
					location.replace('${CONTEXT}/deposit/');
				}
				else
				{
					alert('글 삭제에 실패하였습니다');
				}
			})
		}
	}
	
	function postReply()
	{
		$("#error_id").html("");
		$("#error_password").html("");
		$("#error_content").html("");
		var id = $("#id").val();
		$.ajax({
			type: "GET"
			,url: "${CONTEXT}/checkRole?ROLE=ROLE_ADMIN"
		}).done(function(data){
			var isAdmin = data;
			if(! isAdmin)
			{
				if(id.indexOf("admin") != -1 || id.indexOf("관리") != -1 || id.indexOf("운영") != -1 || id.indexOf("시네마MJ") != -1)
				{
					alert('아이디엔 관리자를 의미하는 단어가 포함될 수 없습니다');
					return ;
				}
			}
			var data = $("#replyForm").serialize();
			$.ajax({
				type:"POST"
				,url: "${CONTEXT}/deposit/${no}/reply/"
				,data: data
			}).done(function(data){
				if(data.errors!=undefined)
				{
					$.each(data.errors,function(key,value){
						$("#error_"+key).html(value);
					})
				}
				else
				{
					$("#replyForm").trigger("reset");
					selectReply();
				}
			})
		})
	}
	
	function selectReply()
	{
		$.ajax({
			type: "GET"
			,url: "${CONTEXT}/deposit/${no}/reply/"
		}).done(function(data){
			var replyHtml='';
    		$.each(data,function(key,val)
    		{
    			replyHtml+=
    				'<div class="comment-item">'
    				+'ID : '
    				+'<span id="replyId">'+data[key].id+'</span> / '
    				+'time : '
    				+'<span id="replyTime">'+data[key].time+'</span>&nbsp; / '
    				+'<span class="btnDeleteReply" value="'+data[key].id+','+data[key].no+'">'+' Delete '+'</span><br/><br/>'
    				+'Comment : '
    				+'<span id="replyContent">'+data[key].content+'</span>'
    				+'</div>';
    		});
    		$("#replylist").html(replyHtml);
		});
	}
	
	function deleteReply(id, no)
	{
		$.ajax({
			type: "GET"
			,url: "${CONTEXT}/checkRole?ROLE=ROLE_ADMIN"
		}).done(function(data){
			var isAdmin = data;
			var password;
			if(! isAdmin)
			{
				password = prompt("댓글 작성 시 사용한 비밀번호를 입력하세요");
				if(password==null) return ;
			}
			else if(isAdmin)
			{
				var confirmDeleteReply = confirm('정말 삭제하시겠습니까?');
				if(! confirmDeleteReply)
				{
					return ;
				}
			}
			$.ajax({
				type: "POST"
				,url: "${CONTEXT}/deposit/${no}/reply"
				,data: {"_method":"DELETE"
					, "no":no
					, "id":id
					, "password":password
					, "isAdmin":isAdmin}
			}).done(function(data){
				if(data==true)
				{
					selectReply();
				}
				else
				{
					alert('댓글 삭제에 실패하였습니다');
				}
			})
		});
	}
	
	$(document).on("click" , ".btnDeleteReply" , function()
	{
		var val = $(this).attr("value");
		val = val.split(",");
		deleteReply(val[0],val[1]);
	})
			
</script>
</html>