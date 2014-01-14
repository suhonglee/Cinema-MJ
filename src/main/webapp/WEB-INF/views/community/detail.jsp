<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<link href="${CONTEXT }/resources/css/news_detail.css" rel="stylesheet" media="screen">
			<link href="${CONTEXT }/resources/css/main.css" rel="stylesheet" media="screen">	
		<script src="${CONTEXT }/resources/js/FrameWork/jquery-1.8.3.min.js"></script>
		<script>
		function changeDefaultImage(img)
		{
			$(img).attr("src","http://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg");
		}
		</script>
		<style>
			body{
				margin-top: 72px;
				background-color: #efefef;
			}
			
			
			.bottom-set > li > a,
			.bottom-set > li
			{
				font-family: 'Nanum Gothic Coding', serif;
				font-size: 15px;
				color: #777;
				margin: 5px 5px 5px 5px;
			}
			
			.bottom-set{
				margin: 25px 5px 20px 5px;
			
			}
			
			.detail_img{
				margin-top: 20px;
				margin-bottom: 20px;
			}
			
			.news-body-contents{
			
				margin-top: 20px;
				margin-bottom: 30px;
			}
			
			.recentPost > li > a{
				color: #777;
				font-family: 'Nanum Gothic Coding', serif;
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
	<div id="news-header-title">
		<div>
			<h1>COMMUNITY & NEWS</h1>
		</div>
	</div>
	<!--header 빗금-->
	<div class="news-header-bottom">
	</div>
		
	<div class="news-wrapper">
		<div class="news-inform">
			
			<div class="news-inform-left" >
				<h1>${community.title }</h1>
				<div class="news-header-bottom" style="width:90%;">
				</div>
					<img class="detail_img" src="${CONTEXT }/resources/images/community/${community.no}/titleImageFile.jpg" onerror="changeDefaultImage(this)"/>
					
					<br/><br/><br/>
					
					<img class="detail_img" src="${CONTEXT }/resources/images/community/${community.no}/contentImageFile.jpg" onerror="changeDefaultImage(this)"/>
				<div class="news-body">
						<p>
							<span   class="news-body-button"><img src="${CONTEXT }/resources/img/icon/icon_cal.png" />${community.time }</span>
							<sec:authorize access="isAuthenticated()">
							<span   class="news-body-button admin-btn"><img src="${CONTEXT }/resources/img/icon/icon_admin.png" />admin</span>
							</sec:authorize>
							<span   class="news-body-button"><img src="${CONTEXT }/resources/img/icon/icon_news.png" />${community.no}</span>
						</p>
					<sec:authorize access="isAuthenticated()">
						<span class="news-body-button2"><a href="${CONTEXT }/community/write">글쓰기</a></span>
						<span class="news-body-button2"><a href="${CONTEXT }/community/update/${community.no}">수정</a></span>
						<span class="news-body-button2" onclick="deleteCommunity()">삭제</span>
						<span class="news-body-button2"><a href="${CONTEXT }/community/">목록</a></span>
					</sec:authorize>
					<div>
						<p class="news-body-contents">
							${community.content }					
						</p>
					</div>
					<div class="sp-footer">
						<h4 class="sp-title"> 
							<span>SHARE</span></h4>
							<a class="social-icon" href="https://www.facebook.com/sharer/sharer.php?u=${FULLPATH }/community/${community.no}"><img src="${CONTEXT }/resources/img/icon/i_community_f.jpg"/></a>
							<a class="social-icon" href="https://www.twitter.com/home?status=[${community.title }] ${FULLPATH}/community/${community.no}"><img src="${CONTEXT }/resources/img/icon/i_community_t.jpg"/></a>
							<a class="social-icon" href="http://google.com/bookmarks/mark?op=edit&title=${community.title }&bkmk=${FULLPATH }/community/${community.no}"><img src="${CONTEXT }/resources/img/icon/i_community_g.jpg"/></a>
							<a class="social-icon" href="mailto:?subject=${community.title }&body=${FULLPATH }/community/${community.no}"><img src="${CONTEXT }/resources/img/icon/i_community_m.jpg"/></a>
							<ul class="bottom-set">
								<c:forEach items="${near}" var="near">
									<c:if test="${near.no < community.no}">
										<li>이전글 : <a href="${CONTEXT }/community/${near.no}">${near.title }</a>
									</c:if>
									<c:if test="${near.no > community.no}">
										<li>다음글 : <a href="${CONTEXT }/community/${near.no}">${near.title }</a>
									</c:if>
								</c:forEach>
							</ul>
						<br/>
					</div>
				</div>
				<!-- <img src="img/test_news.jpg"  style=" width: 720px; height:994px;"> -->
			</div>
			<div class="news-inform-right" >
				<div class="news-a-side">
					<div class="news-title"> 
						<img class="news-title-icon" src="${CONTEXT }/resources/img/icon/icon_face.png" />
					</div>
					<div id="fbProg"></div>
					<ul class="recentPost" id="recentFacebookPost" >
						
					</ul>
				</div>
				<div class="news-a-side">
					<div class="news-title"> 
						<img class="news-title-icon" src="${CONTEXT }/resources/img/icon/icon_ncafe.png" />
					</div>
					<div id="cafeProg"></div>
					<ul class="recentPost" id="recentNaverCafePost">
						
					</ul>
				</div>
				<div class="news-a-side">
					<div class="news-title"> 
						<img class="news-title-icon" src="${CONTEXT }/resources/img/icon/icon_nblog.png" />
					</div>
					<div id="blogProg"></div>
					<ul class="recentPost" id="recentNaverBlogPost">
						
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- END container -->
	<div class="footer"><jsp:include page="../footer.jsp" flush="false"/></div>
	
	
</body>
<script src="${CONTEXT }/resources/js/spin.js"></script>
<script src="${CONTEXT }/resources/js/FrameWork/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${CONTEXT }/resources/js/main.js"></script>
<script>
function change_img(){
	$(".detail_img").hide();
	
	
}
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
		  top: '130', // Top position relative to parent in px
		  left: '100' // Left position relative to parent in px
	};
	
	var fbTarget = document.getElementById('fbProg');
	var blogTarget = document.getElementById('blogProg');
	var cafeTarget = document.getElementById('cafeProg');
	new Spinner(opts).spin(fbTarget);
	new Spinner(opts).spin(blogTarget);
	new Spinner(opts).spin(cafeTarget);
	
	var clubId = 24372695;
	getCafePosts(clubId);
	getBlogPosts();
	getFacebookPosts();
	
	  function getCafePosts(clubId)
	  {
		$.ajax({
			type: "GET"
			,url: "${CONTEXT}/community/naver/cafe/"+clubId
		}).done(function(data)
		{
			var html="";
			if(data.error==undefined)
			{
				$.each(data,function(key,val)
				{
					html+='<li><a href="http://cafe.naver.com/ArticleRead.nhn?clubid='+clubId+'&articleid='+data[key].articleId+'" target="_blank">'
					+data[key].subject+'</a></li>';
				})
				$("#cafeProg").hide();
				$("#recentNaverCafePost").append(html);
			}
			else
			{
				if(data.error=="024")
				{
					$("#cafeProg").hide();
					$("#recentNaverCafePost").append('카페의 최신글 목록을 불러오기 위해 로그인이 필요합니다. <input type="button" value="로그인" onclick="generateNaver()"/>')
				}
			}
		});
	}
	function getBlogPosts()
	{
		$.ajax({
			type:"GET"
			,url: "${CONTEXT}/community/naver/blog/dream_effect"
			,data: {requestId: "dream_effect", requestApiPw: "57e3029120f655113189a13677784cb3", perPost: "5"} 
		}).done(function(data)
		{
			var html="";
			$.each(data,function(key,val)
			{
				html+='<li><a href="'+data[key].guid+'" target="_blank">'+data[key].title+'</a></li>';
			})
			$("#blogProg").hide();
			$("#recentNaverBlogPost").append(html);
		});
	}
	function getFacebookPosts()
	{
		$.ajax({
			type:"GET"
			,url: "${CONTEXT}/community/facebook/"
		}).done(function(data)
		{
			var html="";
			$.each(data,function(key,val)
			{
				html+='<li><a href="'+data[key].link+'" target="_blank">'+data[key].message+'</a></li>';
			})
			$("#fbProg").hide();
			$("#recentFacebookPost").append(html);
		})
	}
	
	function generateNaver()
	{
		$.ajax({
			type: "GET"
			,url: "${CONTEXT}/community/naver/cafe/generate"
		}).done(function(data)
		{
			location.href=data;
		})
	};
	
	function generateFacebook()
	{
		$.ajax({
			type: "GET"
			,url: "${CONTEXT}/community/facebook/generate"
		}).done(function(data)
		{
			location.href=data;
		})
	}
	
	function deleteCommunity()
	{
		var req = new XMLHttpRequest();
		req.open("DELETE","${CONTEXT }/community/${community.no}",true);
		req.setRequestHeader("Accept","application/json");
		req.setRequestHeader("Content-Type","application/json; charset=utf-8");
		req.onreadystatechange = function()
		{
			console.log('readyState::'+this.readyState);
			console.log('status::'+this.status);
			console.log('responseText::'+this.responseText);
			if(this.readyState == 4 && this.status==200)
			{
				if(this.responseText=="true")
				{
					location.replace("${CONTEXT}/community/");
				}
				else if(this.responseText=="false")
				{
					alert('삭제에 실패하였습니다');
				}
				else
				{
					alert('접근 권한이 없습니다');
				}
			}
		}
		req.send();
	}
	
	function communityDetail(no)
	{
		location.href="${CONTEXT}/community/"+no;
	};
	
	
	$(".admin-btn").click(function(){
		
		
	});
	
	
	
</script>
</html>
