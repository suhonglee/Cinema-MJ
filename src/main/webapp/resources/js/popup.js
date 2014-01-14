
//value array
var popup_img = $.makeArray($(".pop-img-val").map(function(){
	return $(this).val();
}));

var popup_contents_val = $.makeArray($(".pop-content-val").map(function(){
	return $(this).attr("data-content");
}));

var popup_no_val = $.makeArray($(".pop-content-val").map(function(){
	return $(this).attr("data-no");
}));

var popup_title_val = $.makeArray($(".pop-content-val").map(function(){
	return $(this).val();
}));

function PopUp_INIT(img_val)
{
	
	var mask = '<div id="body-mask"></div>';
	
	$("body").append(mask);
	
	var popup_width       = document.body.clientWidth * 0.65;
	var popup_height      = screen.availHeight * 0.75;
	var center_val_top    = (screen.availHeight - popup_height) / 2 - 70;
	var center_val_left   = (document.body.clientWidth - popup_width) / 2; 
	
	$(".popup-area").css({
		  width  : ""+ popup_width +"px" 
		, height : ""+ popup_height +"px"
		, top    : ""+ -popup_width +"px"
		, left   : ""+ center_val_left +"px"
	});
	
	PopUp_write(img_val);
	PopUp_delete(img_val);
	
	$(".popup_img").css({ width  : ""+ popup_width * 0.8 +"px" });
	
	$("#body-mask").fadeIn(500);
	$(".popup-area").show();
	$(".popup-area").animate({ "top" : ""+ center_val_top +"px"  , opacity : 1 },500);
	
	return false;
	
};

function PopUp_Destory()
{
	var popup_width = document.body.clientWidth * 0.8;
	
	$(".popup-area").animate({ "top" : ""+ -popup_width +"px"  , opacity : 0 },500);
	$("#body-mask").fadeOut(700);
	
	setTimeout(function()
	{
		$("#body-mask").remove();
	} , 700);
	
};

function PopUp_write(img_val)
{
	$(".popup_img").attr("src" , popup_img[img_val]);
	$(".popup-title-tag").text(popup_title_val[img_val]);
	$(".popup-content-tag").text(popup_contents_val[img_val]);
}

function PopUp_delete(img_val)
{
	$(".popup-delete").attr('onclick','').unbind('click');
	$(".popup-delete").click(function(){
		if(confirm('정말 삭제하시겠습니까?'))
		{
			$.ajax({
				type:"POST"
				,url:popup_no_val[img_val]
				,data: {"_method":"DELETE"}
			}).done(function(data){
				if(data==true)
				{
					PopUp_Destory();
					event.stopPropagation();
					location.reload();
				}
				else
				{
					alert('삭제에 실패하였습니다');
				}
			})
		}
	})
}
var img_val = 0;

$(document).on("click" , ".text-box" , function()
{
	img_val = $(this).index();
	PopUp_INIT(img_val);
	event.stopPropagation();
	
});

$(document).on("click" , "#body-mask , .popup-close-btn" , function()
{
	PopUp_Destory();
	event.stopPropagation();
	
});

$(document).on("click" , ".popup-img-left" , function()
{
	img_val -= 1;
	if(img_val == -1){
		img_val = popup_img.length;
	}
	PopUp_delete(img_val);
	PopUp_write(img_val);
});

$(document).on("click" , ".popup-img-right" , function()
{
	img_val += 1;
	if(img_val == popup_img.length){
		img_val = 0;
	}
	PopUp_delete(img_val);
	PopUp_write(img_val);
	
});

$(".popup-close-btn").hover(
	
	function()
	{
		$(this).animate({"background-color" : "#77c4bc"} , 300);
		$(this).children().animate({"color" : "#fff"} , 300);
		event.stopPropagation();
		
	}
	,function()
	{
		$(this).animate({"background-color" : "#f5f5f5"} , 300);
		$(this).children().animate({"color" : "#777"} , 300);
		
	}
);

$(".popup-area").scroll(function(){
	
	$(".popup-content").hide();
	
	setTimeout(function(){
		
		$(".popup-content").show();
		
	}, 500);
	
});

$(".popup-area").hover(
	function()
	{
		$(".popup-content").fadeIn(500);
		event.stopPropagation();
	}
	,function()
	{
		$(".popup-content").fadeOut(500);
	}
);

$(".popup-content").hover(
	
	function()
	{
		$(this).animate({"background-color" : "#77c4bc" , opacity : 1} , 0);
		$(this).children().animate({"color" : "#fff"} , 0);
		event.stopPropagation();
		
	}
	,function()
	{
		$(this).animate({"background-color" : "#ccc" , opacity : 0.7} , 0);
		$(this).children().animate({"color" : "#777"} , 0);
		
	}
);
