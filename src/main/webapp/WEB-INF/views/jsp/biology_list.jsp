<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/" var="croot" />
<jsp:useBean id="utility" class="com.hyonga.dictionary.common.Utility" />
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
	goPage = function(url) {
		location.href = url;
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
				<a href="heritage_theme.do" class="page"><img src="${croot}images/common/gnb_01.png" alt="문화유산" /></a>
				<a href="biology_theme.do"><img src="${croot}images/common/gnb_02.png" alt="생물정보" /></a>
				<a href="intro_page.do"><img src="${croot}images/common/gnb_03.png" alt="공유저작물 소개" /></a>
				<a href="uci_page.do"><img src="${croot}images/common/gnb_04.png" alt="UCI 서비스 소개" /></a>
			</div>
			<h2><img src="${croot}images/common/logo_uci.png" alt="UCI"></h2>
		</div>
		<div class="subNav menu2"><!-- 생물정보 // sub menu -->
			<div class="section">
				<a href="#" class="focus">테마별 생물정보</a>
				<a href="biology_research.do">학습자료</a>
				<a href="biology_search.do">생물정보 검색</a>
			</div>
		</div>
	</div>

	<div id="container">
		<div class="subTit">
			<div class="section menuBio">
				<p>테마별 생물정보</p>
				<div class="breadcrumbs"><a href="main.do">HOME</a><a href="#">문화유산</a><span>테마별 생물정보</span></div>
			</div>
		</div>
		<div class="subCnt">
			<div class="section">
				<div class="themeTit">
					<p>${title}</p>
				</div>
				<div class="sectionBoard">
					<div class="sideL"><span class="total">생물정보 수 : ${list_size}개</span></div>
					<div class="sideR"><button class="button type1" onclick="goPage('biology_theme.do');">테마목록</button></div>
				</div>

				<div class="board boardList"><!-- board -->
					<table>
						<caption>게시판 리스트</caption>
						<colgroup>
							<col style="width:10%" />
							<col style="width:30%" />
							<col style="width:*" />
							<!-- col style="width:20%" / -->
							<col style="width:22%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">분류</th>
								<th scope="col">명칭</th>
								<!-- th scope="col">소재지</th -->
								<th scope="col">UCI</th>
							</tr>
						</thead>
						<tbody>
						<c:set var="i" value="0" scope="page" />
						<c:forEach var="lists" items="${data}">
							<c:set var="i" value="${i + 1}" scope="page"/>
							<tr>
								<td><c:out value="${i}" /></td>
								<td><a href="biology_view.do?idx=${lists.idx}&title=${title}">${utility.replaceBiologyGubun(lists.munitidx)}</a></td>
								<td><a href="biology_view.do?idx=${lists.idx}&title=${title}"><c:out value="${lists.entryTitle}" /><br /><c:out value="${lists.entryTitleC}" /></a></td>
								<!-- td>서울 서대문구</td -->
								<td><c:out value="${lists.ucicode}" /></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div><!-- //board -->

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