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
		searchBiology = function() {
			var munitidx = $("#munitidx option:selected").val();
			var entryTitle = $("#entryTitle").val();	// search keyword

			var form = $("#search_form");
			form.action = "/m/biology_search.do";
			form.submit();
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
			<a href="biology_research.do" class="page">생물정보</a>
			<a href="intro_page.do" >공유저작물 소개</a>
			<a href="uci_page.do" >UCI 서비스 소개</a>
		</nav>
		<div class="subNav">
			<a href="biology_research.do">학습자료</a>
			<a href="biology_theme.do">테마별 생물정보</a>
			<a href="biology_search.do" class="focus">생물정보 검색</a>
		</div>
		<div class="subTit">
			<figure><img src="${croot}images/m/sub/bg_menuBio.png" alt=""></figure>
		</div>
	</header>
	<!--// header -->

	<!-- subwrap -->
	<section class="contents">
		<header>
			<h1>생물정보 검색</h1>
		</header>
		<article>

			<div class="searchBox">
				<form name="search_form" id="search_form" method="post">
				<dl>
					<dt>생물정보 검색</dt>
					<dd>
						<select name="munitidx" id="munitidx">
							<option value="">전체</option>
							<option value="1034">포유류</option>
							<option value="1035">조류</option>
							<option value="1036">식물</option>
							<option value="1037">균류</option>
							<option value="1038">곤충</option>
						</select>
						</select><br />
						<input type="text" class="text" id="entryTitle" name="entryTitle" />
					</dd>

					<!--
					<dt>시대</dt>
					<dd><select name="" id="">
							<option value="전체">전체</option>
							<option value="시대">시대</option>
							<option value="시대">시대</option>
							<option value="시대">시대</option>
							<option value="시대">시대</option>
						</select>
					</dd>

					<dt>지역</dt>
					<dd><select name="" id="">
							<option value="전체">전체</option>
							<option value="지역">지역</option>
							<option value="지역">지역</option>
							<option value="지역">지역</option>
							<option value="지역">지역</option>
						</select>
					</dd>
					-->
				</dl>
				<a href="javascript:searchBiology();" class="searhBtn">검색</a>
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
</html>