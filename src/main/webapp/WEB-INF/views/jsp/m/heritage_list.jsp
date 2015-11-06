<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/" var="croot" />
<jsp:useBean id="utility" class="com.hyonga.dictionary.common.Utility" />
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
		goPage = function(url) {
			location.href = url;
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
			<a href="heritage_theme.do" class="page">문화유산</a>
			<a href="biology_theme.do" >생물정보</a>
			<a href="intro_page.do" >공유저작물 소개</a>
			<a href="uci_page.do" >UCI 서비스 소개</a>
		</nav>
		<div class="subNav">
			<a href="heritage_theme.do" class="focus">테마별 문화유산</a>
			<a href="heritage_research.do" >기획자료</a>
			<a href="#">문화유산 검색</a>
		</div>
		<div class="subTit">
			<figure><img src="${croot}images/m/sub/bg_menuCulture.png" alt=""></figure>
		</div>
	</header>
	<!--// header -->

	<!-- subwrap -->
	<section class="contents">
		<header>
			<h1>테마 별 문화유산</h1>
			<div class="themeTit">
				${title}
			</div>
		</header>
		<article>
			<span class="total">문화재 수 : ${list_size}개</span>

			<div class="board boardList"><!-- board -->
				<table>
					<caption>게시판 리스트</caption>
					<colgroup>
						<col style="width:10%" />
						<col style="width:*" />
						<col style="width:33%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">명칭</th>
							<th scope="col">UCI</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="i" value="0" scope="page" />
					<c:forEach var="lists" items="${data}">
						<c:set var="i" value="${i + 1}" scope="page"/>
						<tr>
							<td><c:out value="${i}" /></td>
							<td><a href="heritage_view.do?idx=${lists.idx}&title=${title}">${lists.tag}</a></td>
							<td><a href="heritage_view.do?idx=${lists.idx}&title=${title}"><c:out value="${lists.entryTitle}" /><br /><c:out value="${lists.entryTitleC}" /></a></td>
							<td><c:out value="${lists.ucicode}" /></td>
						</tr>
					</c:forEach>
					<!--
						<tr>
							<td>1</td>
							<td><a href="heritage_view.html">서울 독립문<br />(서울 獨立門)</a></td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>2</td>
							<td><a href="heritage_view.html">아우내 3.1운동 독립사적지<br />(아우내 3.1運動 獨立史蹟址)</a></td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>3</td>
							<td><a href="heritage_view.html">광주학생독립운동진원지나주역사<br />(光州學生獨立運動震源地羅州驛舍)</a></td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>4</td>
							<td><a href="heritage_view.html">독립지사김태원생가유허<br />(獨立志士金泰源生家遺墟)</a></td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>5</td>
							<td><a href="heritage_view.html">‘대한독립만세’ 태극기</a></td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>6</td>
							<td><a href="heritage_view.html">진관사 소장 태극기 및 독립신문류</a></td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>7</td>
							<td><a href="heritage_view.html">대조선독립협회회보</a></td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>8</td>
							<td><a href="heritage_view.html">독립신문</a></td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>9</td>
							<td><a href="heritage_view.html">대조선독립협회회보</a></td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>10</td>
							<td><a href="heritage_view.html">대한국독립협회지장</a></td>
							<td>I421:111-111-111</td>
						</tr>
					-->
					</tbody>
				</table>
			</div><!-- //board -->
			<!--
			<div class="paging">
				<span class="prev"><a href="#" target="_self">이전 보기</a></span>
				<a href="#" class="now" target="_self">1</a>
				<a href="#" target="_self">2</a>
				<a href="#" target="_self">3</a>
				<a href="#" target="_self">4</a>
				<a href="#" target="_self">5</a>
				<span class="next"><a href="#" target="_self">다음 보기</a></span>
			</div>
			-->
		</article>
	</section>

	<div class="btnBar"><a href="javascript:goPage('heritage_theme.do');">테마목록</a></div>
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