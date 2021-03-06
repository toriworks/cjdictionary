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
				<a href="heritage_research.do" class="page"><img src="${croot}images/common/gnb_01.png" alt="문화유산" /></a>
				<a href="biology_research.do"><img src="${croot}images/common/gnb_02.png" alt="생물정보" /></a>
				<a href="intro_page.do"><img src="${croot}images/common/gnb_03.png" alt="공유저작물 소개" /></a>
				<a href="uci_page.do"><img src="${croot}images/common/gnb_04.png" alt="UCI 서비스 소개" /></a>
			</div>
			<h2><img src="${croot}images/common/logo_uci.png" alt="UCI"></h2>
		</div>
		<div class="subNav"><!-- 문화유산 // sub menu -->
			<div class="section">
				<a href="heritage_research.do" class="focus">학습자료</a>
				<a href="heritage_theme.do">테마별 문화유산</a>
				<a href="heritage_search.do">문화유산 검색</a>
			</div>
		</div>
	</div>

	<div id="container">
		<div class="subTit">
			<div class="section menuCulture">
				<p>학습자료</p>
				<div class="breadcrumbs"><a href="main.do">HOME</a><a href="#">문화유산</a><span>학습자료</span></div>
			</div>
		</div>
		<div class="subCnt">
			<div class="section">
				<div class="subDesc">
					<p>문화유산 학습자료는 문화유산을 교과 과정과 연계하여 쉽게 이해할 수 있도록 구성하였습니다.</p>
				</div>

				<div class="cultureList">
					<div class="cultureT first">
						<a href="heritage_view2.do?cat=1&idx=64125"><img src="${croot}images/108_1.jpg" alt=""> <span>무령왕릉으로 보는 백제의 모습</span></a>
					</div>
					<div class="cultureT">
						<a href="heritage_view2.do?cat=1&idx=64126"><img src="${croot}images/108_2.jpg" alt=""> <span>신라의 불교문화</span></a>
					</div>
					<div class="cultureT">
						<a href="heritage_view2.do?cat=1&idx=64127"><img src="${croot}images/109_1.jpg" alt=""> <span>고인돌</span></a>
					</div>
					<div class="cultureT first">
						<a href="heritage_view2.do?cat=1&idx=64128"><img src="${croot}images/109_2.jpg" alt=""> <span>고려청자</span></a>
					</div>
					<div class="cultureT">
						<a href="heritage_view2.do?cat=1&idx=64129"><img src="${croot}images/109_3.jpg" alt=""> <span>고려 팔만대장경</span></a>
					</div>
					<div class="cultureT">
						<a href="heritage_view2.do?cat=1&idx=64134"><img src="${croot}images/110_1.jpg" alt=""> <span>기념비로 살펴보는 고구려 영토</span></a>
					</div>
					<div class="cultureT first">
						<a href="heritage_view2.do?cat=1&idx=64155"><img src="${croot}images/123_1.jpg" alt=""> <span>일본의 침략에 맞선 임진왜란</span></a>
					</div>
					<div class="cultureT">
						<a href="heritage_view2.do?cat=1&idx=64156"><img src="${croot}images/123_2.jpg" alt=""> <span>오백년 역사가 잠든 조선왕릉</span></a>
					</div>
					<div class="cultureT">
						<a href="heritage_view2.do?cat=1&idx=64172"><img src="${croot}images/132_1.jpg" alt=""> <span>세계문화유산 수원 화성</span></a>
					</div>
					<div class="cultureT first">
						<a href="heritage_view2.do?cat=1&idx=81975"><img src="${croot}images/232_1.jpg" alt=""> <span>경복궁</span></a>
					</div>

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