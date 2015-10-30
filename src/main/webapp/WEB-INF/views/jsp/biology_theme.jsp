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
	<script type="text/javascript">
		goPage = function(binderIdx, title) {
			location.href = "biology_list.do?binderIdx=" + binderIdx + "&title=" + title;
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
				<a href="heritage_theme.do"><img src="${croot}images/common/gnb_01.png" alt="문화유산" /></a>
				<a href="biology_theme.do" class="page"><img src="${croot}images/common/gnb_02.png" alt="생물정보" /></a>
				<a href="intro_page.do"><img src="${croot}images/common/gnb_03.png" alt="공유저작물 소개" /></a>
				<a href="uci_page.do"><img src="${croot}images/common/gnb_04.png" alt="UCI 서비스 소개" /></a>
			</div>
			<h2><img src="${croot}images/common/logo_uci.png" alt="UCI"></h2>
		</div>
		<div class="subNav menu2"><!-- 생물정보 // sub menu -->
			<div class="section">
				<a href="#" class="focus">테마 별 생물정보</a>
				<a href="biology_research.do">학습자료</a>
				<a href="biology_search.do">생물정보 검색</a>
			</div>
		</div>
	</div>

	<div id="container">
		<div class="subTit">
			<div class="section menuCulture">
				<p>테마 별 생물정보</p>
				<div class="breadcrumbs"><a href="main.do">HOME</a><a href="#">생물정보</a><span>테마 별 생물정보</span></div>
			</div>
		</div>
		<div class="subCnt">
			<div class="section">
				<div class="subDesc">
					생물정보 학습자료 설명영역
				</div>
				<div class="sorting">
					<div class="sideL"><span>학교구분</span>
						<select name="" id="">
							<option value="">전체</option>
							<option value="">초등</option>
							<option value="">중등</option>
							<option value="">고등</option>
							<option value="">공통</option>
						</select>
					</div>

					<div class="sideR"><span>정렬</span>
						<select name="" id="">
							<option value="">이름</option>
							<option value="">조회수</option>
							<option value="">등록일</option>
						</select>
					</div>
				</div>
				<ul class="themeT">
					<li>
						<a href="javascript:goPage(48, '생물정보 테마48');"><p>생물정보 테마48</p></a>
						<span>숭례문, 진흥왕 순수비, <br />원각사지 10층 석탑…</span></a>
					</li>
					<li>
						<a href="javascript:goPage(49, '생물정보 테마49');"><p>생물정보 테마49</p></a>
						<span>숭례문, 진흥왕 순수비, <br />원각사지 10층 석탑…</span></a>
					</li>
					<li>
						<a href="javascript:goPage(1, '생물정보 테마1');"><p>생물정보 테마1</p></a>
						<span>독립문, 독립신문, <br />아우내 3.1운동 독립사적지..</span></a>
					</li>
					<li>
						<a href="javascript:goPage(1, '생물정보 테마1');"><p>생물정보 테마1</p></a>
						<span>숭례문, 진흥왕 순수비, <br />원각사지 10층 석탑…</span></a>
					</li>
					<li>
						<a href="javascript:goPage(1, '생물정보 테마1');"><p>생물정보 테마1</p></a>
						<span>숭례문, 진흥왕 순수비, <br />원각사지 10층 석탑…</span></a>
					</li>
					<li>
						<a href="javascript:goPage(1, '생물정보 테마1');"><p>생물정보 테마1</p></a>
						<span>독립문, 독립신문, <br />아우내 3.1운동 독립사적지..</span></a>
					</li>
					<li>
						<a href="javascript:goPage(1, '생물정보 테마1');"><p>생물정보 테마1</p></a>
						<span>숭례문, 진흥왕 순수비, <br />원각사지 10층 석탑…</span></a>
					</li>
					<li>
						<a href="javascript:goPage(1, '생물정보 테마1');"><p>생물정보 테마1</p></a>
						<span>숭례문, 진흥왕 순수비, <br />원각사지 10층 석탑…</span></a>
					</li>
					<li>
						<a href="javascript:goPage(1, '생물정보 테마1');"><p>생물정보 테마1</p></a>
						<span>독립문, 독립신문, <br />아우내 3.1운동 독립사적지..</span></a>
					</li>
				</ul>
			</div>
			<!-- div class="paging">
				<span class="prev"><a href="#">이전 보기</a></span>
				<a href="#" class="now">1</a>
				<a href="#">2</a>
				<a href="#">3</a>
				<a href="#">4</a>
				<a href="#">5</a>
				<a href="#">6</a>
				<a href="#">7</a>
				<a href="#">8</a>
				<a href="#">9</a>
				<a href="#">10</a>
				<span class="next"><a href="#">다음 보기</a></span>
			</div -->
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