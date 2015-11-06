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
			<h1><img src="${croot}images/m/main/logo.jpg" alt="천재학습백과 공유저작물"></h1>
		</article>
		<nav>
			<a href="heritage_theme.do">문화유산</a>
			<a href="biology_theme.do">생물정보</a>
			<a href="intro_page.do">공유저작물 소개</a>
			<a href="uci_page.do">UCI 서비스 소개</a>
		</nav>
	</header>
	<!--// header -->

	<!-- mainWrap -->
	<section id="mainWrap">
		<div class="visual">
			<a href="m/heritage_theme.do" class="linkA">문화유산</a>
			<a href="m/biology_theme.do" class="linkB">생물정보</a>

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
							<input type="text" class="searchText" /><button onclick="searchSth(1);">문화유산 검색</button>
						</div>
					</div>

					<div class="themeHeritage">
						<div class="section">
							<p class="sectionTit theme">테마 별 문화유산 <a class="moreBtn" href="m/heritage_theme.do">테마 전체보기 ▶</a></p>

							<div class="themeT bg1" onclick="goHeritagePage(1, '초등학생이 꼭 알아야 할 국보 10가지');">
								<p><a href="javascript:goPage(1, '초등학생이 꼭 알아야 할 국보 10가지');">초등학생이 꼭 알아야 할 국보 10가지</a></p>
								<span>숭례문, 진흥왕 순수비, 원각사지 10층 석탑…</span>
							</div>
							<div class="themeT bg2" onclick="goHeritagePage(44, '중학교 1학년 역사교과서에 나오는 문화재');">
								<p><a href="javascript:goPage(44, '중학교 1학년 역사교과서에 나오는 문화재');">중학교 1학년 역사교과서에 나오는 문화재</a></p>
								<span>숭례문, 진흥왕 순수비, 원각사지 10층 석탑…</span>
							</div>
							<div class="themeT bg3" onclick="goHeritagePage(45, '광복 70주년 독립운동 문화유산');">
								<p><a href="javascript:goPage(45, '광복 70주년 독립운동 문화유산');">광복 70주년 독립운동 문화유산</a></p>
								<span>독립문, 독립신문, 아우내 3.1운동 독립사적지..</span>
							</div>
						</div>
					</div>
					<!-- 문화재 학습자료 -->
					<div class="mainStudy">
						<div class="section">
							<p class="sectionTit culture">문화재 학습자료 <a class="moreBtn" href="m/heritage_research.do">기획자료 전체보기 ▶</a></p>
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
								<a href="heritage_view2.do?cat=1&idx=64156"><img src="${croot}images/m/@culture3.png" alt=""> <span>오백년 역사가 잠든 조선왕릉</span></a>
							</div>
						</div>
					</div>

				</div>
				<div id="biologyBox" class="mainBox">
					<div class="section">
						<div class="heritageSearch">
							<p><strong>24,500여건</strong>의<br /> 생물정보 정보를 검색하실 수 있습니다.</p>
							<input type="text" class="searchText" /><button onclick="searchSth(2);">생물정보 검색</button>
						</div>
					</div>

					<div class="themeHeritage">
						<div class="section">
							<p class="sectionTit theme">테마 별 생물정보 <a class="moreBtn" href="m/biology_theme.do">테마 전체보기 ▶</a></p>

							<div class="themeT bg1">
								<p><a href="#" target="_self">초등학생이 꼭 알아야 할 생물정보 10가지</a></p>
								<span>숭례문, 진흥왕 순수비, 원각사지 10층 석탑…</span>
							</div>
							<div class="themeT bg2">
								<p><a href="#" target="_self">중학교 1학년 역사교과서에 나오는 생물정보</a></p>
								<span>숭례문, 진흥왕 순수비, 원각사지 10층 석탑…</span>
							</div>
							<div class="themeT bg3">
								<p><a href="#" target="_self">생물정보생물정보생물정보</a></p>
								<span>독립문, 독립신문, 아우내 3.1운동 독립사적지..</span>
							</div>
						</div>
					</div>
					<!-- 생물정보 학습자료 -->
					<div class="mainStudy">
						<div class="section">
							<p class="sectionTit culture">생물정보 학습자료 <a class="moreBtn" href="m/biology_research.do">기획자료 전체보기 ▶</a></p>
							<div class="cultureT">
								<a href="biology_view2.do?cat=1&idx=78872"><img src="${croot}images/m/@culture1.png" alt=""> <span>세계문화유산 생물정보</span></a>
							</div>
							<div class="cultureT">
								<a href="biology_view2.do?cat=1&idx=79248"><img src="${croot}images/m/@culture2.png" alt=""> <span>생물정보생물정보생물정보</span></a>
							</div>
							<div class="cultureT">
								<a href="biology_view2.do?cat=1&idx=79246"><img src="${croot}images/m/@culture3.png" alt=""> <span>생물정보생물정보</span></a>
							</div>
							<div class="cultureT">
								<a href="biology_view2.do?cat=1&idx=79246"><img src="${croot}images/m/@culture3.png" alt=""> <span>생물정보생물정보생물정보</span></a>
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

</body>
</html>