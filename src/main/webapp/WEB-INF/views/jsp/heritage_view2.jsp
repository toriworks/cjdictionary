<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/" var="croot" />
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
				<a href="biology_view.do"><img src="${croot}images/common/gnb_02.png" alt="생물정보" /></a>
				<a href="intro_page.do"><img src="${croot}images/common/gnb_03.png" alt="공유저작물 소개" /></a>
				<a href="uci_page.do"><img src="${croot}images/common/gnb_04.png" alt="UCI 서비스 소개" /></a>
			</div>
			<h2><img src="${croot}images/common/logo_uci.png" alt="UCI"></h2>
		</div>
		<div class="subNav"><!-- 문화유산 // sub menu -->
			<div class="section">
				<a href="heritage_theme.do">테마 별 문화유산</a>
				<a href="heritage_research.do" class="focus">기획자료</a>
				<a href="heritage_search.do">문화유산 검색</a>
			</div>
		</div>
	</div>

	<div id="container">
		<div class="subTit">
			<div class="section menuCulture">
				<p>기획자료</p>
				<div class="breadcrumbs"><a href="main.do">HOME</a><a href="#">문화유산</a><span>기획자료</span></div>
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
					<p>${basic.bodyFirst}</p>
					<figure>
						<img src="${croot}images/@pic01.jpg" alt="" />
					</figure>
					<!-- p>이 건물은 세종 30년(1448)에 고쳐 지은 것인데 1961∼1963년 해체·수리 때 성종 10년 (1479)에도 큰 공사가 있었다는 사실이 밝혀졌다. 이후, 2008년 2월 10일 숭례문 방화 화재로 <a class="term" id="term2">누각</a> 2층 지붕이 붕괴되고 1층 지붕도 일부 소실되는 등 큰 피해를 입었으며, 5년 2개월에 걸친 복원공사 끝에 2013년 5월 4일 준공되어 일반에 공개되고 있다.<br />
					이 문은 돌을 높이 쌓아 만든 <a class="term" id="term3">석축</a> 가운데에 무지개 모양의 <a class="term" id="term1">홍예문</a>을 두고, 그 위에 앞면 5칸·옆면 2칸 크기로 지은 <a class="term" id="term2">누각</a>형 2층 건물이다. 지붕은 앞면에서 볼 때 사다리꼴 형태를 하고 있는데, 이러한 지붕을 우진각지붕이라 한다. 지붕 처마를 받치기 위해 기둥 위부분에 장식하여 짠 구조가 기둥 위뿐만 아니라 기둥 사이에도 있는 다포 양식으로, 그 형태가 곡이 심하지 않고 짜임도 건실해 조선 전기의 특징을 잘 보여주고 있다.<br />
					『지봉유설』의 기록에는 ‘숭례문’이라고 쓴 현판을 양녕대군이 썼다고 한다. 지어진 연대를 정확히 알 수 있는 서울 성곽 중에서 제일 오래된 목조 건축물이다.</p>
					<p><strong>숭례문 방화 화재(2008.2.10)</strong><br />
					2008년 숭례문 방화 사건(崇禮門放火事件)은 2008년 2월 10일 ~ 2월 11일 숭례문 건물이 방화로 타 무너진 사건이다. 화재는 2008년 2월 10일 오후 8시 40분 전후에 발생하여 다음날인 2008년 2월 11일 오전 0시 40분경 숭례문의 <a class="term" id="term2">누각</a> 2층 지붕이 붕괴하였고 이어 1층에도 불이 붙어 화재 5시간 만인 오전 1시 55분쯤 <a class="term" id="term3">석축</a> 을 제외한 건물이 훼손되었다.</p-->
					<p>${basic.bodySecond}</p>

					<div class="sideR"><button class="button type1">목록</button></div>
				</div>
				<!-- 우측 본문 -->
				<div class="descSection">
					<h2 class="uci"><c:out value="${uciresult.uciCode}" /> <button class="button type2">Info</button></h2>

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
									<th class="figure"><img src="${croot}images/${data_relations.filename}" alt=""></th>
									<td>${data_relations.entryTitle}</td>
									<td>${data_relations.tag}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>

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
									<td><a href="heritage_view2.do?idx=${list_terms.get(j).idx}">${list_terms.get(j).entryTitle}</a></td>
								<c:if test="${j mod 3 eq 0}">
								</tr>
								</c:if>
								<c:set var="j" value="${j + 1}" scope="page"/>
							</c:forEach>
							</tbody>
						</table>
					</div>

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

	<!-- 용어 레이어 -->
	<div id="term1pop" style="display:none;">
		<div class="term miniPop">
			<figure><img src="${croot}images/@pic02.jpg" alt=""></figure>
			<p>무지개처럼 생긴 문이라는 뜻의 홍예문은 철도 건설을 담당하고 있던 일본 공병대가  1906년 착공하여 1908년에 준공하였다.</p>
		</div>
		<img src="${croot}images/bg_po.png" class="pointDot">
	</div>

	<div id="term2pop" style="display:none;">
		<div class="term miniPop">
			<figure><img src="${croot}images/@pic03.jpg" alt=""></figure>
			<p>누각은..........누각은.........</p>
		</div>
		<img src="${croot}images/bg_po.png" class="pointDot">
	</div>

	<div id="term3pop" style="display:none;">
		<div class="term miniPop">
			<figure><img src="${croot}images/@pic03.jpg" alt=""></figure>
			<p>석축 석축석축석축 용어 설명</p>
		</div>
		<img src="${croot}images/bg_po.png" class="pointDot">
	</div>
</div>

</body>
</html>