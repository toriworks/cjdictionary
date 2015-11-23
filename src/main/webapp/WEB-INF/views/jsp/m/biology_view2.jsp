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
	<!--Glogle Analytics-->
	<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	ga('create', 'UA-69979853-1', 'auto');
	ga('send', 'pageview');
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
			<c:set var="cat" value="${param.cat}" />
			<c:if test="${cat == 1}">
				<a href="biology_research.do" class="focus">학습자료</a>
				<a href="biology_theme.do">테마별 생물정보</a>
				<a href="biology_search.do">생물정보 검색</a>
			</c:if>
			<c:if test="${(cat == 2) or (cat == 3)}">
				<a href="biology_research.do">학습자료</a>
				<a href="biology_theme.do">테마별 생물정보</a>
				<a href="biology_search.do" class="focus">생물정보 검색</a>
			</c:if>
		</div>
		<div class="subTit">
			<figure><img src="${croot}images/sub/bg_menuBio.png" alt=""></figure>
		</div>
	</header>
	<!--// header -->

	<!-- subwrap -->
	<section class="contents">
		<article>
			<div class="textSection">
				<h2>${entry.entryTitle}<br/><br/></h2>
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
						<c:set var="i" value="0" scope="page" />
						<c:forEach var="inform" items="${informations}">
							<tr>
								<th>${inform.outlineName}</th>
								<td>${inform.outlineData}</td>
							</tr>
							<c:set var="i" value="${i + 1}" scope="page"/>
						</c:forEach>
						</tbody>
					</table>
				</div>
				</c:if>
				
				<c:if test="${list_relations != '[]'}">
				<c:if test="${list_relations != ''}">
				<!--div class="boardTb">
					<table>
						<caption>관련 생물종</caption>
						<colgroup>
							<col style="width:30%" />
							<col style="width:38%" />
							<col style="width:32%" />
						</colgroup>
						<tbody>
						<c:forEach var="data_relations" items="${list_relations}">
							<li><a href="biology_view2.do?idx=${data_relations.idx}&title=${title}"><img src="${cms_url}/${data_relations.taskidx}/${data_relations.filename}" alt=""> <span>${data_relations.entryTitle}</span></a></li>
						</c:forEach>
						</tbody>
					</table>
				</div-->
				<h3>관련 생물종</h3>
					<div class="board bioList"><!-- board -->
						<ul>
							<c:forEach var="data_relations" items="${list_relations}">
								<li><a href="biology_view2.do?cat=3&idx=${data_relations.idx}&title=${title}"><img src="${cms_url}/${data_relations.taskidx}/${data_relations.filename}" alt=""> <span>${data_relations.entryTitle}</span></a></li>
							</c:forEach>
							<!-- li><a href="biology_view.do?idx="><img src="http://www.nature.go.kr/newkfsweb/fileUpload/plants/basic/Lemnaceae/Spirodela/12005/12005_1.jpg" alt=""> <span>개구리밥</span></a></li>
                              <li><a href="#"><img src="http://www.nature.go.kr/newkfsweb/fileUpload/plants/basic/Nymphaeaceae/Nymphaea/12024/1.JPG" alt=""> <span>수련</span></a></li>
                              <li><a href="#"><img src="http://www.nature.go.kr/newkfsweb/fileUpload/plants/basic/Hydrocharitaceae/Hydrilla/12061/5.JPG" alt=""> <span>검정말</span></a></li>
                              <li><a href="#"><img src="http://www.nature.go.kr/newkfsweb/fileUpload/plants/basic/Gramineae/Phragmites/14649/1.JPG" alt=""> <span>갈대</span></a></li>
                              <li><a href="#"><img src="http://www.nature.go.kr/newkfsweb/fileUpload/plants/basic/Typhaceae/Typha/12079/1.JPG" alt=""> <span>부들</span></a></li-->
						</ul>
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
								<td><a href="biology_view2.do?cat=3&idx=${list_terms.get(j).idx}">${list_terms.get(j).entryTitle}</a></td>
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
					<!-- CC 표시 영역 -->
					<div style="margin-top:40px;margin-bottom:0px;">
						<table style="background-color:#f9f9f9;">
							<colgroup>
								<col style="width:auto;" />
								<col style="width:auto;" />
							</colgroup>
							<tbody>
								<tr>
									<td style="vertical-align:middle;"><a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank"><img alt="크리에이티브 커먼즈 라이선스" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a></th>
									<td style="padding:5px 5px 5px 5px;font-size:12px;text-align:left;line-height:15px;"><a xmlns:cc="http://creativecommons.org/ns#" href="http://open.chunjae.co.kr" property="cc:attributionName" rel="cc:attributionURL"  target="_blank">천재교육</a>에 의해 작성된 <span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">학습백과 공유저작물</span>은(는) <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">크리에이티브 커먼즈 저작자표시-비영리-동일조건변경허락 4.0 국제 라이선스</a>에 따라 이용할 수 있습니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
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
		<span>고객만족센터 : 1577-0902</span>
		<span>사업자등록번호 : 119-81-19350</span><br />
		<span>통신판매신고번호 : 제 18-439호</span>
		<span>부가통신사업신고번호 : 016712</span><br />
		<span class="copyright">COPYRIGHT ⓒ 2015 BY CHUNJAE CO.LTD  ALL RIGHTS RESERVED.</span>
	</footer>
	<!-- footer -->
</section>
<!--// wrap -->
<!---UCI 변환 통계--->
<span style="display:none;"><img src="http://uci.or.kr/${uciresult.uciCode}@N2L:1" width="0" height="0" /></span>
<!-- 용어 레이어 -->
<span id="term1pop" style="display:none;"><span class="term miniPop"><p class="miniPop_title">&nbsp;</p><figure><img src="" alt="" class="miniPop_image" width=270 height=180></figure><a class="btnX" href="#"><img src="/resources/images/common/btn_x.png" alt=""></a></span><!-- img src="${croot}images/bg_po.png" class="pointDot" --></span>

</body>
</html>