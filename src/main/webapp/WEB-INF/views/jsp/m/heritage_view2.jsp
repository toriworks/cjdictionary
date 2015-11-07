<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/" var="croot" />
<spring:url value="http://open.chunjae.co.kr:7080/CMS100Data/EntryData" var="cms_url" />
<spring:url value="/resources/images/highlight" var="pop_url" />
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
//			location.href = url;
			history.back(-1);
		}

		popupUCI = function(uci) {

			var tUCI = "http://uci.or.kr/" + uci + "@N2C";
			window.open(tUCI, "UCI 정보", "width=540, height=405, toolbar=no, menubar=no, scrollbars=no, resizable=no");
		}

		showLayer = function(a, b) {
			var caption = a;
			var img = "${pop_url}/" + b;
			$("#pop_img_src").attr("src", img);
			$("#pop_p_str").html(caption);
			$("#term1pop").show();
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
			<a href="heritage_research.do" class="page">문화유산</a>
			<a href="biology_research.do" >생물정보</a>
			<a href="intro_page.do" >공유저작물 소개</a>
			<a href="uci_page.do" >UCI 서비스 소개</a>
		</nav>
		<div class="subNav">
			<c:set var="cat" value="${param.cat}" />
			<c:if test="${cat == 1}">
				<a href="heritage_research.do" class="focus">학습자료</a>
				<a href="heritage_theme.do">테마별 문화유산</a>
				<a href="heritage_search.do">문화유산 검색</a>
			</c:if>
			<c:if test="${(cat == 2) or (cat == 3)}">
				<a href="heritage_research.do">학습자료</a>
				<a href="heritage_theme.do">테마별 문화유산</a>
				<a href="heritage_search.do" class="focus">문화유산 검색</a>
			</c:if>
		</div>
		<div class="subTit">
			<figure><img src="${croot}images/m/sub/bg_menuCulture.png" alt=""></figure>
		</div>
	</header>
	<!--// header -->

	<!-- subwrap -->
	<section class="contents">
		<header>
			<c:if test="${cat == 1}">
			<h1>학습자료</h1>
			</c:if>
			<c:if test="${(cat == 2) or (cat == 3)}">
			<h1>문화유산 검색</h1>
			</c:if>
		</header>
		<article>
			<div class="textSection">
				<h2>${entry.entryTitle}</h2>
				<c:out value="${basic}" escapeXml="false" />
			</div>

			<div class="descSection">
				<h2 class="uci"><c:out value="${uciresult.uciCode}" /> <button class="button type2" onclick="popupUCI('${uciresult.uciCode}');">Info</button></h2>
				<!--학습자료의 경우 개요부 표시 안함 -->
				<c:if test="${(cat == 2) or (cat == 3)}">
				<h3>개요</h3>
				<div class="boardTb">
					<table>
						<caption>개요 설명</caption>
						<colgroup>
							<col style="width:25%" />
							<col style="width:75%" />
						</colgroup>
						<tbody>
						<tr>
							<th>종목</th>
							<td>${informations[0].outlineData}</td>
						</tr>
						<tr>
							<th>명칭</th>
							<td>${entry.entryTitle} <c:if test="${entry.entryTitleC != ''}">(<c:out value="${entry.entryTitleC}" />)</c:if></td>
						</tr>
						<tr>
							<th>분류</th>
							<td>${informations[1].outlineData}</td>
						</tr>
						<tr>
							<th>수량/면적</th>
							<td>${informations[2].outlineData}</td>
						</tr>
						<tr>
							<th>지정(등록)일</th>
							<td>${informations[3].outlineData}</td>
						</tr>
						<tr>
							<th>소재지</th>
							<td>${informations[4].outlineData}</td>
						</tr>
						<tr>
							<th>시대</th>
							<td>${informations[5].outlineData}</td>
						</tr>
						<tr>
							<th>소유자<br /><em>(소유단체)</em></th>
							<td>${informations[6].outlineData}</td>
						</tr>
						<tr>
							<th>관리자<br /><em>(관리단체)</em></th>
							<td>${informations[7].outlineData}</td>
						</tr>
						</tbody>
					</table>
				</div>
				</c:if>

				<c:if test="${list_relations != '[]'}">
				<c:if test="${list_relations != ''}">
				<h3>관련 문화재</h3>
				<div class="boardTb">
					<table>
						<caption>관련 문화재 설명</caption>
						<colgroup>
							<col style="width:30%" />
							<col style="width:38%" />
							<col style="width:32%" />
						</colgroup>
						<tbody>
						<c:forEach var="data_relations" items="${list_relations}">
							<tr>
								<th class="figure"><a href="heritage_view2.do?cat=3&idx=${data_relations.idx}&title=${title}"><img src="${cms_url}/${data_relations.taskidx}/${data_relations.filename}" alt=""></a></th>
								<td><a href="heritage_view2.do?cat=3&idx=${data_relations.idx}&title=${title}">${data_relations.entryTitle}</a></td>
								<td>${data_relations.tag}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				</c:if>
				</c:if>

				<c:if test="${arr_chapterdata != '[]'}">
				<c:if test="${arr_chapterdata != ''}">
				<h3>관련 교과</h3>
				<div class="boardTb">
					<table>
						<caption>관련 교과 설명</caption>
						<colgroup>
							<col style="width:100%" />
						</colgroup>
						<tbody>
						<c:set var="i" value="0" scope="page" />
						<c:forEach var="data" items="${arr_chapterdata}">
							<tr>
								<td class="subject">${data}</td>
							</tr>
							<c:set var="i" value="${i + 1}" scope="page"/>
						</c:forEach>
						</tbody>
					</table>
				</div>
				</c:if>
				</c:if>

				<c:if test="${list_terms != '[]'}">
				<c:if test="${list_terms != ''}">
				<h3>용어 해설</h3>
				<div class="boardTb">
					<table>
						<caption>용어 해설</caption>
						<colgroup>
							<col style="width:33%" />
							<col style="width:33%" />
							<col style="width:33%" />
						</colgroup>
						<tbody>
						<c:set var="j" value="0" scope="page" />
						<c:forEach var="terms_data" items="${list_terms}">
							<c:if test="${j mod 3 eq 0}">
								<tr>
							</c:if>
							<td><a href="heritage_view2.do?idx=${terms_data.idx}">${terms_data.entryTitle}</a></td>
							<c:if test="${j mod 3 eq 0}">
								</tr>
							</c:if>
							<c:set var="j" value="${j + 1}" scope="page"/>
						</c:forEach>
						</tbody>
					</table>
				</div>
				</c:if>
				</c:if>

			</div>
		</article>
	</section>

	<div class="btnBar"><a href="javascript:goPage('${referer}');" >&lt; BACK</a></div>
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

<!-- 용어 레이어 -->
<span id="term1pop" style="display:none;"><span class="term miniPop"><p class="miniPop_title">홍예문</p><figure><img src="${croot}images/@pic02.jpg" alt="" class="miniPop_image" width=270 height=180></figure><a class="btnX" href="#"><img src="/resources/images/common/btn_x.png" alt=""></a></span><img src="${croot}images/bg_po.png" class="pointDot"></span>

</body>
</html>