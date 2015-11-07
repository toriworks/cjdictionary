<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/" var="croot" />
<!DOCTYPE do>
<do lang="ko">
<head>
	<meta charset="utf-8">
	<title>천재교육 학습백과 </title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta name="format-detection" content="telephone=no, address=no, email=no">
	<link href="${croot}css/m/m.css" rel="stylesheet">
	<script type="text/javascript" src="${croot}js/m/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${croot}js/m/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="${croot}js/m/iscroll.js"></script>
	<script type="text/javascript" src="${croot}js/m/common.js"></script>
</head>
<body>

<!-- wrap -->
<section id="wrap">
	<!-- header -->
	<header>
		<article class="mHeader">
			<h1><a href="main.do"><img src="${croot}images/m/main/logo.jpg" alt="천재학습백과 공유저작물"></a></h1>
		</article>
		<nav>
			<a class="page" href="heritage_research.do" target="_self">문화유산</a>
			<a href="biology_research.do" target="_self">생물정보</a>
			<a href="intro_page.do" target="_self">공유저작물 소개</a>
			<a href="uci_page.do" target="_self">UCI 서비스 소개</a>
		</nav>
		<div class="subNav">
			<a class="focus" href="heritage_research.do" target="_self">학습자료</a>
			<a href="heritage_theme.do" target="_self">테마별 문화유산</a>
			<a href="heritage_search.do" target="_self">문화유산 검색</a>
		</div>
		<div class="subTit">
			<figure><img src="${croot}images/sub/bg_menuCulture.png" alt=""></figure>
		</div>
	</header>
	<!--// header -->

	<!-- subwrap -->
	<section class="contents">
		<header>
			<h1>학습자료</h1>
		</header>
		<article>

			<div class="cultureList">
				<div class="cultureT first">
					<a href="heritage_view2.do?cat=1&idx=64125"><img src="${croot}images/m/@culture5.png" alt=""> <span>무령왕릉으로 보는 백제의 모습</span></a>
				</div>
				<div class="cultureT">
					<a href="heritage_view2.do?cat=1&idx=64126"><img src="${croot}images/m/@culture6.png" alt=""> <span>신라의 불교문화</span></a>
				</div>
				<div class="cultureT">
					<a href="heritage_view2.do?cat=1&idx=64127"><img src="${croot}images/m/@culture7.png" alt=""> <span>고인돌</span></a>
				</div>
				<div class="cultureT first">
					<a href="heritage_view2.do?cat=1&idx=64128"><img src="${croot}images/m/@culture8.png" alt=""> <span>고려청자</span></a>
				</div>
				<div class="cultureT">
					<a href="heritage_view2.do?cat=1&idx=64129"><img src="${croot}images/m/@culture9.png" alt=""> <span>고려 팔만대장경</span></a>
				</div>
				<div class="cultureT">
					<a href="heritage_view2.do?cat=1&idx=64134"><img src="${croot}images/m/@culture10.png" alt=""> <span>기념비로 살펴보는 고구려 영토</span></a>
				</div>
				<div class="cultureT first">
					<a href="heritage_view2.do?cat=1&idx=64155"><img src="${croot}images/m/@culture2.png" alt=""> <span>일본의 침략에 맞선 임진왜란</span></a>
				</div>
				<div class="cultureT">
					<a href="heritage_view2.do?cat=1&idx=64156"><img src="${croot}images/m/@culture3.png" alt=""> <span>오백년 역사가 잠든 조선왕릉</span></a>
				</div>
				<div class="cultureT">
					<a href="heritage_view2.do?cat=1&idx=64172"><img src="${croot}images/m/@culture1.png" alt=""> <span>세계문화유산 수원 화성</span></a>
				</div>
				<div class="cultureT first">
					<a href="heritage_view2.do?cat=1&idx=81975"><img src="${croot}images/m/@culture4.png" alt=""> <span>경복궁</span></a>
				</div>
			</div>

			<!-- div class="paging">
				<span class="prev"><a href="#" target="_self">이전 보기</a></span>
				<a href="#" class="now" target="_self">1</a>
				<a href="#" target="_self">2</a>
				<a href="#" target="_self">3</a>
				<a href="#" target="_self">4</a>
				<a href="#" target="_self">5</a>
				<span class="next"><a href="#" target="_self">다음 보기</a></span>
			</div -->
		</article>
	</section>

	<!--// subwrap -->

	<!-- footer -->
	<footer id="footer">
		<h1><img src="${croot}images/main/logo_footer.png" alt="천재교육"></h1>
		<span>(주)천재교육</span>
		<span>대표 : 최용준</span>
		<span>주소 : 서울특별시 금천구 가산로 9길 54</span><br />
		<span>고객만족센터 : 1577-7609</span>
		<span>사업자등록번호 : 119-81-19350</span><br />
		<span>통신판매신고번호 : 제 18-439호</span>
		<span>부가통신사업신고번호 : 016712</span><br />
		<span class="copyright">COPYRIGHT ⓒ 2015 BY CHUNJAE CO.LTD  ALL RIGHTS RESERVED.</span>
	</footer>
	<!-- footer -->
</section>
<!--// wrap -->

</body>
</do>