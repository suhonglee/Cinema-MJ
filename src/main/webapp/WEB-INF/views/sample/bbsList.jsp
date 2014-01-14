<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   	<link href="${CONTEXT }/resources/css/sample.css" rel="stylesheet" media="screen">
   	<link href="${CONTEXT }/resources/css/item.css" rel="stylesheet" media="screen">
   	<link href="${CONTEXT }/resources/css/main.css" rel="stylesheet" media="screen">
</head>
<style>
	.contents-area{
		max-width: 1020px;
		padding: 70px 25px 50px 25px;
		margin: 0px auto;
		border-top: 100px solid #f5f5f5;
		background-color: #ffffff;
	}
	
	.footer{
		position: relative;
		top: 50px;
		margin-top: 100px;
	}
	
</style>
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
	<!-- MOVIE=======================================-->
		<div class="movie-area">
			<div>
				<video id="video_background" class="scroll-img" src="${CONTEXT }/resources/movie/sub.mp4" autoplay> </video>
			</div>
		</div>
	<!-- CONTENTS=======================================-->
	<div class="contents-area">
		<div class="item-list-wrapper">
		    <section id="options" class="clearfix">
			  <ul id="filters" class="option-set clearfix  pf-menu" data-option-key="filter">
			    <li class="pf-menu-li "><a href="#show-all" data-option-value="*" class="selected pf-menu-a before-menu">Show All</a></li>
			    <li class="pf-menu-li"><a href="#red" data-option-value=".1 " class="pf-menu-a">Wedding</a></li>
			    <li class="pf-menu-li"><a href="#blue" data-option-value=".2" class="pf-menu-a">Baby</a></li>
			    <li class="pf-menu-li"><a href="#green" data-option-value=".3" class="pf-menu-a">Production</a></li>
			  </ul>
			</section> <!-- #options -->
			<div id="items" class="clearfix items-container">
				<c:forEach items="${dataList }" var="sample">
			    <div class="${sample.category } text-box" onclick="sampleDetail(${sample.no})">
				  	<div class="items-top"><img src="${sample.thumbnailUrl}" style="width: 220px; height: 165px"/></div>
				  	<div class="items-bottom"><h5>${sample.title }</h5></div>
				  	<div class="items-pointer"> </div>
			    </div>
			    </c:forEach>
			</div>
			<sec:authorize access="hasRole('ROLE_ADMIN')"> 
				<div class="admin-btn-area">
					<span><a class="adm-button" href="${CONTEXT }/sample/write">글쓰기</a></span>
					<span><a class="adm-button" href="${CONTEXT }/main">메인으로</a></span>
				</div>
			</sec:authorize>
		</div>
	</div>
	<!-- FOOTER=======================================-->
	<div class="footer"><jsp:include page="../footer.jsp" flush="false"/> </div>
</body>
<!-- jQuery , bootstrap -->
<script src="${CONTEXT }/resources/js/FrameWork/jquery-1.8.3.min.js"></script>
<script src="${CONTEXT }/resources/js/FrameWork/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${CONTEXT }/resources/js/main.js"></script>
<script src="${CONTEXT }/resources/js/jquery.isotope.min.js"></script>
<script src="${CONTEXT }/resources/js/sample.js"></script>
<script>
  $(function()
  {
	  var $container = $('#items');
	  $container.isotope({ });
	  
	  var $optionSets = $('#options .option-set'),
	      $optionLinks = $optionSets.find('a');
	
      $optionLinks.click(function()
      {
		  	var $this = $(this);
		    
		    if ( $this.hasClass('selected') )
		    {
		    	return false;
	      	}
	      	
	        var $optionSet = $this.parents('.option-set');
	       	$optionSet.find('.selected').removeClass('selected');
	        $this.addClass('selected');
	  
	        var options = {},
	            key = $optionSet.attr('data-option-key'),
	            value = $this.attr('data-option-value');
	            
	        value = value === 'false' ? false : value;
	        options[ key ] = value;
	        
	        if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' )
	        {
	          changeLayoutMode( $this, options );
	        }
	        else
	        {
	          $container.isotope( options );
	        }
	        
	        return false;
	        
      });
      
  });
	
	function sampleDetail(no)
	{
		location.href="${CONTEXT}/sample/"+no;
	}

		
		
	</script>
</html>
