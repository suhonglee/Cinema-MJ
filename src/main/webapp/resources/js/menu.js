$(".top-menu > ul > li").hover(function()
{	
	var val = $(this).find(".pointer");
	$(this).children(".pointer").fadeIn(300);
},
function()
{
	$(this).children(".pointer").fadeOut(300);
});

$(".change-menu").hover(function()
{
	
},
function()
{
	$(this).children().find(".pointer").hide(200);
});

/*메뉴 호버 효과*/
$(".change-menu01").hover(function()
{	
	$(".change-menu01").text("회   사");
},
function()
{
	$(".change-menu01").text("COMPANY");
});

$(".change-menu02").hover(function()
{	
	$(".change-menu02").text("샘     플");
},
function()
{
	$(".change-menu02").text("SAMPLE");
});

$(".change-menu03").hover(function()
{	
	$(".change-menu03").text("상품소개");
},
function()
{
	$(".change-menu03").text("PRODUCT");
});

$(".change-menu04").hover(function()
{	
	$(".change-menu04").text("파트너");
},
function()
{
	$(".change-menu04").text("PARTNER");
});

$(".change-menu05").hover(function()
{	
	$(".change-menu05").text("견적의뢰.문의");
},
function()
{
	$(".change-menu05").text("RESERVATION");
});

$(".change-menu06").hover(function()
{	
	$(".change-menu06").text("예약.입금확인");
},
function()
{
	$(".change-menu06").text("CONFIRMATION");
});

$(".change-menu07").hover(function()
{	
	$(".change-menu07").text("커뮤니티");
},
function()
{
	$(".change-menu07").text("COMMUNITY");
});



