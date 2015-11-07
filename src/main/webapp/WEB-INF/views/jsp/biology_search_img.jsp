<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/" var="croot" />
<jsp:useBean id="utility" class="com.hyonga.dictionary.common.Utility" />
<!DOCTYPE html>
<html lang="ko">
<head>
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /><![endif]-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1" />
<meta name="viewport" content="width=device-width, target-densitydpi=medium-dpi, initial-scale=0.38, maximum-scale=2, user-scalable=yes" />
<title>천재학습백과 공유저작물</title>
<link rel="stylesheet" href="${croot}css/common.css" type="text/css" />
<link rel="shortcut icon" href="${croot}images/favicon.ico">
<script type="text/javascript" src="${croot}js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${croot}js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="${croot}js/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript" src="${croot}js/common.js"></script>
	<script type="text/javascript">
		searchBiology = function() {
			var munitidx = $("#munitidx option:selected").val();
			var entryTitle = $("#entryTitle").val();	// search keyword

			var form = document.forms[0];
			form.action = "/biology_search.do";
			form.submit();
		}

		searchBiologyImg = function(p) {
			var munitidx = $("#munitidx option:selected").val();
			var entryTitle = $("#entryTitle").val();	// search keyword

			var form = document.forms[0];
			form.page.value = p;
			form.action = "/biology_search_img.do";
			form.submit();
		}
	</script>
</head>

<body>
<ul id="skipnavi">
	<li><a href="#nav">메뉴 바로가기</a></li>
	<li><a href="#container">본문 바로가기</a></li>
	<li><a href="#footer">페이지 하단 바로가기</a></li>
</ul>
<div id="wrap">
	<div id="header">
		<div class="section">
			<h1><a href="main.do"><img src="${croot}images/common/logo.png" alt="천재학습백과 공유저작물"></a></h1>
			<div id="nav">
				<a href="heritage_research.do"><img src="${croot}images/common/gnb_01.png" alt="문화유산" /></a>
				<a href="biology_research.do" class="page"><img src="${croot}images/common/gnb_02.png" alt="생물정보" /></a>
				<a href="intro_page.do"><img src="${croot}images/common/gnb_03.png" alt="공유저작물 소개" /></a>
				<a href="uci_page.do"><img src="${croot}images/common/gnb_04.png" alt="UCI 서비스 소개" /></a>
			</div>
			<h2><img src="${croot}images/common/logo_uci.png" alt="UCI"></h2>
		</div>
		<div class="subNav menu2"><!-- 생물정보 // sub menu -->
			<div class="section">
				<a href="biology_research.do">학습자료</a>
				<a href="biology_theme.do">테마별 생물정보</a>
				<a href="biology_search.do" class="focus">생물정보 검색</a>
			</div>
		</div>
	</div>

	<div id="container">
		<div class="subTit">
			<div class="section menuBio">
				<p>생물정보 검색</p>
				<div class="breadcrumbs"><a href="main.do">HOME</a><a href="#">생물정보</a><span>검색</span></div>
			</div>
		</div>
		<div class="subCnt">
			<div class="section">
				<div class="searchTit">
					<p>국립수목원에서 제공하는 4,500여건의 생물정보 관련 이미지를 검색하실 수 있습니다.</p>
				</div>

				<div class="searchBox">
					<form name="search_form" id="search_form" method="post">
						<input type="hidden" name="page" id="page" value="1" />
						<dl>
							<dt>생물정보 검색</dt>
							<dd><select name="munitidx" id="munitidx">
								<option value="" <c:if test="${munitidx == ''}"><c:out value="selected" /></c:if>>전체</option>
								<option value="1034" <c:if test="${munitidx == '1034'}"><c:out value="selected" /></c:if>>포유류</option>
								<option value="1035" <c:if test="${munitidx == '1035'}"><c:out value="selected" /></c:if>>조류</option>
								<option value="1036" <c:if test="${munitidx == '1036'}"><c:out value="selected" /></c:if>>식물</option>
								<option value="1037" <c:if test="${munitidx == '1037'}"><c:out value="selected" /></c:if>>균류</option>
								<option value="1038" <c:if test="${munitidx == '1038'}"><c:out value="selected" /></c:if>>곤충</option>
							</select>
							</dd>
							<dd class="middle"><input type="text" class="text" id="entryTitle" name="entryTitle" value="${entryTitle}" /></dd>
						</dl>
					</form>
					<a href="javascript:searchBiologyImg(1);" class="searhBtn">검색</a>
				</div>

				<div class="searchResultTab">
					<a href="javascript:searchBiology();">“<c:out value="${refineEntryTitle}"/>” 검색 결과 (<c:out value="${utility.addComma(dataTotalCount)}"/>건)</a>
					<a href="#" class="selTab">“<c:out value="${refineEntryTitle}"/>” 관련 이미지 검색결과 (<c:out value="${totalCount}" />건)</a>
				</div>

				<div class="board imgList"><!-- board -->
					<ul>
						<c:forEach var="lists" items="${data}">
						<li><a href="#popImg"><img src="${croot}images/uci/thumb/<c:out value="${lists.filename}" />" alt="<c:out value="${lists.imageCaption}" />"> <span><c:out value="${lists.imageCaption}" /></span></a></li>
						</c:forEach>
						<!-- li><a href="#popImg"><img src="${croot}images/@pic05.jpg" alt=""> <span>숭례문(1882)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic06.jpg" alt=""> <span>남대문 시장과 숭례문(1904)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic07.jpg" alt=""> <span>숭례문과 숭례문 성곽(1904)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic08.jpg" alt=""> <span>전찻길이 놓인 숭례문(1905)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic09.jpg" alt=""> <span>일저 강점기 숭례문(1915년 추정)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic10.jpg" alt=""> <span>10환 지폐 전면에 담긴 숭례문<br />(1953~1962년 발행권)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic04.jpg" alt=""> <span>봄 숭례문(2015)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic05.jpg" alt=""> <span>숭례문(1882)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic06.jpg" alt=""> <span>남대문 시장과 숭례문(1904)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic07.jpg" alt=""> <span>숭례문과 숭례문 성곽(1904)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic08.jpg" alt=""> <span>전찻길이 놓인 숭례문(1905)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic09.jpg" alt=""> <span>일저 강점기 숭례문(1915년 추정)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic10.jpg" alt=""> <span>10환 지폐 전면에 담긴 숭례문<br />(1953~1962년 발행권)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic04.jpg" alt=""> <span>봄 숭례문(2015)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic05.jpg" alt=""> <span>숭례문(1882)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic06.jpg" alt=""> <span>남대문 시장과 숭례문(1904)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic07.jpg" alt=""> <span>숭례문과 숭례문 성곽(1904)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic08.jpg" alt=""> <span>전찻길이 놓인 숭례문(1905)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic09.jpg" alt=""> <span>일저 강점기 숭례문(1915년 추정)</span></a></li>
						<li><a href="#popImg"><img src="${croot}images/@pic10.jpg" alt=""> <span>10환 지폐 전면에 담긴 숭례문<br />(1953~1962년 발행권)</span></a></li -->
					</ul>
				</div><!-- //board -->

				<div class="paging">
					<span class="prev"><c:if test="${canPrev == 1}"><a href="javascript:searchBiologyImg(${(curPageDiv - 2)*10 + 1})">이전 보기</a></c:if></span>
					<c:forEach begin="${(curPageDiv - 1) * 10 + 1}" end="${(curPageDiv * 10) > blockPage ? blockPage : (curPageDiv * 10)}" step="1" varStatus="pp">
						<a href="javascript:searchBiologyImg(${pp.index});" <c:if test="${page == pp.index}">class="now"</c:if>><c:out value="${pp.index}" /></a>
					</c:forEach>
					<span class="next"><c:if test="${canNext == 1}"><a href="javascript:searchBiologyImg(${(curPageDiv -1) * 10 + 10});">다음 보기</a></c:if></span>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<div class="section">
			<div class="logo"><img src="${croot}images/common/logo_footer.png" alt="천재교육"></div>
			<span>(주)천재교육</span>
			<span>대표 : 최용준</span>
			<span> 주소 : 서울특별시 금천구 가산로 9길 54</span>
			<span>고객만족센터 : 1577-7609</span><br />
			<span>사업자등록번호 : 119-81-19350</span>
			<span>통신판매신고번호 : 제 18-439호</span>
			<span>부가통신사업신고번호 : 016712</span><br />
			<span class="copyright">copyright ⓒ 2015 by chunjae co.Ltd  all rights reserved.</span>
		</div>
	</div>
</div>

<div id="mask"></div>
<div id="popImg" class="popup">
	<div id="bigImg">
		<!-- a href="#" class="prevBtn"><span><img src="${croot}images/common/btn_prev.png" alt=""></span></a -->
		<p class="caption" id="popBigCaption">봄 숭례문(2015)</p>
		<figure><img id="popBigImg" src="http://www.cha.go.kr/unisearch/images/national_treasure/2685609.jpg" alt=""></figure>
		<a href="javascript:saveFile();" class="downloadBtn">이미지 저장</a>
		<!-- a href="#" class="nextBtn"><span><img src="${croot}images/common/btn_next.png" alt=""></span></a -->
	</div>

	<!-- div class="thumbLi">
		<a href="#" class="prevBtn"><span>◀</span></a>
		<ul>
			<li class="focus"><a href="http://www.cha.go.kr/unisearch/images/national_treasure/2685609.jpg"><img src="http://www.cha.go.kr/unisearch/images/national_treasure/2685609.jpg" alt=""></a></li>
			<li><a href="http://www.cha.go.kr/unisearch/images/national_treasure/2685619.jpg"><img src="http://www.cha.go.kr/unisearch/images/national_treasure/2685619.jpg" alt=""></a></li>
			<li><a href="http://www.cha.go.kr/unisearch/images/national_treasure/2685622.jpg"><img src="http://www.cha.go.kr/unisearch/images/national_treasure/2685622.jpg" alt=""></a></li>
			<li><a href="http://www.cha.go.kr/unisearch/images/national_treasure/2685626.jpg"><img src="http://www.cha.go.kr/unisearch/images/national_treasure/2685626.jpg" alt=""></a></li>
			<li><a href="http://www.cha.go.kr/unisearch/images/national_treasure/2685630.jpg"><img src="http://www.cha.go.kr/unisearch/images/national_treasure/2685630.jpg" alt=""></a></li>
			<li><a href="http://www.cha.go.kr/unisearch/images/national_treasure/2685633.jpg"><img src="http://www.cha.go.kr/unisearch/images/national_treasure/2685633.jpg" alt=""></a></li>
			<li><a href="http://www.cha.go.kr/unisearch/images/national_treasure/2685639.jpg"><img src="http://www.cha.go.kr/unisearch/images/national_treasure/2685639.jpg" alt=""></a></li>
			<li><a href="http://www.cha.go.kr/unisearch/images/national_treasure/2685654.jpg"><img src="http://www.cha.go.kr/unisearch/images/national_treasure/2685654.jpg" alt=""></a></li>
			<li><a href="http://www.cha.go.kr/unisearch/images/national_treasure/2685658.jpg"><img src="http://www.cha.go.kr/unisearch/images/national_treasure/2685658.jpg" alt=""></a></li>
		</ul>
		<a href="#" class="nextBtn"><span>▶</span></a -->
	</div>
</div>

<script type="text/javascript">
<!--
	//레이어팝업 이미지
	$("#mask").hide();
	$(document).ready(function() {
		$(".imgList ul li a").on({
			click : function(e) {
				e.preventDefault();

				var src = $($(this)).children().attr("src");
				src = src.replace("thumb", "ori");
				var alt = $($(this)).children().attr("alt");
				$("#popBigImg").attr("src",src);
				$("#popBigCaption").html(alt);

				$($(this).attr("href")).css({display:"block"});
				$("#mask").css({display:"block"});
			}
		});

		$(".thumbLi ul li a").on({
			click : function(e) {
				e.preventDefault();
				var imgUrl = $(this).attr("href");
				$("#bigImg figure img").attr("src",imgUrl);
				$(".thumbLi ul li").removeClass("focus");
				$(this).parent().addClass("focus");
			}
		});

		$(".popup .imgPopClose, #mask").on({
			click : function(e) {
				e.preventDefault();
				$(".popup").css({display:"none"});
				$("#mask").css({display:"none"});
			}
		});
	});

	saveFile = function() {
		//var url = $("#bigImg figure img").attr("src");
		var url = document.getElementById("popBigImg").src;
		try {
			url = url.replace("thumb", "ori");
		} catch(e) {
			alert('e->' + e);
		}
		var filename = url.substring(url.lastIndexOf("/") + 1).split("?")[0];
		if(/msie|trident/i.test(navigator.userAgent)){ // IE 인지 체크
			var _window = window.open(url, '_blank');// 새창으로 열어서..
			_window.document.close();
			_window.document.execCommand('SaveAs', true, filename);// 저장하라, false 로 해도 동일
			_window.close();// 끝나면 새창 닫음
		} else {
			// Get file name from url.
			var xhr = new XMLHttpRequest();
			xhr.responseType = 'blob';
			xhr.onload = function() {
				var a = document.createElement('a');
				a.href = window.URL.createObjectURL(xhr.response); // xhr.response is a blob
				a.download = filename; // Set the file name.
				a.style.display = 'none';
				document.body.appendChild(a);
				a.click();
				delete a;
			};
			xhr.open('GET', url);
			xhr.send();
		}
	}
//-->
</script>

</body>
</html>