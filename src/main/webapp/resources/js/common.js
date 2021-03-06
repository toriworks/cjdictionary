/* ------------------------------------------------------------
 * Name      : common.js
 * Desc      : 스크립트
 * Created   : 2015-09-09 by tttboram
 ------------------------------------------------------------ */
function winopen(url) {
	window.open(url, "_blank", "", "");
}
function fileUpload() {
	var wrapper = $('<div/>').css({height:0,width:0,'overflow':'hidden'});
	var fileInput = $(this).children('input:file').wrap(wrapper);
	fileInput.change(function(){
		$this = $(this);
		$('.upload .fileName .file').text($this.val());
	})
	$(this).children('.fileInfo').click(function(){
		fileInput.click();
	}).show();
}
function toggleClass() {
	var target= $(this).hasClass("selected");
	if(target) {
		$(this).removeClass("selected");
	} else {
		$(this).siblings("div").removeClass("selected");
		$(this).addClass("selected");
	}
}
function setupLabel() {
	if ($('.checkbox input').length) {
		$('.checkbox').each(function(){
			$(this).removeClass('active');
		});
		$('.checkbox input:checked').each(function(){
			$(this).parent('.checkbox').addClass('active');
		});
	};
	if ($('.radiobox input').length) {
		$('.radiobox').each(function(){
			$(this).removeClass('active');
		});
		$('.radiobox input:checked').each(function(){
			$(this).parent('.radiobox').addClass('active');
		});
	};
};
$(document).ready(function(){
	//main 문화유산, 생물정보 tab
	$(".mainBox").hide();
	$(".mainBox").first().show();
	$("#mainContent .section ul li a").click(function(e){
		e.preventDefault();
		$("#mainContent .section ul li").removeClass("active");
		$(this).parent().addClass("active");
		$(".mainBox").hide();
		$($(this).attr("href")).show();
		return false;
	});

	//상세 예문 레이어 tip //추가개발필요함
	$(".termWord").click(function(e){
		e.preventDefault();

		//x,y 값 
		cli_Top=$(this).prop("offsetTop");
		cli_Left=$(this).prop("offsetLeft");
		

		
		if($(this).children().css({'display':'none'})){
			
			$("#minipop_template").remove();
						
			$(".miniPop").css({'display':'block'});
			$(".pointDot").css({'display':'block'});
			var _word = $(this).attr("href");
			$(_word).show();

			var _thisHtml = "<span id='minipop_template' style='display:none'>" + $(_word).html()+"</span>";			
			$(this).append(_thisHtml);
			
			$(".miniPop_title").html( $(this).attr("title") );
			
			$(".miniPop_image").attr("src",$(this).attr("value"));
			
			$("#minipop_template").show();
			
		}else{
			$(this).empty();
			$(".pointDot").remove();
		}
	});
	
	$(".btnX").live("click", function(e){

		e.preventDefault();		
		$(".miniPop").hide();
		$(".pointDot").hide();

		return false;
	});

});