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
	<link rel="shortcut icon" href="${croot}images/favicon.ico">
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
				<a href="heritage_research.do"><img src="${croot}images/common/gnb_01.png" alt="문화유산" /></a>
				<a href="biology_research.do"><img src="${croot}images/common/gnb_02.png" alt="생물정보" /></a>
				<a href="intro_page.do"><img src="${croot}images/common/gnb_03.png" alt="공유저작물 소개" /></a>
				<a href="uci_page.do" class="page"><img src="${croot}images/common/gnb_04.png" alt="UCI 서비스 소개" /></a>
			</div>
			<h2><img src="${croot}images/common/logo_uci.png" alt="UCI"></h2>
		</div>
	</div>

	<div id="container">
		<div class="subTit">
			<div class="section menuUci">
				<p>UCI 서비스 소개</p>
				<div class="breadcrumbs"><a href="main.do">HOME</a><span>UCI 서비스 소개</span></div>
			</div>
		</div>
		<div class="mainBody">
			<div class="subBodyArea">
				<!-- 1body -->
				<div class="uciArea">
					<p class="tit">국가디지털콘텐츠식별체계 UCI를 소개합니다.</p>
					<span class="desc">UCI는 식별 가능한 자원의 효율적인 유통과 활용을 위하여 개발 자원에 유일한 코드를 부여하고 이를 관리해 주는 체계 또는 상이한 식별체계 간의 연계표준입니다.<br /><br />
					UCI는 식별체계 구성요소인 구문구조, 메타데이터, 운영절차, 운영시스템 네 요소가 서로 유기적으로 결합된 체계입니다. 서로 연계된 식별체계는 자원의 유통 기반으로서 역할을 수행하게 되며 E-learning, 유통내역 추적, 거래인증, 참조연계서비스(referencelinking service) 등 온라인과 오프라인 구분 없이 실질적인 활용분야에 다양하게 적용됩니다. 이렇듯 UCI는 비즈니스와 관련된 응용모델 제시를 통해 여러 가지 부가서비스 창출이 가능하며 이는 UCI 개념을 보다 포괄적으로 해석할 수 있도록 합니다.</span>
					<p class="tit">1. 식별체계란 ?</p>
					<span class="desc">식별체계 : 식별을 이용하여 어떤 일을 처리하기 위해 만들어진 방식이자 표준화된 체계입니다.</span>
					<figure><img src="${croot}/images/sub/uci_img01.png" alt=""></figure>
					<span class="desc">객관적이고 명확한 기준이 없다면 선택 기준에 따라 얼마든지 달라질 수 있으므로, 타인과 함께 어떤 행위를 하기 위해서는 동일한, 즉 표준화된 식별 방법이 필요합니다.</span>
					<figure><img src="${croot}/images/sub/uci_img02.png" alt=""></figure>

					<p class="tit">2. 디지털 콘텐츠 식별체계</p>
					<span class="desc">디지털 콘텐츠 식별체계는 개별 콘텐츠를 식별하기 위한 ID를 발급하고 메타데이터(항목의 속성정보)를 관리하며 디지털 네트워크 상에서 ID의 변환 과정을 통해 다양한 정보를 제공하는 서비스 체계 입니다.<br /><br />
					수많은 디지털 콘텐츠 중에서 개개의 콘텐츠를 식별하는 방법으로 인터넷상의 정보 공유와 교류를 원활하게 만드는 중요한 역할을 합니다.<br />
					예를 들어 직접 제작한 동영상 파일에 디지털 콘텐츠 식별체계의 식별자를 부여할 경우, 마치 상품에 부여된 바코드처럼 판매, 구매가 가능한 것은 물론이며 이용현황 및 유통과정의 추적도 가능하게 됩니다.</span>
					<figure><img src="${croot}/images/sub/uci_img03.png" alt=""></figure>

					<p class="tit">3. UCI 의 구성</p>
					<span class="desc">UCI는 식별체계 구성요소인 구문구조, 메타데이터, 운영절차, 운영시스템 네 요소가 서로 유기적으로 결합된 체계입니다.<br /><br />
					서로 연계된 식별체계는 자원의 유통 기반으로서 역할을 수행하게 되며 e-Learning, 유통내역 추적, 거래인증, 참조연계서비스(reference linking service) 등 온라인과 오프라인 구분 없이 실질적인 활용분야에 다양하게 적용됩니다.<br /><br />
					UCI는 비즈니스와 관련된 응용모델 제시를 통해 여러 가지 부가서비스 창출이 가능하며 이는 UCI개념을 보다 포괄적으로 해석할 수 있도록 합니다.</span>
					<figure><img src="${croot}/images/sub/uci_img04.png" alt=""></figure>

					<div class="btnLink"><a href="http://www.uci.or.kr/" target="_blank">UCI 홈페이지 바로가기</a></div>


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