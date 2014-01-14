<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>CINEMA M.J</title>
	<meta name="viewport" content="width=device-width initial-scale=1.0">
   	<!-- Bootstrap -->
   		<link href="${CONTEXT }/resources/css/main.css" rel="stylesheet" media="screen">
   	<link href="${CONTEXT }/resources/css/FrameWork/bootstrap.css" rel="stylesheet" media="screen">
   	<link href="${CONTEXT }/resources/css/sample.css" rel="stylesheet" media="screen">
	<script src="${CONTEXT }/resources/js/FrameWork/jquery-1.8.3.min.js"></script>
	
<!-- 	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script> -->
	<script>
	function changeDefaultImage(img)
	{
		$(img).attr("src","http://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg");
	}
	</script>
		<style>
		@import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
		body{
			margin-top: 72px;
			background-color: #F5F5F5;
		}
		h1{
			font-family: 'Nanum Gothic Coding', serif;
			height: 30px;
			line-height: 30px;
			font-size: 18px;
			font-weight: bold;
			color: #666;
			margin:0;
		}
		h2 {
			font-family: 'Nanum Gothic Coding', serif;
			height: 20px;
			line-height: 20px;
			font-size: 15px;
			font-weight: bold;
			color: #aaa;
			margin: 0;
		}
		h4{
			font-family: 'Nanum Gothic Coding', serif;
			font-size: 16px;
			font-weight: bold;
			color: #8c8c8c;
			margin-top: 5px;
		}
		a, p{
			font-family: 'Nanum Gothic Coding', serif;
		}
		.news-wrapper{
			position: relative;
			width: 1020px;
			height: 1300px;
			padding: 30px 25px 40px 25px;
			margin: 0px auto;
			background-color: #fff;
			border-bottom: 100px solid #F5F5F5;
		}
		.news-contents{
			float: left;
			position: relative;
			width: 720px;
			height: 700px;
		}
		.news-a-side{
			float: right;
			position: relative;
			width: 270px;
			height: 320px;
			margin-bottom: 30px;
		}
		.news-title{
			width: 100%;
			height: 20px;
			margin-bottom: 10px;
			background: url(${CONTEXT }/resources/img/icon/title_pattern.png) left top;
		}
		.news-title-icon{
			background-color: #fff;
			padding: 5px 5px 5px 5px;
		}
		.news-a-side > ul > li{
			font-family: 'Nanum Gothic Coding', serif;
			color: #6c6c6c;
			list-style-image: url(${CONTEXT }/resources/img/icon/icon_li.png);
			margin: 5px 5px 5px 5px;
		}
		
		.news-items{
			width: 100%;
			height: 230px;
			padding: 10px 0px 10px 0px;
			border-bottom: 1px solid #ccc;
		}
		
		.news-items > div{
			float: left;
		}
		
		.news-pic{
			width: 200px;
			height: 120px;
			overflow: hidden;
		}
		
		.news-pic-icon{
			width: 35px;
			height: 35px;
			background-color: #ccc;
			float: right;
			position: relative;
			top: -160px;
		}
		
		.news-section{
			width: 470px;
			height: 160px;
			padding: 0px 25px 0px 25px;
		}
		
		.news-section > a:nth-child(3){
			color:#68bfb6;
			font-weight: bold;
			
		}
		
		.news-bottom{
			width: 700px;
			height: 50px;
		}
		
		.news-bottom > ul{
			position: relative;
			left: 0px;
			margin: 5px 0px 0px 0px;
			width: 400px;
			height: 40px;
			list-style:  none;
		}
		
		.news-bottom > ul > li{
			float: left;
			height: 30px;
			margin: 5px 10px 5px 0px;
			background-color: #eee;
			border-radius: 3px 3px 3px 3px;
			font-family: 'Nanum Gothic Coding', serif;
			text-align: center;
			line-height: 30px;
			color: #6a6a6a;
			
		}
		
		.news-bottom > ul > li:first-child{width: 150px;}
		.news-bottom > ul > li:nth-child(2){width: 70px;}
		.news-bottom > ul > li:nth-child(3){width: 120px;}
		.news-bottom > ul > li >img{margin-right: 8px;}
		
		
		#bbslist-header-title{
			width:100%;
			height:100px;
			border-bottom: 1px solid #e4e4e4;
			border-top: 1px solid #e4e4e4;
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
		
		.community-page-wrapper{
			position: relative;
			width: 600px;
			top: 20px;
			width: auto;
			text-align: center;
			height: 30px;
		}
		
		.community-pages{
			width: auto;
			text-align: center;
			margin: 0px auto;
		}
		
		.community-pages > a,
		.community-pages > b
		{
			width: 20px;
			height: 20px;
			border: 1px solid #777;
			text-decoration: none;
			margin: 3px;
			display: block;
			float: left;
		}
		
		
		.community-pages > a:hover,
		.community-pages > b:hover{
			background-color: #777;
			color: #fff;
		}
		
		
		.community-pages > a{
		
		}
		
		.community-pages > b{
			color: #555;
		}
		
				
		.recentPost > li > a{
			font-size: 11px;
			line-height: 7px;
			color: #777;
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
		<!-- CONTENTS=======================================-->
		
		
		<div id="bbslist-header-title">
			<div>
				<h1>커뮤니티</h1>
				<h2>COMMUNITY & NEWS</h2>
			</div>
		</div>
		<div class="bbslist-header-bottom">
		</div>
		<div class="news-wrapper">
			<div class="news-contents">
				<c:forEach items="${dataList }" var="community">
					<div class="news-items" >
						<div class="news-pic" onclick="communityDetail(${community.no})">
							<img src="${CONTEXT }/resources/images/community/${community.no}/titleImageFile.jpg"
								onerror="changeDefaultImage(this)" style="width: 200px; height: 120px;"/>
							<div class="news-pic-icon">
								<img src="${CONTEXT }/resources/img/icon/icon_pic.jpg" />
							</div>
						</div>
						<div class="news-section">
							<h4>${community.title }</h4>
							<p><c:if test="${fn:length(community.content) > 30 }">
									${fn:substring(community.content,0,30) }
									<br/>
									
								</c:if>
								<c:if test="${fn:length(community.content) <= 30 }">
									${community.content }
								</c:if>
							</p>
							<a href="#" onclick="communityDetail(${community.no})">read more →</a>				
						</div>
						<div class="news-bottom">
							<ul>
								<li>
									<img src="${CONTEXT }/resources/img/icon/icon_cal.png" />${community.time }</li>
								<sec:authorize access="isAuthenticated()">
								<li>
									<img src="${CONTEXT }/resources/img/icon/icon_admin.png" />admin</li>
								</sec:authorize>
								<li>
									<img src="${CONTEXT }/resources/img/icon/icon_news.png" />${community.no}</li>
							</ul>
						</div>
					</div>
				</c:forEach>
				
				<div class="community-page-wrapper">
					<center>
					<div class="community-pages">
						<c:if test="${pageCount>1 }">
							<a href="${CONTEXT }/community/?page=${firstPage-1 }">&#60;</a>
						</c:if>
						<c:forEach begin="${firstPage }" end="${firstPage+pageListSize-1 }" var="cnt">
							<c:if test="${cnt<=pageSize }">
								<c:if test="${currentPage != cnt}">
									<a href="${CONTEXT }/community/?page=${cnt}"> ${cnt} </a>
								</c:if>
								<c:if test="${currentPage == cnt}">
									<b> ${cnt } </b>
								</c:if>
							</c:if>
						</c:forEach>
						<c:if test="${firstPage+pageListSize-1 < pageSize}">
							<a href="${CONTEXT }/community/?page=${firstPage+pageListSize}">&#62;</a>
						</c:if>
					</div>
					</center>
					<sec:authorize access="hasRole('ROLE_ADMIN')"> 
					<div class="admin-btn-area">
						<span><a class="adm-button" href="${CONTEXT }/community/write">글쓰기</a></span>
						<span><a class="adm-button" href="${CONTEXT }/main">메인으로</a></span>
					</div>
				</sec:authorize>
					
				</div>
			</div>
			<div class="news-a-side-wrapper">	
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
		<!-- END container -->
		<div class="footer"><jsp:include page="../footer.jsp" flush="false"/></div>
	
</body>
<script src="${CONTEXT }/resources/js/spin.js"></script>
<script src="${CONTEXT }/resources/js/FrameWork/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${CONTEXT }/resources/js/main.js"></script>
<script src="${CONTEXT }/resources/js/news.js"></script>
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
		  top: '140', // Top position relative to parent in px
		  left: '90' // Left position relative to parent in px
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
	
	function communityDetail(no)
	{
		location.href="${CONTEXT}/community/"+no;
	};
</script>
</html>
