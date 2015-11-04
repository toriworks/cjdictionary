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
	searchHeritage = function(p) {
		var munitidx = $("#munitidx option:selected").val();
		var entryTitle = $("#entryTitle").val();	// search keyword

		var form = document.forms[0];
		form.page.value = p;
		form.action = "/heritage_search.do";
		form.submit();
	}

	searchHeritageImg = function() {
		var munitidx = $("#munitidx option:selected").val();
		var entryTitle = $("#entryTitle").val();	// search keyword

		var form = document.forms[0];
		form.action = "/heritage_search_img.do";
		form.submit();
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
		<div class="subNav"><!-- 문화유산 // sub menu -->
			<div class="section">
				<a href="heritage_theme.do">테마별 문화유산</a>
				<a href="heritage_research.do">학습자료</a>
				<a href="#" class="focus">문화유산 검색</a>
			</div>
		</div>
	</div>

	<div id="container">
		<div class="subTit">
			<div class="section menuCulture">
				<p>문화유산 검색</p>
				<div class="breadcrumbs"><a href="main.do">HOME</a><a href="heritage_search.do">문화유산</a><span>검색</span></div>
			</div>
		</div>
		<div class="subCnt">
			<div class="section">
				<div class="searchTit">
					<p>문화재청에서 제공하는 4,500여건의 문화유산 정보 관련 이미지를 검색하실 수 있습니다.</p>
				</div>

				<div class="searchBox">
					<form name="search_form" id="search_form" method="post">
						<input type="hidden" name="page" id="page" value="1" />
					<dl>
						<dt>문화재검색</dt>
						<dd><select name="munitidx" id="munitidx">
							<option value="" <c:if test="${munitidx == ''}"><c:out value="selected" /></c:if>>전체</option>
							<option value="995" <c:if test="${munitidx == '995'}"><c:out value="selected" /></c:if>>국보</option>
							<option value="996" <c:if test="${munitidx == '996'}"><c:out value="selected" /></c:if>>보물</option>
							<option value="997" <c:if test="${munitidx == '997'}"><c:out value="selected" /></c:if>>사적</option>
							<option value="998" <c:if test="${munitidx == '998'}"><c:out value="selected" /></c:if>>중요무형문화재</option>
							<option value="999" <c:if test="${munitidx == '999'}"><c:out value="selected" /></c:if>>천연기념물</option>
							<option value="1000" <c:if test="${munitidx == '1000'}"><c:out value="selected" /></c:if>>기타</option>
						</select>
						</dd>
						<dd class="middle"><input type="text" class="text" id="entryTitle" name="entryTitle" value="${entryTitle}" /></dd>

						<!-- dt class="nextLine">시대</dt>
						<dd><select name="" id="">
								<option value="전체">전체</option>
							</select>
						</dd>

						<dt>지역</dt>
						<dd><select name="" id="">
								<option value="전체">전체</option>
							</select>
						</dd -->
					</dl>
					</form>
					<a href="javascript:searchHeritage(1);" class="searhBtn">검색</a>
				</div>

				<div class="searchResultTab">
					<a href="#" class="selTab">“<c:out value="${refineEntryTitle}"/>” 검색 결과 (<c:out value="${totalCount}"/>건)</a>
					<a href="javascript:searchHeritageImg();">“<c:out value="${refineEntryTitle}"/>” 관련 이미지 검색결과 (<c:out value="${utility.addComma(imgTotalCount)}" />건)</a>
				</div>

				<div class="board boardList"><!-- board -->
					<table>
						<caption>게시판 리스트</caption>
						<colgroup>
							<col style="width:10%" />
							<col style="width:*" />
							<col style="width:50%" />
							<col style="width:22%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">등록</th>
								<th scope="col">명칭</th>
								<th scope="col">UCI</th>
							</tr>
						</thead>
						<tbody>
						<c:set var="i" value="${(page - 1) * 20}" scope="page" />
						<c:forEach var="lists" items="${data}">
							<c:set var="i" value="${i + 1}" scope="page"/>
							<tr>
								<td><c:out value="${i}" /></td>
								<td><a href="heritage_view2.do?cat=2&idx=${lists.idx}">${utility.getLastWordFromString(lists.tag, ",")}</a></td>
								<td><a href="heritage_view2.do?cat=2&idx=${lists.idx}"><c:out value="${lists.entryTitle}" /><br /><c:out value="${lists.entryTitleC}" /></a></td>
								<td><c:out value="${lists.ucicode}" /></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div><!-- //board -->

				<div class="paging">
					<span class="prev"><c:if test="${canPrev == 1}"><a href="javascript:searchHeritage(${(curPageDiv - 2)*10 + 1})">이전 보기</a></c:if></span>
					<c:forEach begin="${(curPageDiv - 1) * 10 + 1}" end="${(curPageDiv * 10) > blockPage ? blockPage : (curPageDiv * 10)}" step="1" varStatus="pp">
						<a href="javascript:searchHeritage(${pp.index});" <c:if test="${page == pp.index}">class="now"</c:if>><c:out value="${pp.index}" /></a>
					</c:forEach>
					<span class="next"><c:if test="${canNext == 1}"><a href="javascript:searchHeritage(${(curPageDiv -1) * 10 + 10});">다음 보기</a></c:if></span>
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