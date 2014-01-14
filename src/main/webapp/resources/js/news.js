
var contents_animate_val = false;

$(".news-pic").hover(function()
{	
	var element = $(this);
	var element02 = $(this).find(".news-pic-icon");
	
	if(contents_animate_val == false)
	{
		contents_animate_val = true;
		
		$(element).animate({
			"opacity":0.7,
			"background-color": "#000"
		} , 150);
		
		
		$(element02).animate({
			top: "-120px"
		} , 150);
		
		
		
		setTimeout(function(){contents_animate_val = false;},0);
	}
},
function()
{
	var element = $(".news-pic");
	var element02 = $(this).find(".news-pic-icon");

	
	$(element).animate({
		"opacity":1,
		"background-color": "#fff"
	} , 150);
	$(element02).animate({
		top: "-160px"
	} , 150);
		
});
