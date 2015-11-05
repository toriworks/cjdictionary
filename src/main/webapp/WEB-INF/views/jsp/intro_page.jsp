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
	<script type="text/javascript" src="${croot}js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${croot}js/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="${croot}js/jquery-ui-1.8.23.custom.min.js"></script>
	<script type="text/javascript" src="${croot}js/common.js"></script>
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
				<a href="heritage_theme.do"><img src="${croot}images/common/gnb_01.png" alt="문화유산" /></a>
				<a href="biology_theme.do"><img src="${croot}images/common/gnb_02.png" alt="생물정보" /></a>
				<a href="intro_page.do" class="page"><img src="${croot}images/common/gnb_03.png" alt="공유저작물 소개" /></a>
				<a href="uci_page.do"><img src="${croot}images/common/gnb_04.png" alt="UCI 서비스 소개" /></a>
			</div>
			<h2><img src="${croot}images/common/logo_uci.png" alt="UCI"></h2>
		</div>
	</div>

	<div id="container">
		<div class="subTit">
			<div class="section menuPage">
				<p>공유저작물 소개</p>
				<div class="breadcrumbs"><a href="main.do">HOME</a><span>공유저작물 소개</span></div>
			</div>
		</div>
		<div class="mainBody">
			<div class="subBodyArea">
				<!-- 1body -->
				<div class="introArea">
					<p class="tit">서비스 소개</p>
					<span class="desc">천재학습백과 공유저작물은 국립수목원과 문화재청 등 공공기관에서 생산한 공공저작물을 기반으로 콘텐츠를 개발하였습니다. 공공저작물은 DB가 방대하고, 내용이 정확하지만 어려운 용어를 사용하여 교육현장에서 활용하는데 어려움이 많았습니다. 그래서 천재학습백과 공유저작물 서비스에서 어려운 용어와 문장을 가다듬고, 멀티미디어 자료를 보완하여 콘텐츠를 재가공하였습니다. <br />
					또한 교육출판업계 중 유일한 UCI RA 기관인 천재교육은 개별 콘텐츠마다 국가디지털콘텐츠식별체계인 UCI  Code를 부여하여 콘텐츠의 효율적인 관리가 이루어지도록 했습니다. 모든 표제어 단위의 문서마다 유일한 고유값인 UCI Code가 부여되어 있어, UCI Code만 알고 있으면 해당 콘텐츠를 정확하고 빠르게 찾으실 수 있습니다. </span>
					<p class="tit">콘텐츠 소개</p>
					<figure class="fLimg"><img src="${croot}/images/sub/bg_intro.png" alt=""></figure>
					<span class="desc">천재학습백과 공유저작물 서비스에는 크게 두 종류의 콘텐츠가 있습니다.<br />
					문화유산에는 국보, 보물, 사적, 중요무형문화재, 천연기념물, 기타문화재 4,500여건의 문화재 정보가 수록되어 있습니다. 생물정보에는 다양한 식물들과 식물과 관련된 곤충, 균류, 조류, 포유류 정보 4,500여건이 포함되어 있습니다. 콘텐츠들은 교과과정과 연계하여 내용을 쉽게 이해할 수 있도록 구성하였습니다. </span>
					<p class="tit">저작권 유의사항</p>
					<span class="desc">공유저작물 콘텐츠는 비영리 목적으로 출처 표시, 자유롭게 이용 및 변형, 2차적 저작물 작성이 가능합니다. 영리 및 상업적 이용의 범위에 대해서는 별도 문의 바랍니다.  수업자료 활용, 과제 자료로서의 활용에는 별도의 이용허락을 받지 않아도 됩니다.</span>
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

</body>
</html>