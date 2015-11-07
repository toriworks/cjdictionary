/* ------------------------------------------------------------
 * Name      : common.js
 * Desc      : Moblie 스크립트
 * Created   : 2015-10-20 by tttboram
 ------------------------------------------------------------ */

/* 이미지 on, off */
function on(){this.src = this.src.replace("_off","_on");}
function off(){this.src = this.src.replace("_on","_off");}

/* 주소창가리기 */
window.addEventListener('load', function() {
	setTimeout(scrollTo, 0, 0, 1);
}, false);



//go Top
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
		return false;
	});
});