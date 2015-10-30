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
				<a href="heritage_theme.jsp"><img src="${croot}images/common/gnb_01.png" alt="문화유산" /></a>
				<a href="biology_view.jsp" class="page"><img src="${croot}images/common/gnb_02.png" alt="생물정보" /></a>
				<a href="intro_page.jsp"><img src="${croot}images/common/gnb_03.png" alt="공유저작물 소개" /></a>
				<a href="uci_page.jsp"><img src="${croot}images/common/gnb_04.png" alt="UCI 서비스 소개" /></a>
			</div>
			<h2><img src="${croot}images/common/logo_uci.png" alt="UCI"></h2>
		</div>
		<div class="subNav menu2"><!-- 생물정보 // sub menu -->
			<div class="section">
				<a href="#">테마 별 생물정보</a>
				<a href="#">기획자료</a>
				<a href="#" class="focus">생물정보 검색</a>
			</div>
		</div>
	</div>

	<div id="container">
		<div class="subTit">
			<div class="section menuBio">
				<p>생물정보 검색</p>
				<div class="breadcrumbs"><a href="main.do">HOME</a><a href="#">생물정보</a><span>검색</span></div>
			</div>
		</div>
		<div class="subBody">
			<div class="subBodyArea">
				<!-- 좌측 본문 -->
				<div class="textSection">
					<h2>연못이나 강가에 사는 식물</h2>
					<p>연못이나 강가의 자연환경연못에는 물이 고여 있고, 강에는 물이 흐릅니다.<br />
					물 위, 물 속, 강가, 연못 주변에도 다양한 식물들이 살고 있습니다.</p>

					<p><strong>부레옥잠</strong><br />
					부레옥잠키는 25~30cm 정도까지 자라고, 잎은 둥글고 윤기가 나는 연한 녹색입니다.<br />
					8~9월에 연한 자주색 꽃이 핍니다. 열대 및 아열대 아메리카가 원산지입니다.<br />
					부레옥잠은 연못 등에서 물에 뜬 채로 자라고 어항 속에서도 잘 자랍니다.</p>

					<p><strong>Q. 왜 '부레옥잠'이라는 이름이 붙었을까?</strong><br />
					잎자루의 가운데 부분이 부풀어서 물고기의 부레(공기주머니)처럼 물에 뜨기때문에 부레옥잠이라고 합니다.<br />
					물옥잠과의 여러해살이풀입니다.</p>
					<figure>
						<img src="http://www.nature.go.kr/newkfsweb/fileUpload/plants/basic/Pontederiaceae/Eichhornia/19098/8.JPG" alt="" />
					</figure>
					<p><strong>부레옥잠의 생김새</strong><br />
					- 잎이 둥글고 반짝입니다.<br />
					- 줄기는 둥근 대 모양입니다.<br />
					- 잎자루는 주머니 모양입니다.<br />
					- 뿌리는 수염처럼 생겼습니다.</p>
					<p><strong>부레옥잠의 단면</strong><br />
					부레옥잠 잎자루를 가로로 자른 단면은 동그란 <br />
					구멍들이 붙어 있는 모양입니다. <br />
					부레옥잠 잎자루를 세로로 자른 단면은 구멍들이 줄줄이 연결되어 있는 모양입니다.</p>

					<p><strong>Q. 부레옥잠은 어떻게 물에 뜰 수 있는 걸까?</strong><br />
					부레옥잠의 잎자루를 물에 넣어보면 그 이유를 알 수 있습니다. 부레옥잠의 잎자루는 스펀지 모양이며 그 안에는 공기로 채워져 있습니다. 부레옥잠의 잎자루를 물에 넣고 손으로 누르면 공기방울이 나와 물 표면으로 올라가는 것을 확인할 수 있습니다.<br />
					부레옥잠은 잎자루에 있는 공기주머니 덕분에 물에 떠서 살기 유리한 것입니다.
					</p>

					<div class="sideR"><button class="button type1">목록</button></div>
				</div>
				<!-- 우측 본문 -->
				<div class="descSection">
					<h2 class="uci">C001-01-00001 <button class="button type2">Info</button></h2>

					<h3>관련 생물종</h3>

					<div class="board bioList"><!-- board -->
						<ul>
							<li><a href="#"><img src="http://www.nature.go.kr/newkfsweb/fileUpload/plants/basic/Potamogetonaceae/Potamogeton/12211/12211_4.JPG" alt=""> <span>가는가래</span></a></li>
							<li><a href="#"><img src="http://www.nature.go.kr/newkfsweb/fileUpload/plants/basic/Lemnaceae/Spirodela/12005/12005_1.jpg" alt=""> <span>개구리밥</span></a></li>
							<li><a href="#"><img src="http://www.nature.go.kr/newkfsweb/fileUpload/plants/basic/Nymphaeaceae/Nymphaea/12024/1.JPG" alt=""> <span>수련</span></a></li>
							<li><a href="#"><img src="http://www.nature.go.kr/newkfsweb/fileUpload/plants/basic/Hydrocharitaceae/Hydrilla/12061/5.JPG" alt=""> <span>검정말</span></a></li>
							<li><a href="#"><img src="http://www.nature.go.kr/newkfsweb/fileUpload/plants/basic/Gramineae/Phragmites/14649/1.JPG" alt=""> <span>갈대</span></a></li>
							<li><a href="#"><img src="http://www.nature.go.kr/newkfsweb/fileUpload/plants/basic/Typhaceae/Typha/12079/1.JPG" alt=""> <span>부들</span></a></li>
						</ul>
					</div>

					<h3>관련 교과</h3>
					<div class="boardTb">
						<table>
							<caption>관련 교과 설명</caption>
							<colgroup>
								<col style="width:100%" />
							</colgroup>
							<tbody>
								<tr>
									<td class="subject">초등 4-2 &gt; 과학 &gt; 1. 식물의 생활</td>
								</tr>
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
</div>

</body>
</html>