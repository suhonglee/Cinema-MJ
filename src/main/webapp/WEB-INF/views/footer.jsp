<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html lang="en">
	<head>
		<meta charset="utf-8">
    	<link href="${CONTEXT}/resources/css/footer.css" rel="stylesheet" media="screen">
	</head>
	<body>
		<div class="footer-wrapper">
			<div class="footer-items">
				<div class="footer-items-contents" id="community_contents">
					<h5>NEWS</h5>
					<div class="bt-hover-img bt-hover01">
						<div class="inner-logo logos01"> </div>
					</div>
				</div>
				<div class="footer-items-bottom">
					<a href="${CONTEXT}/community/" class="ft-dashed">
						<span>NEWS</span>
					</a>
				</div>	
			</div>
			<div class="footer-items">
				<div class="footer-items-contents">
					<h5>COMPANY</h5>
					<div class="bt-hover-img bt-hover02">
						<div class="inner-logo logos02"> </div>
					</div>
					<h6>
						§ &nbsp; We want the best.
					</h6>
					<h6>
						§ &nbsp; Passion is our philosophy. 
					</h6>
					<h6>
						§ &nbsp; We will do the business for the people. 
					</h6>
					<h6>
						§ &nbsp; We are Cinema M J. 
					</h6>
				</div>
				<div class="footer-items-bottom">
					<a href="${CONTEXT}/company/" class="ft-dashed">
						<span>COMPANY</span>
					</a>
				</div>	
			</div>
			<div class="footer-items">
				<div class="footer-items-contents">
					<h5>CONTACT US</h5>
					<div class="bt-hover-img bt-hover03">
						<div class="inner-logo logos03"> </div>
					</div>
					<h6>
						＊  대표: 김양령<br/>
						＊ 사업자: 402 - 22 - 29807
					</h6>
					<h6>
						＊ TEL: 063-236-0815 , 010-8981-0805<br/>
						＊ 카카오톡 ID: cinemamj
					</h6>
					<h6>
						＊ 주소: 전라북도 전주시 완산구 효자동 2가 1249 - 14 <br/>
						＊ 계좌번호: 402008 - 02 - 299374 (우체국) 김 양 령
					</h6>
				</div>
				<div class="footer-items-bottom">
					<a href="${CONTEXT}/company_contactus/" class="ft-dashed">
						<span>CONTACT US</span>
					</a>
				</div>	
			</div>
			<h5>Copyright(c)2013 by CinemaMJ. All Page content is property of CinemaMJ</h5>
		</div>
	</body>
	<script>
		$.ajax({
			type:"GET"
			,url:"${CONTEXT}/community/recent?perCount=4"
		}).done(function(data){
			var html="";
			$.each(data,function(key,val){
				html+='<h6><a href="${CONTEXT}/community/'+data[key].no+'">[NEWS]&nbsp;'
				+data[key].title
				+'</a></h6>'
			})
			$("#community_contents").append(html);
		})
	</script>
</html>
