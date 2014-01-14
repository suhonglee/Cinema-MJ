<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>CINEMA M.J</title>
		<meta name="viewport" content="width=device-width initial-scale=1.0">
    	<link href="${CONTEXT}/resources/css/FrameWork/bootstrap.css" rel="stylesheet" media="screen">
    	<link href="${CONTEXT}/resources/css/FrameWork/bootstrap-responsive.css" rel="stylesheet" media="screen">
    	<link href="${CONTEXT}/resources/css/partner.css" rel="stylesheet" media="screen">
    	<link href="${CONTEXT}/resources/css/item.css" rel="stylesheet" media="screen">
    	<link href="${CONTEXT}/resources/css/gallery.css" rel="stylesheet" media="screen">
	</head>
	<style>
		
	@CHARSET "UTF-8";
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
	
	body{
		margin-top: 70px;
		background-color: #f5f5f5;
	}
	h3{
		font-family: 'dotum';
		font-size: 55px;
		font-weight: 100;
		color: #777;
	}
	.social{
		position: fixed;
		top: 71px;
		left: -30px;
		z-index: 9999;
		height: 145px;
	}
	.icon{
		position: relative;
		width: 30px;
		height: 35px;
		margin-top: 2px;
	}
	.icon:first-child{
		background: url(${CONTEXT}/resources/img/icon/icon_blog.png)
	}
	.icon:nth-child(2){
		background: url(${CONTEXT}/resources/img/icon/icon_cafe.png)
	}
	.icon:nth-child(3){
		background: url(${CONTEXT}/resources/img/icon/icon_facebook.png)
	}
	.icon:nth-child(4){
	}
	#myCarousel{
		display: none;
	}
	.movie-area{
		display: none;
	}
	.top-menu{
		height: 70px;
	}
	.contents-area{
		max-width: 1020px;
		padding: 70px 25px 50px 25px;
		margin: 0px auto;
		border-top: 70px solid #f5f5f5;
		background-color: #ffffff;
	}
	.footer{
		position: relative;
		top: 50px;
		margin-top: 100px;
	}
	.gallery-area{
		width: 100%;
		
	}
	
	.gallery-pointer{
		
		position: relative;
		width: 200px;
		height: 50px;
		border: 5px solid;
		top: 600px;
		margin: 0px auto;
		
	}
	
	.gallery-pointer > li{
		position: relative;
		top: 0px;
		float: left;
		width: 40px;
		height: 40px;
		background-color: #fff;
		border-radius: 10px 10px 10px 10px;
		
	}
	
	#body-mask{
		z-index: 5000;
		position: fixed;
		top: 0px;
		width: 100%;
		height: 100%;
		background-color: #000;
		filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#80000000', endColorstr='#80000000');
		opacity: 0.7;
		display: none;
	}
	
	.popup-area{
		position: fixed;
		z-index: 9999;
		background-color: #fff;
		display: none;
		border: 2px solid #555;
		padding: 20px 20px 20px 20px;
		-moz-box-shadow: 4px 5px 5px #1f1f1f;
		-webkit-box-shadow: 4px 5px 5px #1f1f1f;
		box-shadow: 4px 5px 5px #1f1f1f;
		overflow-x: hidden;
	}
	
	.popup-content{
		position: absolute;
		float: left;
		bottom: -0px;
		width: 100%;
		left: -0px;
		height: 150px;
		margin: 0px auto;
		background-color: #ccc;
		display: none;
		opacity: 0.7;
	}
	.popup-content > div:first-child{
		position: relative;
		top: 10%;
		width: 90%;
		height: 80%;
		margin: 0px auto;
		
	}
	
	.popup_img{
		text-align: center;
		margin: 0px auto;
	}
	
	.popup-close-btn{
		position: relative;
		float: right;
		top: -15px;
		right: -15px;
		float: right;
		width: 30px;
		height: 30px;
		background-color: #f5f5f5;
		cursor:pointer;
	}
	
	.popup-close-btn > p{
		text-align: center;
		line-height: 30px;
		font-size: 20px;
		color: #777;
	}
	
	.popup-controll{
		position: absolute;
		top: 10px;
		/*
		bottom: 150px;
				*/
		right: 10px;
		float: right;
		width: 125px;
		height: 60px;
	}
	
	.popup-controll > div{
		float: left;
		width: 60px; 
		height: 60px;
		background-color: #fff;
		font-size: 60px;
		line-height: 60px;
		text-align: center;
		color: #aaa;
		cursor:pointer;
	}
	
	.popup-controll > div:hover{
		background-color: #efefef;
	}
	
	
	.popup-controll > div:last-child{
		margin-left: 5px;
	}
	
		.adm-button{
			position: relative;
			width: 70px;
			height: 30px;
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
			margin-left: 5px;
		}
		.adm-button:hover{
			top: 1px;
			color: #fff;
		}
		.adm-button:after{	
		}
		
		.admin-btn-area{
			width: 200px;
			height: 50px;
			position: relative;
			float: right;
			right: 0px;
		}
		.admin-btn-area > span{
			float: left;
			position: relative;
			display: block;
		}
		
		.admin-btn-area > span > a{
			line-height: 30px;
			font-family: 'Nanum Gothic Coding', serif;
			font-size: 15px;
			text-decoration: none;
		}
	
	
	

	</style>
	<body>
		<!-- MENU=======================================-->
		<div class="top-menu"><jsp:include page="../topmenu.jsp" flush="false"/></div>
		
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
		<!-- GALLERY=======================================-->
		<div class="gallery-area">
			<div class="gallery-box">
				<div class="right-gallery"><img src="${CONTEXT}/resources/img/gallery/icon_left.png"/></div>
				<div class="gallery-wrapper">
					<div class="move-gallery">
						<div class="m1 m-gallery">
							<img src="${CONTEXT}/resources/img/gallery/01.jpg"/>
						</div>
						<div class="m2 m-gallery">
							<img src="${CONTEXT}/resources/img/gallery/02.jpg"/>
						</div>
						<div class="m3 m-gallery">
							<img src="${CONTEXT}/resources/img/gallery/03.jpg"/>
						</div>
						<div class="m4 m-gallery">
							<img src="${CONTEXT}/resources/img/gallery/04.jpg"/>
						</div>
						<div class="m5 m-gallery">
							<img src="${CONTEXT}/resources/img/gallery/05.jpg"/>
						</div>
						<div class="m6 m-gallery">
							<img src="${CONTEXT}/resources/img/gallery/06.jpg"/>
						</div>
						<div class="m7 m-gallery">
							<img src="${CONTEXT}/resources/img/gallery/07.jpg"/>
						</div>
					</div>
				</div>
				<div class="left-gallery"><img src="${CONTEXT}/resources/img/gallery/icon_right.png"/></div>
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
					<c:forEach items="${dataList }"  var="partner">
						<div class="text-box ${partner.category }">
							<div class="items-top">
								<img src="${CONTEXT}/resources/images/partner/${partner.no }/thumb_imageFile.jpg" style="width: 220px; height: 165px;"/>
							</div>
							<div class="items-bottom"><h5>${partner.title }</h5></div>
							<div class="items-pointer"> </div>
							
							<input class="pop-img-val" type="hidden" 
							  	value="${CONTEXT}/resources/images/partner/${partner.no }/imageFile.jpg" />
					    	<input class="pop-content-val" type="hidden" 
					    		value="${partner.title }"
							  	data-content="${partner.content }"
							  	data-no="${partner.no }"/>
						</div>
					</c:forEach>

				</div>
			</div>
			<sec:authorize access="hasRole('ROLE_ADMIN')"> 
				<div class="admin-btn-area">
					<span><a class="adm-button"  href="${CONTEXT }/partner/write">글쓰기</a></span>
					<span><a class="adm-button" href="${CONTEXT }/main">메인으로</a></span>
				</div>
			</sec:authorize>
		</div>
		
		<!-- FOOTER=======================================-->
		<div class="footer"><jsp:include page="../footer.jsp" flush="false"/></div>
		
		
		<div id="body-mask"> </div>
		<div class="popup-area">
			<div class="popup-close-btn"><p>X</p></div>
			<center>
				<img class="popup_img" src=""/>
			</center>
			<div class="popup-content">
				<div>
					<h4 class="popup-title-tag"> </h4>
					<h5 class="popup-content-tag"> </h5>
				</div>
				<div class="popup-controll">
					<div class="popup-img-left">&#60;</div>
					<div class="popup-img-right">&#62;</div>
					<sec:authorize access="hasRole('ROLE_ADMIN')"> 
						<h5 class="popup-delete">DELETE</h5>
					</sec:authorize>
				</div>
			</div>
		</div>
	</body>
	<!-- jQuery , bootstrap -->
	<script src="${CONTEXT}/resources/js/FrameWork/jquery-1.8.3.min.js"></script>
	<script src="${CONTEXT}/resources/js/FrameWork/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="${CONTEXT}/resources/js/FrameWork/bootstrap.min.js"></script>
	<script src="${CONTEXT}/resources/js/main.js"></script>
	<script src="${CONTEXT}/resources/js/gallery.js"></script>
	<script src="${CONTEXT}/resources/js/popup.js"></script>
	<script src="${CONTEXT}/resources/js/partner.js"></script>
	<script src="${CONTEXT}/resources/js/jquery.isotope.min.js"></script>
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
		
	</script>
</html>
