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

<!-- wrap -->
<section id="wrap">
	<!-- header -->
	<header>
		<article class="mHeader">
			<h1><a href="main.do"><img src="${croot}images/m/main/logo.jpg" alt="천재학습백과 공유저작물"></a></h1>
		</article>
		<nav>
			<a href="heritage_research.do" target="_self">문화유산</a>
			<a class="page" href="biology_research.do" target="_self">생물정보</a>
			<a href="intro_page.do" target="_self">공유저작물 소개</a>
			<a href="uci_page.do" target="_self">UCI 서비스 소개</a>
		</nav>
		<div class="subNav">
			<a class="focus" href="biology_research.do" target="_self">학습자료</a>
			<a href="biology_theme.do" target="_self">테마별 생물정보</a>
			<a href="biology_search.do" target="_self">생물정보 검색</a>
		</div>
		<div class="subTit">
			<figure><img src="${croot}images/sub/bg_menuBio.png" alt=""></figure>
		</div>
	</header>
	<!--// header -->

	<!-- subwrap -->
	<section class="contents">
		<header>
			<h1><!--학습자료--></h1>
		</header>
		<article>

			<div class="cultureList">
				<div class="cultureT first">
					<a href="biology_view2.do?cat=1&idx=78872"><img src="${croot}images/m/@biology1.png" alt=""> <span>연못이나 강가에 사는 식물</span></a>
				</div>
				<div class="cultureT">
					<a href="biology_view2.do?cat=1&idx=78876"><img src="${croot}images/m/@biology5.png" alt=""> <span>곤충의 먹이</span></a>
				</div>
				<div class="cultureT">
					<a href="biology_view2.do?cat=1&idx=78879"><img src="${croot}images/m/@biology6.png" alt=""> <span>여러 가지 식물의 한살이</span></a>
				</div>
				<div class="cultureT first">
					<a href="biology_view2.do?cat=1&idx=78880"><img src="${croot}images/m/@biology4.png" alt=""> <span>우리땅 독도의 생태계</span></a>
				</div>
				<div class="cultureT">
					<a href="biology_view2.do?cat=1&idx=78881"><img src="${croot}images/m/@biology7.png" alt=""> <span>희귀한 우리나라 꽃</span></a>
				</div>
				<div class="cultureT">
					<a href="biology_view2.do?cat=1&idx=78882"><img src="${croot}images/m/@biology8.png" alt=""> <span>식물이 자라는 데 필요한 조건</span></a>
				</div>
				<div class="cultureT first">
					<a href="biology_view2.do?cat=1&idx=79246"><img src="${croot}images/m/@biology3.png" alt=""> <span>곤충의 한살이</span></a>
				</div>
				<div class="cultureT">
					<a href="biology_view2.do?cat=1&idx=79247"><img src="${croot}images/m/@biology9.png" alt=""> <span>곤충들의 숨바꼭질</span></a>
				</div>
				<div class="cultureT">
					<a href="biology_view2.do?cat=1&idx=79248"><img src="${croot}images/m/@biology2.png" alt=""> <span>물에 사는 동물의 특징</span></a>
				</div>
				<div class="cultureT first">
					<a href="biology_view2.do?cat=1&idx=79249"><img src="${croot}images/m/@biology10.png" alt=""> <span>식물의 구조와 기능</span></a>
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
		<span>고객만족센터 : 1577-0902</span>
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