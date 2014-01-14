$(document).ready(function()
{
	setTimeout(function()
	{
		$(".social").animate({left: "+=30px"} , 1200);
	} , 100);
	
});

var t_preventDefault = function(evt) { evt.preventDefault(); };
$('div').bind('dragstart', t_preventDefault).bind('selectstart', t_preventDefault);
$(document).ready(function(){
	$('body').bind('contextmenu' , function(e){
		//return false;
	});
});

$(".movie-area").fadeIn(4000);

var movie_area;

function get_movie_area()
{
	movie_area = $(".movie-area" ).height();
	return movie_area;
}

setTimeout(function()
{
	get_movie_area();
	
},200);

var xWidth = screen.availWidth;  
var xHeight = screen.availHeight;

$('.scroll-img').css('width' ,  $(window).width());

$(window).resize(function() 
{
	$('.scroll-img').css('width' ,  $(window).width());
});

/* title - slide */

var title_cnt = 1;
var title_length = $(".move-title").find(".title").length;
var move_speed = 600;
var move_flag = false;

function move_title(type)
{	
	/*var type = "left";*/
	/*alert(title_length);*/
	if (move_flag == false) 
	{
		move_flag = true;
		if(type == "left")
		{
			if (title_cnt < title_length) 
			{
				$(".move-title").animate({
					left: "-="+move_speed+"",
					opacity: 0.2
				}, 300);
				$(".move-title").animate({
					opacity: 1
				}, 300);
				
				title_cnt++;
				setTimeout(function()
				{
					move_flag = false;
				} , 500);
					
			}
			else if(title_cnt == title_length  )
			{
				$(".move-title").animate({
					left: "+="+ move_speed * (title_length - 1) +"",
					opacity: 0
				}, 300);
				$(".move-title").animate({
					opacity: 1
				}, 300);
				
				title_cnt = 1;
				setTimeout(function()
				{
					move_flag = false;
				} , 500);
			}
		}
		else if(type == "right")
		{
			if (title_cnt > 1) 
			{
				$(".move-title").animate({
					left: "+="+move_speed+"",
					opacity: 0.2
				}, 300);
				
				$(".move-title").animate({
					opacity: 1
				}, 300);
				
				title_cnt--;
				setTimeout(function()
				{
					move_flag = false;
				} , 500);
					
			}
			else if(title_cnt == 1  )
			{
				$(".move-title").animate({
					left: "-="+ move_speed * (title_length - 1) +"",
					opacity: 0
				}, 300);
				$(".move-title").animate({
					opacity: 1
				}, 300);
				
				title_cnt = title_length;
				setTimeout(function()
				{
					move_flag = false;
				} , 500);
			}
		}
	}
}


$(document).ready(function()
{

	$(".right-title").click(function()
	{
		move_title(type = "right");
	});
	
	$(".left-title").click(function()
	{
		move_title(type = "left");
	});
	
	var move_title_setTime =  setInterval(function()
	{
		move_title(type = "left");
	},5000);
	
	
	
	$(".icon").on("click"  , function()
	{
		var idx = $(this).index();
	
		if (idx == 0)
			window.open("http://blog.naver.com/dream_effect/");
		else if(idx == 1)
			window.open("http://cafe.naver.com/dreameffect.cafe");
		else if(idx == 2)
			window.open("https://www.facebook.com/CinemaDream2012");
	});
	
	
});





		
		
