<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/" var="croot" />
<!DOCTYPE html>
<html lang="ko">
<head>
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /><![endif]-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1" />
<meta name="viewport" content="width=device-width, target-densitydpi=medium-dpi, initial-scale=0.38, maximum-scale=2, user-scalable=yes" />
<title>천재학습백과 공유저작물</title>
<link rel="stylesheet" href="${croot}css/common.css" type="text/css" />
<link rel="shortcut icon" href="http://www.chunjae.co.kr/resource/images/common/favicon.ico" />
<script type="text/javascript" src="${croot}js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${croot}js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="${croot}js/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript" src="${croot}js/common.js"></script>
<script type="text/javascript">
	searchBiology = function() {
		var munitidx = $("#munitidx option:selected").val();
		var entryTitle = $("#entryTitle").val();	// search keyword

		var form = $("#search_form");
		form.action = "/biology_search.do";
		form.submit();
	}
</script>
<!--Glogle Analytics-->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-69979853-1', 'auto');
  ga('send', 'pageview');

</script>
</head>

<body onload="searchBiology();">
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
					<dl>
						<dt>생물정보 검색</dt>
						<dd><select name="munitidx" id="munitidx">
							<option value="">전체</option>
								<option value="1034">포유류</option>
								<option value="1035">조류</option>
								<option value="1036">식물</option>
								<option value="1037">균류</option>
								<option value="1038">곤충</option>
							</select>
						</dd>
						<dd class="middle"><input type="text" class="text" id="entryTitle" name="entryTitle" /></dd>
					</dl>
						</form>
						<a href="javascript:searchBiology();" class="searhBtn">검색</a>
				</div>
				<div style="margin-bottom:200px;"></div>
			</div>
		</div>
	</div>
	<div id="footer">
		<div class="section">
			<div class="logo"><img src="${croot}images/common/logo_footer.png" alt="천재교육"></div>
			<span>(주)천재교육</span>
			<span>대표 : 최용준</span>
			<span> 주소 : 서울특별시 금천구 가산로 9길 54</span>
			<span>고객만족센터 : 1577-0902</span><br />
			<span>사업자등록번호 : 119-81-19350</span>
			<span>통신판매신고번호 : 제 18-439호</span>
			<span>부가통신사업신고번호 : 016712</span><br />
			<span class="copyright">copyright ⓒ 2015 by chunjae co.Ltd  all rights reserved.</span>
		</div>
	</div>
</div>

</body>
</html>