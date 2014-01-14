
var contents_animate_val = false;
var contents_selected_menu = 0;

$(".text-box").hover(function()
{	
	var element = $(this).find(".items-top");
	var element02 = $(this).find(".items-bottom");
	var element03= $(this).find(".items-pointer");
	var element04= $(this).find(".items-bottom").children();
	
	if(contents_animate_val == false)
	{
		contents_animate_val = true;
		
		$(element).animate({
			"opacity":0.7,
			"background-color": "#000"
		} , 150);
		
		$(element02).animate({
			"opacity":1,
			"background-color": "#ffd7b0" ,
			"border": "1px solid #ffd7b0"
		} , 150);
		
		$(element03).animate({
			"top":  "-200px"
		} , 150);
		
		$(element04).animate({
			"color":  "#fff"
		} , 150);
		
		setTimeout(function(){contents_animate_val = false;},0);
	}
},
function()
{
	var element = $(this).find(".items-top");
	var element02 = $(this).find(".items-bottom");
	var element03= $(this).find(".items-pointer");
	var element04= $(this).find(".items-bottom").children();
	
	$(element).animate({
		"opacity":1,
		"background-color": "#ccc"
	} , 150);
	$(element02).animate({
		"opacity":1,
		"background-color": "#fff"
	} , 150);
	$(element03).animate({
			"top":  "-350px"
		} , 150);
	$(element04).animate({
			"color":  "#777"
		} , 150);	
		
});

/*	샘플 메뉴   */

var animate_val = false;
var selected_menu = 0;

$(".pf-menu-li").hover(function()
{	
	var aim = $(this).index();
	
	if(animate_val == false && aim != selected_menu){
		
		animate_val = true;
		$(this).animate({
			"background-color" : "#ffd7b0"
		} , 400);
		
		setTimeout(function()
		{
			animate_val = false;
		},50);
		
	}
},
function()
{
	var aim2 = $(this).index();
	
	if(aim2 != selected_menu)
	{
		$(this).animate({
			"background-color" : "#222",
			opacity: 1
		} , 400);
	}
	
});



$(".pf-menu-a").click( function()
{
	
	var aim = $(this).index();
	var before_num = $(".before-menu").index();
	selected_menu = aim;
	
	$(".pf-menu-a").css({"background-color" : "#222" });
	$(".pf-menu-a").find("p").css({ "color" : "#ffd7b0"});
	
	$(".before-menu").removeClass("before-menu");
	
	$(this).css({"background-color" : "#ffd7b0"	});
	
	$(this).addClass("before-menu");
	
});

function Init_menu()
{
	$(".before-menu").css({"background-color" : "#ffd7b0" });
	
}
Init_menu();