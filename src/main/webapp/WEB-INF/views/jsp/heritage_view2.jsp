<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/" var="croot" />
<spring:url value="http://open.chunjae.co.kr:7080/CMS100Data/EntryData" var="cms_url" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /><![endif]-->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1" />
	<meta name="viewport" content="width=device-width, target-densitydpi=medium-dpi, initial-scale=0.38, maximum-scale=2, user-scalable=yes" />
	<title>천재학습백과 공유저작물</title>
	<link rel="stylesheet" href="${croot}css/common.css" type="text/css" />
	<link rel="shortcut icon" href="${croot}images/favicon.ico">
	<script type="text/javascript" src="${croot}js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${croot}js/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="${croot}js/jquery-ui-1.8.23.custom.min.js"></script>
	<script type="text/javascript" src="${croot}js/common.js"></script>
	<script type="text/javascript">
		goPage = function(url) {
//			location.href = url;
			history.back(-1);
		}

		popupUCI = function(uci) {

			var tUCI = "http://uci.or.kr/" + uci + "@N2C";
			window.open(tUCI, "UCI 정보", "width=553, height=605, toolbar=no, menubar=no, scrollbars=yes, resizable=no");
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
				<a href="heritage_research.do" class="page"><img src="${croot}images/common/gnb_01.png" alt="문화유산" /></a>
				<a href="biology_research.do"><img src="${croot}images/common/gnb_02.png" alt="생물정보" /></a>
				<a href="intro_page.do"><img src="${croot}images/common/gnb_03.png" alt="공유저작물 소개" /></a>
				<a href="uci_page.do"><img src="${croot}images/common/gnb_04.png" alt="UCI 서비스 소개" /></a>
			</div>
			<h2><img src="${croot}images/common/logo_uci.png" alt="UCI"></h2>
		</div>
		<div class="subNav"><!-- 문화유산 // sub menu -->
			<div class="section">
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
		</div>
	</div>

	<div id="container">
		<div class="subTit">
			<div class="section menuCulture">	
			<c:if test="${cat == 1}">
				<p>학습자료</p>
				<div class="breadcrumbs"><a href="main.do">HOME</a><a href="#">문화유산</a><span>학습자료</span></div>
			</c:if>
			<c:if test="${(cat == 2) or (cat == 3)}">
				<p>문화유산 검색</p>
				<div class="breadcrumbs"><a href="main.do">HOME</a><a href="#">문화유산</a><span>검색</span></div>
			</c:if>
			</div>
		</div>
		<div class="subBody">
			<div class="subBodyArea">
				<!-- 좌측 본문 -->
				<div class="textSection">
					<!-- <div class="themeTit">
						<p>광복 70주년 독립운동 문화유산</p>
					</div> -->
					<h2>${entry.entryTitle}</h2>
					<c:out value="${basic}" escapeXml="false" />
					<c:set var="referer" value="" />
					<c:if test="${cat == '1'}"><c:set var="referer" value="heritage_research.do" /></c:if>
					<c:if test="${cat == '2'}"><c:set var="referer" value="heritage_search.do" /></c:if>
					<div class="sideR"><button class="button type1" onclick="goPage('${referer}');">< BACK</button></div>
				</div>
				<!-- 우측 본문 -->
				<div class="descSection">
					<h2 class="uci"><c:out value="${uciresult.uciCode}" /> <button class="button type2" onclick="popupUCI('${uciresult.uciCode}');">Info</button></h2>
					
					<!--학습자료의 경우 개요부 표시 안함 -->
					<c:if test="${(cat == 2) or (cat == 3)}">
					<h3>개요</h3>
					<div class="boardTb">
						<table>
							<caption>개요 설명</caption>
							<colgroup>
								<col style="width:30%" />
								<col style="width:70%" />
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
									<td><a href="heritage_view2.do?cat=3&idx=${data_relations.idx}&title=${title}"><span>${data_relations.entryTitle}</span></a></td>
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
								<col style="width:50%" />
								<col style="width:50%" />
							</colgroup>
							<tbody>
							<tr>
							<c:set var="j" value="0" scope="page" />
							<c:forEach var="terms_data" items="${list_terms}">
								<td><a href="heritage_view2.do?cat=3&idx=${list_terms.get(j).idx}">${list_terms.get(j).entryTitle}</a></td>
								<c:if test="${j mod 2 eq 1}">
									</tr>
									<tr>
								</c:if>
								<c:set var="j" value="${j + 1}" scope="page"/>
							</c:forEach>
							</tbody>
						</table>
					</div>
					</c:if>
					</c:if>
					
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
	
	<!---UCI 변환 통계--->
	<span style="display:none;"><img src="http://uci.or.kr/${uciresult.uciCode}@N2L:1" width="0" height="0" /></span>
	
	<!-- 용어 레이어 -->
	<span id="term1pop" style="display:none;"><span class="term miniPop"><p class="miniPop_title">홍예문</p><figure><img src="${croot}images/@pic02.jpg" alt="" class="miniPop_image" width=270 height=180></figure><a class="btnX" href="#"><img src="/resources/images/common/btn_x.png" alt=""></a></span><img src="${croot}images/bg_po.png" class="pointDot"></span>


</div>

</body>
</html>