<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/" var="croot" />
<!DOCTYPE html>
<html lang="ko">
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
			<a href="heritage_research.do">문화유산</a>
			<a href="biology_research.do">생물정보</a>
			<a href="intro_page.do" class="page">공유저작물 소개</a>
			<a href="uci_page.do">UCI 서비스 소개</a>
		</nav>
		<!-- <div class="subNav">
			<a href="#" target="_self">테마별 문화유산</a>
			<a href="#" target="_self">학습자료</a>
			<a class="focus" href="#" target="_self">생물정보 검색</a>
		</div> -->
		<div class="subTit">
			<figure><img src="${croot}images/m/sub/bg_menuIntro.png" alt=""></figure>
		</div>
	</header>
	<!--// header -->

	<!-- subwrap -->
	<section class="contents">
		<header>
			<h1>공유저작물 소개</h1>
		</header>
		<article>
			<div class="introArea">
				<p class="tit">서비스 소개</p>
				<span class="desc">천재학습백과 공유저작물은 국립수목원과 문화재청 등 공공기관에서 생산한 공공저작물을 기반으로 콘텐츠를 개발하였습니다. 공공저작물은 DB가 방대하고, 내용이 정확하지만 어려운 용어를 사용하여 교육현장에서 활용하는데 어려움이 많았습니다. 그래서 천재학습백과 공유저작물 서비스에서 어려운 용어와 문장을 가다듬고, 멀티미디어 자료를 보완하여 콘텐츠를 재가공하였습니다. <br />
				또한 교육출판업계 중 유일한 UCI RA 기관인 천재교육은 개별 콘텐츠마다 국가디지털콘텐츠식별체계인 UCI  Code를 부여하여 콘텐츠의 효율적인 관리가 이루어지도록 했습니다. 모든 표제어 단위의 문서마다 유일한 고유값인 UCI Code가 부여되어 있어, UCI Code만 알고 있으면 해당 콘텐츠를 정확하고 빠르게 찾으실 수 있습니다. </span>
				<p class="tit">콘텐츠 소개</p>
				<figure class="fLimg"><img src="${croot}images/m/sub/bg_intro.png" alt=""></figure>
				<span class="desc">천재학습백과 공유저작물 서비스에는 크게 두 종류의 콘텐츠가 있습니다.<br />
				문화유산에는 국보, 보물, 사적, 중요무형문화재, 천연기념물, 기타문화재 4,500여건의 문화재 정보가 수록되어 있습니다. 생물정보에는 다양한 식물들과 식물과 관련된 곤충, 균류, 조류, 포유류 정보 4,500여건이 포함되어 있습니다. 콘텐츠들은 교과과정과 연계하여 내용을 쉽게 이해할 수 있도록 구성하였습니다. </span>
				<p class="tit">저작권 유의사항</p>
				<span class="desc">공유저작물 콘텐츠는 비영리 목적으로 출처 표시, 자유롭게 이용 및 변형, 2차적 저작물 작성이 가능합니다. 영리 및 상업적 이용의 범위에 대해서는 별도 문의 바랍니다.  수업자료 활용, 과제 자료로서의 활용에는 별도의 이용허락을 받지 않아도 됩니다.</span>
			</div>
		</article>
	</section>

	<!--// subwrap -->

	<!-- footer -->
	<footer id="footer">
		<h1><img src="${croot}images/m/main/logo_footer.png" alt="천재교육"></h1>
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
</html>