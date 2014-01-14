/**
 * @author a
 */
/* title - slide */
var gallery_cnt = 1;
var g_move_flag = false;
var g_move_time = 700;
var gallery_struct = $(".move-gallery");
var gallery_move = $(".m-gallery");
var gallery_length = $(gallery_struct).find(".m-gallery").length;

function INIT_gallery(){
	
	var windows_width = $(document).width();
	$(gallery_move).css({
		"width": ""+windows_width+"px"
	});
	$(".gallery-box").css({
		"width": ""+windows_width+"px"
	});
};

INIT_gallery();	

$(window).resize(function() 
{
	INIT_gallery();
	
});

function slide_gallery(slide_type , move_speed)
{
	
	if( g_move_flag == false )
	{
		g_move_flag = true;
		
		if( slide_type == "left" )
		{
			if ( gallery_cnt < gallery_length ) 
			{
				
				$(gallery_struct).animate({
					 left: "-="+move_speed+"", opacity: 0.2	}, g_move_time);
				$(gallery_struct).animate({	opacity: 1 }, g_move_time);
				
				gallery_cnt++;
				
				setTimeout(function(){g_move_flag = false;} , g_move_time * 2);
				
				return false;
					
			}
			else if( gallery_cnt == gallery_length )
			{
				
				$(gallery_struct).animate({
					left: "+="+ move_speed * (gallery_length - 1) +"", opacity: 0 }, g_move_time);
				$(gallery_struct).animate({	opacity: 1 }, g_move_time);
				
				gallery_cnt = 1;
				
				setTimeout(function(){ g_move_flag = false; } , g_move_time * 2);
				
				return false;
				
			}
			
		}
		else if( slide_type == "right" )
		{
			
			if ( gallery_cnt > 1 ) 
			{
				
				$(gallery_struct).animate({ 
					left: "+="+move_speed+"", opacity: 0.2	}, g_move_time);
				$(gallery_struct).animate({	opacity: 1 }, g_move_time);
				
				gallery_cnt--;
				
				setTimeout(function(){	g_move_flag = false;} , g_move_time * 2);
				
				return false;
					
			}
			else if( gallery_cnt == 1 )
			{
				
				$(gallery_struct).animate({	
					left: "-="+ move_speed * (gallery_length - 1) +"", opacity: 0 }, g_move_time);
				$(gallery_struct).animate({	opacity: 1 }, g_move_time);
				
				gallery_cnt = gallery_length;
				
				setTimeout(function(){ g_move_flag = false; } , g_move_time * 2);
				
				return false;
				
			}
		}
	}	
};

// LISTENER
$(document).ready(function()
{

	var g_move_speed = $(".m-gallery").width();
	
	$(".right-gallery").click(function()
	{
		slide_gallery(slide_type = "right" , move_speed = g_move_speed);
	});
	$(".left-gallery").click(function()
	{
		slide_gallery(slide_type = "left" , move_speed = g_move_speed);
	});
	$(".right-gallery").hover(function()
	{
		slide_gallery(slide_type = "right" , move_speed = g_move_speed);
	} , function(){} );
	$(".left-gallery").hover(function()
	{
		slide_gallery(slide_type = "left" , move_speed = g_move_speed);
	} , function(){} );
	setInterval(function()
	{
		slide_gallery(slide_type = "left" , move_speed = g_move_speed);
	} , 10000);
	
});
