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
			<a href="intro_page.do">공유저작물 소개</a>
			<a href="uci_page.do">UCI 서비스 소개</a>
		</nav>
	</header>
	<!--// header -->

	<!-- mainWrap -->
	<section id="mainWrap">
		<div class="visual">
			<a href="heritage_research.do" class="linkA">문화유산</a>
			<a href="biology_research.do" class="linkB">생물정보</a>

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
							<p>문화재청에서 제공하는 <br /><strong>4,500여건</strong>의 문화유산 정보를 검색하실 수 있습니다.</p>
							<input type="text" class="searchText" id="hSearchText" name="hSearchText" /><button onclick="searchSth(1);">문화유산 검색</button>
						</div>
					</div>

					<div class="themeHeritage">
						<div class="section">
							<p class="sectionTit theme">테마 별 문화유산 <a class="moreBtn" href="heritage_theme.do">테마 전체보기 ▶</a></p>

							<div class="themeT bg1" onclick="goHeritagePage(5, '우리나라의 세계유산');">
								<p><a href="javascript:goPage(5, '우리나라의 세계유산');">우리나라의 세계유산</a></p>
								<span>수원 화성, 경주 불국사, 창덕궁,<br /> 남한산성, 합천 해인사…</span>
							</div>
							<div class="themeT bg2" onclick="goHeritagePage(7, '우리나라의 기록유산');">
								<p><a href="javascript:goPage(7, '우리나라의 기록유산');">우리나라의 기록유산</a></p>
								<span>훈민정음, 이순신 난중일기, 동의보감<br />조선왕조실록 태백산사고본…</span>
							</div>
							<div class="themeT bg3" onclick="goHeritagePage(6, '우리나라의 인류무형문화유산');">
								<p><a href="javascript:goPage(6, '우리나라의 인류무형문화유산');">우리나라의 인류무형문화유산</a></p>
								<span>판소리, 강강술래, 남사당놀이 <br />종묘제례악, 강릉단오제…</span>
							</div>
						</div>
					</div>
					<!-- 문화재 학습자료 -->
					<div class="mainStudy">
						<div class="section">
							<p class="sectionTit culture">문화재 학습자료 <a class="moreBtn" href="heritage_research.do">학습자료 전체보기 ▶</a></p>
							<div class="cultureT">
								<a href="heritage_view2.do?cat=1&idx=64172"><img src="${croot}images/m/@culture1.png" alt=""> <span>세계문화유산 수원화성</span></a>
							</div>
							<div class="cultureT">
								<a href="heritage_view2.do?cat=1&idx=64155"><img src="${croot}images/m/@culture2.png" alt=""> <span>일본의 침략에 맞선 임진왜란</span></a>
							</div>
							<div class="cultureT">
								<a href="heritage_view2.do?cat=1&idx=64156"><img src="${croot}images/m/@culture3.png" alt=""> <span>오백년 역사가 잠든 조선왕릉</span></a>
							</div>
							<div class="cultureT">
								<a href="heritage_view2.do?cat=1&idx=81975"><img src="${croot}images/m/@culture4.png" alt=""> <span>경복궁</span></a>
							</div>
						</div>
					</div>

				</div>
				<div id="biologyBox" class="mainBox">
					<div class="section">
						<div class="heritageSearch">
							<p><strong>24,500여건</strong>의<br /> 생물정보 정보를 검색하실 수 있습니다.</p>
							<input type="text" id="bSearchText" name="bSearchText" class="searchText" /><button onclick="searchSth(2);">생물정보 검색</button>
						</div>
					</div>

					<div class="themeHeritage">
						<div class="section">
							<p class="sectionTit theme">테마 별 생물정보 <a class="moreBtn" href="biology_theme.do">테마 전체보기 ▶</a></p>

							<div class="themeT bg1" onclick="goBiologyPage(12, '우리나라의 단풍나무');">
								<p><a href="javascript:goPage(12, '우리나라의 단풍나무');" target="_self">우리나라의 단풍나무</a></p>
								<span>단풍나무, 당단풍나무, 은단풍<br />섬단풍나무, 돌단풍…</span>
							</div>
							<div class="themeT bg2" onclick="goBiologyPage(10, '우리나라에 서식하는 잠자리');">
								<p><a href="javascript:goPage(10, '우리나라에 서식하는 잠자리');" target="_self">우리나라에 서식하는 잠자리</a></p>
								<span>고추좀잠자리, 물잠자리, 꼬마잠자리,<br />검은물잠자리, 뱀잠자리…</span>
							</div>
							<div class="themeT bg3" onclick="goBiologyPage(11, '족제비과의 동물들');">
								<p><a href="javascript:goPage(11, '족제비과의 동물들');" target="_self">족제비과의 동물들</a></p>
								<span>족제비, 오소리, 수달, 담비</span>
							</div>
						</div>
					</div>
					<!-- 생물정보 학습자료 -->
					<div class="mainStudy">
						<div class="section">
							<p class="sectionTit culture">생물정보 학습자료 <a class="moreBtn" href="biology_research.do">학습자료 전체보기 ▶</a></p>
							<div class="cultureT">
								<a href="biology_view2.do?cat=1&idx=78872"><img src="${croot}images/m/@biology1.jpg" alt=""> <span>세계문화유산 생물정보</span></a>
							</div>
							<div class="cultureT">
								<a href="biology_view2.do?cat=1&idx=79248"><img src="${croot}images/m/@biology2.jpg" alt=""> <span>물에 사는 동물의 특징</span></a>
							</div>
							<div class="cultureT">
								<a href="biology_view2.do?cat=1&idx=79246"><img src="${croot}images/m/@biology3.jpg" alt=""> <span>곤충의 한살이</span></a>
							</div>
							<div class="cultureT">
								<a href="biology_view2.do?cat=1&idx=78880"><img src="${croot}images/m/@biology4.jpg" alt=""> <span>우리땅 독도의 생태계</span></a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

	</section>
	<!--// mainWrap -->

	<!-- footer -->
	<footer id="footer">
		<h1><img src="${croot}images/m/main/logo_footer.png" alt="천재교육"></h1>
		<span>(주)천재교육</span>
		<span>대표 : 최용준</span>
		<span>주소 : 서울특별시 금천구 가산로 9길 54</span><br />
		<span>고객만족센터 : 1577-7609</span>
		<span>사업자등록번호 : 119-81-19350</span><br />
		<span>통신판매신고번호 : 제 18-439호</span>
		<span>부가통신사업신고번호 : 016712</span><br />
		<span class="copyright">COPYRIGHT ⓒ 2015 BY CHUNJAE CO.LTD ALL RIGHTS RESERVED.</span>
	</footer>
	<!-- footer -->
</section>
<!--// wrap -->
<form name="search_form" id="search_form" method="post">
	<input type="hidden" id="munitidx" name="munitidx" value="" />
	<input type="hidden" id="entryTitle" name="entryTitle" value="" />
</form>
</body>
</html>