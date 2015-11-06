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
		goPage = function(binderIdx, title) {
			location.href = "biology_list.do?binderIdx=" + binderIdx + "&title=" + title;
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
			<a href="biology_theme.do" class="page">생물정보</a>
			<a href="intro_page.do">공유저작물 소개</a>
			<a href="uci_page.do">UCI 서비스 소개</a>
		</nav>
		<div class="subNav">
			<a href="#" class="focus">테마별 생물정보</a>
			<a href="biology_research.do">학습자료</a>
			<a href="biology_search.do">생물정보 검색</a>
		</div>
		<div class="subTit">
			<figure><img src="${croot}images/m/sub/bg_menuCulture.png" alt=""></figure>
		</div>
	</header>
	<!--// header -->

	<!-- subwrap -->
	<section class="contents">
		<header>
			<h1>테마 별 생물정보</h1>
		</header>
		<article>
			<div class="sorting">
				<!--
				<div><span>학교구분</span>
					<select name="" id="">
						<option value="">전체</option>
						<option value="">전체</option>
						<option value="">전체</option>
						<option value="">전체</option>
						<option value="">전체</option>
					</select>
				</div>

				<div><span>정렬</span>
					<select class="part3" name="" id="">
						<option value="">이름</option>
						<option value="">이름</option>
						<option value="">이름</option>
					</select>
					<select class="part3" name="" id="">
						<option value="">조회수</option>
						<option value="">조회수</option>
						<option value="">조회수</option>
					</select>
					<select class="part3" name="" id="">
						<option value="">등록일</option>
						<option value="">등록일</option>
						<option value="">등록일</option>
					</select>
				</div>
				-->
			</div>

			<ul class="themeT">
				<li>
					<a href="javascript:goPage(48, '생물정보 테마48');"><p>생물정보 테마48</p></a>
					<span>숭례문, 진흥왕 순수비, 원각사지 10층 석탑…</span></a>
				</li>
				<li>
					<a href="javascript:goPage(49, '생물정보 테마49');"><p>생물정보 테마49</p></a>
					<span>숭례문, 진흥왕 순수비, 원각사지 10층 석탑…</span></a>
				</li>
				<li>
					<a href="javascript:goPage(1, '생물정보 테마1');"><p>생물정보 테마1</p></a>
					<span>독립문, 독립신문, 아우내 3.1운동 독립사적지..</span></a>
				</li>
				<li>
					<a href="javascript:goPage(1, '생물정보 테마1');"><p>생물정보 테마1</p></a>
					<span>숭례문, 진흥왕 순수비, 원각사지 10층 석탑…</span></a>
				</li>
				<li>
					<a href="javascript:goPage(1, '생물정보 테마1');"><p>생물정보 테마1</p></a>
					<span>숭례문, 진흥왕 순수비, 원각사지 10층 석탑…</span></a>
				</li>
				<li>
					<a href="javascript:goPage(1, '생물정보 테마1');"><p>생물정보 테마1</p></a>
					<span>독립문, 독립신문, 아우내 3.1운동 독립사적지..</span></a>
				</li>
				<li>
					<a href="javascript:goPage(1, '생물정보 테마1');"><p>생물정보 테마1</p></a>
					<span>숭례문, 진흥왕 순수비, 원각사지 10층 석탑…</span></a>
				</li>
				<li>
					<a href="javascript:goPage(1, '생물정보 테마1');"><p>생물정보 테마1</p></a>
					<span>숭례문, 진흥왕 순수비, 원각사지 10층 석탑…</span></a>
				</li>
				<li>
					<a href="javascript:goPage(1, '생물정보 테마1');"><p>생물정보 테마1</p></a>
					<span>독립문, 독립신문, 아우내 3.1운동 독립사적지..</span></a>
				</li>
			</ul>
			<!--
			<div class="paging">
				<span class="prev"><a href="#" >이전 보기</a></span>
				<a href="#" class="now" >1</a>
				<a href="#" >2</a>
				<a href="#" >3</a>
				<a href="#" >4</a>
				<a href="#" >5</a>
				<span class="next"><a href="#" >다음 보기</a></span>
			</div>
			-->
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