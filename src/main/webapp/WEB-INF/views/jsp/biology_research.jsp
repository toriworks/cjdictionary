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
				<a href="biology_theme.do" class="page"><img src="${croot}images/common/gnb_02.png" alt="생물정보" /></a>
				<a href="intro_page.do"><img src="${croot}images/common/gnb_03.png" alt="공유저작물 소개" /></a>
				<a href="uci_page.do"><img src="${croot}images/common/gnb_04.png" alt="UCI 서비스 소개" /></a>
			</div>
			<h2><img src="${croot}images/common/logo_uci.png" alt="UCI"></h2>
		</div>
		<div class="subNav menu2"><!-- 생물정보 // sub menu -->
			<div class="section">
				<a href="biology_theme.do">테마 별 생물정보</a>
				<a href="#" class="focus">학습자료</a>
				<a href="biology_search.do">생물정보 검색</a>
			</div>
		</div>
	</div>

	<div id="container">
		<div class="subTit">
			<div class="section menuBio">
				<p>학습자료</p>
				<div class="breadcrumbs"><a href="main.do">HOME</a><a href="#">생물정보</a><span>학습자료</span></div>
			</div>
		</div>
		<div class="subCnt">
			<div class="section">
				<div class="subDesc">
					생물정보 학습자료 설명영역
				</div>

				<div class="cultureList">
					<div class="cultureT first">
						<a href="biology_view2.do?cat=1&idx=78872"><img src="${croot}images/173_1.jpg" alt=""> <span>연못이나 강가에 사는 식물</span></a>
					</div>
					<div class="cultureT">
						<a href="biology_view2.do?cat=1&idx=78876"><img src="${croot}images/173_2.jpg" alt=""> <span>곤충의 먹이</span></a>
					</div>
					<div class="cultureT">
						<a href="biology_view2.do?cat=1&idx=78879"><img src="${croot}images/183_1.jpg" alt=""> <span>여러 가지 식물의 한살이</span></a>
					</div>
					<div class="cultureT first">
						<a href="biology_view2.do?cat=1&idx=78880"><img src="${croot}images/183_2.jpg" alt=""> <span>우리땅 독도의 생태계</span></a>
					</div>
					<div class="cultureT">
						<a href="biology_view2.do?cat=1&idx=78881"><img src="${croot}images/184_1.jpg" alt=""> <span>희귀한 우리나라 꽃</span></a>
					</div>
					<div class="cultureT">
						<a href="biology_view2.do?cat=1&idx=78882"><img src="${croot}images/184_2.jpg" alt=""> <span>식물이 자라는 데 필요한 조건</span></a>
					</div>
					<div class="cultureT first">
						<a href="biology_view2.do?cat=1&idx=79246"><img src="${croot}images/214_1.jpg" alt=""> <span>곤충의 한살이</span></a>
					</div>
					<div class="cultureT">
						<a href="biology_view2.do?cat=1&idx=79247"><img src="${croot}images/214_2.jpg" alt=""> <span>곤충들의 숨바꼭질</span></a>
					</div>
					<div class="cultureT">
						<a href="biology_view2.do?cat=1&idx=79248"><img src="${croot}images/214_3.jpg" alt=""> <span>물에 사는 동물의 특징</span></a>
					</div>
					<div class="cultureT first">
						<a href="biology_view2.do?cat=1&idx=79249"><img src="${croot}images/214_3.jpg" alt=""> <span>식물의 구조와 기능</span></a>
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