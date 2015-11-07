<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/" var="croot" />
<jsp:useBean id="utility" class="com.hyonga.dictionary.common.Utility">
	<jsp:setProperty name="utility" property="*"/>
</jsp:useBean>
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
		searchBiology = function(p) {
			var munitidx = $("#munitidx option:selected").val();
			var entryTitle = $("#entryTitle").val();	// search keyword

			var form = document.forms[0];
			form.page.value = p;
			form.action = "/m/biology_search.do";
			form.submit();
		}

		searchBiologyImg = function() {
			var munitidx = $("#munitidx option:selected").val();
			var entryTitle = $("#entryTitle").val();	// search keyword

			var form = document.forms[0];
			form.action = "/m/biology_search_img.do";
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
			<a href="biology_research.do" >학습자료</a>
			<a href="biology_theme.do" >테마별 생물정보</a>
			<a href="biology_search.do" class="focus" >생물정보 검색</a>
		</div>
		<div class="subTit">
			<figure><img src="${croot}images/sub/bg_menuBio.png" alt=""></figure>
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
					<input type="hidden" name="page" id="page" value="1" />
					<dl>
						<dt>생물정보 검색</dt>
						<dd><select name="munitidx" id="munitidx">
							<option value="" <c:if test="${munitidx == ''}"><c:out value="selected" /></c:if>>전체</option>
							<option value="1034" <c:if test="${munitidx == '1034'}"><c:out value="selected" /></c:if>>포유류</option>
							<option value="1035" <c:if test="${munitidx == '1035'}"><c:out value="selected" /></c:if>>조류</option>
							<option value="1036" <c:if test="${munitidx == '1036'}"><c:out value="selected" /></c:if>>식물</option>
							<option value="1037" <c:if test="${munitidx == '1037'}"><c:out value="selected" /></c:if>>균류</option>
							<option value="1038" <c:if test="${munitidx == '1038'}"><c:out value="selected" /></c:if>>곤충</option>
							</select><br />
							<input type="text" class="text" id="entryTitle" name="entryTitle" value="${entryTitle}" />
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
					</form>
				<a href="javascript:searchBiology(1);" class="searhBtn">검색</a>
			</div>

			<div class="searchResultTab">
				<a href="#" class="selTab">“<c:out value="${refineEntryTitle}"/>” 검색 결과 <br />(<c:out value="${totalCount}"/>건)</a>
				<a href="javascript:searchBiologyImg();">"<c:out value="${refineEntryTitle}"/>" 관련 이미지 검색결과 <br />(<c:out value="${imgTotalCount}" />건)</a>
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
							<th scope="col">분류</th>
							<th scope="col">명칭</th>
							<th scope="col">UCI</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="i" value="${(page - 1) * 20}" scope="page" />
						<c:forEach var="lists" items="${data}">
						<c:set var="i" value="${i + 1}" scope="page"/>
						<tr>
							<td><c:out value="${i+1}" /></td>
							<td><a href="biology_view2.do?cat=2&idx=${lists.idx}">${utility.getLastWordFromString(lists.tag, ",")}</a></td>
							<td><a href="biology_view2.do?cat=2&idx=${lists.idx}"><c:out value="${lists.entryTitle}" /><br /><c:out value="${lists.entryTitleC}" /></a></td>
							<td><c:out value="${lists.ucicode}" /></td>
						</tr>
						</c:forEach>
						<!--
						<tr>
							<td>1</td>
							<td><a href="heritage_view.html">사적 제 32호</a></td>
							<td><a href="heritage_view.html">서울 독립문<br />(서울 獨立門)</a></td>
							<td>서울 서대문구</td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>2</td>
							<td><a href="heritage_view.html">국보 제 2호</a></td>
							<td><a href="heritage_view.html">아우내 3.1운동 독립사적지<br />(아우내 3.1運動 獨立史蹟址)</a></td>
							<td>충남 천안시</td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>3</td>
							<td><a href="heritage_view.html">국보 제 3호</a></td>
							<td><a href="heritage_view.html">광주학생독립운동진원지나주역사<br />(光州學生獨立運動震源地羅州驛舍)</a></td>
							<td>전남 나주시</td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>4</td>
							<td><a href="heritage_view.html">국보 제 4호</a></td>
							<td><a href="heritage_view.html">독립지사김태원생가유허<br />(獨立志士金泰源生家遺墟)</a></td>
							<td>대전 동구</td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>5</td>
							<td><a href="heritage_view.html">국보 제 5호</a></td>
							<td><a href="heritage_view.html">‘대한독립만세’ 태극기</a></td>
							<td>충남 천안시</td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>6</td>
							<td><a href="heritage_view.html">국보 제 6호</a></td>
							<td><a href="heritage_view.html">진관사 소장 태극기 및 독립신문류</a></td>
							<td>서울 은평구</td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>7</td>
							<td><a href="heritage_view.html">국보 제 7호</a></td>
							<td><a href="heritage_view.html">대조선독립협회회보</a></td>
							<td>전남 나주시</td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>8</td>
							<td><a href="heritage_view.html">국보 제 8호</a></td>
							<td><a href="heritage_view.html">독립신문</a></td>
							<td>대전 동구</td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>9</td>
							<td><a href="heritage_view.html">국보 제 9호</a></td>
							<td><a href="heritage_view.html">대조선독립협회회보</a></td>
							<td>충남 천안시</td>
							<td>I421:111-111-111</td>
						</tr>
						<tr>
							<td>10</td>
							<td><a href="heritage_view.html">국보 제 10호</a></td>
							<td><a href="heritage_view.html">대한국독립협회지장</a></td>
							<td>서울 은평구</td>
							<td>I421:111-111-111</td>
						</tr>
						-->
					</tbody>
				</table>
			</div><!-- //board -->

			<div class="paging">
				<span class="prev"><c:if test="${canPrev == 1}"><a href="javascript:searchBiology(${(curPageDiv - 2)*10 + 1})">이전 보기</a></c:if></span>
				<c:forEach begin="${(curPageDiv - 1) * 10 + 1}" end="${(curPageDiv * 10) > blockPage ? blockPage : (curPageDiv * 10)}" step="1" varStatus="pp">
					<a href="javascript:searchBiology(${pp.index});" <c:if test="${page == pp.index}">class="now"</c:if>><c:out value="${pp.index}" /></a>
				</c:forEach>
				<span class="next"><c:if test="${canNext == 1}"><a href="javascript:searchBiology(${(curPageDiv -1) * 10 + 10});">다음 보기</a></c:if></span>
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