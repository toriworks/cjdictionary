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
	goHeritagePage = function(binderIdx, title) {
		location.href = "heritage_list.do?binderIdx=" + binderIdx + "&title=" + title;
	}

	searchSth = function(id) {
		var keyword = "";
		var action = "";
		if(id == 1) {
			keyword = $("#hSearchText").val();
			action = "heritage_search.do";
		} else {
			keyword = $("#bSearchText").val();
			action = "biology_search.do";
		}

		if(keyword == "") {
			var alertMsg = (id == 1) ? "문화유산 " : "생물정보 ";
			alert(alertMsg + "검색어를 입력해 주세요.");
			return;
		}

//		$('#search_form').attr('action', action);
//		$('#entryTitle').val = keyword;
//		$('#search_form').submit();
		var form = document.forms[0];
		form.action = action;
		form.entryTitle.value = keyword;
		form.submit()

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
				<a href="biology_theme.do"><img src="${croot}images/common/gnb_02.png" alt="생물정보" /></a>
				<a href="intro_page.do"><img src="${croot}images/common/gnb_03.png" alt="공유저작물 소개" /></a>
				<a href="uci_page.do"><img src="${croot}images/common/gnb_04.png" alt="UCI 서비스 소개" /></a>
			</div>
			<h2><img src="${croot}images/common/logo_uci.png" alt="UCI"></h2>
		</div>
	</div>

	<div id="container">
		<div id="mainVisual" style="background:#b2eef0 url(${croot}images/main/mainVisual_img.png) no-repeat center 59px;">
			<div class="section">
				<a href="heritage_theme.do">문화유산 GO</a>
				<a href="biology_theme.do">생물정보 GO</a>
			</div>
		</div>
		<!-- 문화유산, 생물정보 tab -->
		<div id="mainContent">
			<div class="section">
				<ul class="tab">
					<li class="active"><a href="#heritageBox">문화유산</a></li>
					<li><a href="#biologyBox">생물정보</a></li>
				</ul>
			</div>
			<div id="heritageBox" class="mainBox">
				<div class="section">
					<div class="heritageSearch">
						<p>문화재청에서 제공하는 <strong>4,500여건</strong>의 문화유산 정보를 검색하실 수 있습니다.</p>
						<input type="text" id="hSearchText" name="hSearchText" class="searchText" /><button onclick="searchSth(1);">문화유산 검색</button>
					</div>
				</div>
				<div class="themeHeritage">
					<div class="section">
						<p class="sectionTit theme">테마별 문화유산 <a class="moreBtn" href="heritage_theme.do">테마 전체보기 ▶</a></p>
						<div class="themeT bg3 first" onclick="goHeritagePage(1, '초등학생이 꼭 알아야 할 국보 10가지');">
							<a href="javascript:goPage(1, '초등학생이 꼭 알아야 할 국보 10가지');"><p>초등학생이 꼭 알아야 할 국보 10가지</p></a>
							<span>숭례문, 진흥왕 순수비, <br />원각사지 10층 석탑…</span>
						</div>
						<div class="themeT bg3" onclick="goHeritagePage(44, '중학교 1학년 역사교과서에 나오는 문화재');">
							<a href="javascript:goPage(44, '초등학생이 꼭 알아야 할 국보 10가지');"><p>중학교 1학년 역사교과서에 나오는 문화재</p></a>
							<span>숭례문, 진흥왕 순수비, <br />원각사지 10층 석탑…</span>
						</div>
						<div class="themeT bg3"onclick="goHeritagePage(45, '광복 70주년 독립운동 문화유산');">
							<a href="javascript:goPage(45, '초등학생이 꼭 알아야 할 국보 10가지');"><p>광복 70주년 독립운동 문화유산</p></a>
							<span>독립문, 독립신문, <br />아우내 3.1운동 독립사적지..</span>
						</div>
					</div>
				</div>
				<div class="mainStudy">
					<div class="section">
						<p class="sectionTit culture">문화재 학습자료 <a class="moreBtn" href="heritage_research.do">학습자료 전체보기 ▶</a></p>
						<div class="cultureT first">
							<a href="heritage_view2.do?cat=1&idx=64172"><img src="${croot}images/132_1.jpg" alt=""> <span>세계문화유산 수원화성</span></a>
						</div>
						<div class="cultureT">
							<a href="heritage_view2.do?cat=1&idx=64155"><img src="${croot}images/123_1.jpg" alt=""> <span>일본의 침략에 맞선 임진왜란</span></a>
						</div>
						<div class="cultureT">
							<a href="heritage_view2.do?cat=1&idx=64156"><img src="${croot}images/123_2.jpg" alt=""> <span>오백년 역사가 잠든 조선왕릉</span></a>
						</div>
					</div>
				</div>
			</div>
			<div id="biologyBox" class="mainBox">
				<div class="section">
					<div class="heritageSearch">
						<p>국립수목원에서 제공하는 <strong>4,500여건</strong>의 생물정보 정보를 검색하실 수 있습니다.</p>
						<input type="text" id="bSearchText" name="bSearchText" class="searchText" /><button onclick="searchSth(2);">생물정보 검색</button>
					</div>
				</div>
				<div class="themeHeritage">
					<div class="section">
						<p class="sectionTit theme">테마별 생물정보 <a class="moreBtn" href="biology_theme.do">테마 전체보기 ▶</a></p>
						<div class="themeT bg1 first" onclick="goHeritagePage(1, '초등학생이 꼭 알아야 할 국보 10가지');">
							<a href="javascript:goPage(1, '초등학생이 꼭 알아야 할 국보 10가지');"><p>초등학생이 꼭 알아야 할 국보 10가지</p></a>
							<span>숭례문, 진흥왕 순수비, <br />원각사지 10층 석탑…</span>
						</div>
						<div class="themeT bg1" onclick="goHeritagePage(44, '중학교 1학년 역사교과서에 나오는 문화재');">
							<a href="javascript:goPage(44, '초등학생이 꼭 알아야 할 국보 10가지');"><p>중학교 1학년 역사교과서에 나오는 문화재</p></a>
							<span>숭례문, 진흥왕 순수비, <br />원각사지 10층 석탑…</span>
						</div>
						<div class="themeT bg1"onclick="goHeritagePage(45, '광복 70주년 독립운동 문화유산');">
							<a href="javascript:goPage(45, '초등학생이 꼭 알아야 할 국보 10가지');"><p>광복 70주년 독립운동 문화유산</p></a>
							<span>독립문, 독립신문, <br />아우내 3.1운동 독립사적지..</span>
						</div>
					</div>
				</div>
				<div class="mainStudy">
					<div class="section">
						<p class="sectionTit culture">생물정보 학습자료 <a class="moreBtn" href="biology_research.do">학습자료 전체보기 ▶</a></p>
						<div class="cultureT first">
							<a href="biology_view2.do?cat=1&idx=78872"><img src="${croot}images/173_1.jpg" alt=""> <span>연못이나 강가에 사는 식물</span></a>
						</div>
						<div class="cultureT">
							<a href="biology_view2.do?cat=1&idx=79248"><img src="${croot}images/214_3.jpg" alt=""> <span>물에 사는 동물의 특징</span></a>
						</div>
						<div class="cultureT">
							<a href="biology_view2.do?cat=1&idx=79246"><img src="${croot}images/214_1.jpg" alt=""> <span>곤충의 한살이 </span></a>
						</div>
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
<form name="search_form" id="search_form" method="post">
	<input type="hidden" id="munitidx" name="munitidx" value="" />
	<input type="hidden" id="entryTitle" name="entryTitle" value="" />
</form>
</body>
</html>