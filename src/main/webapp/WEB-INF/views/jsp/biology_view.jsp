<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/" var="croot" />
<spring:url value="http://hyonga.iptime.org:28080/CMS100Data/EntryData" var="cms_url" />
<spring:url value="/resources/images/highlight" var="pop_url" />
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
//      location.href = url;
      history.back(-1);
    }

    popupUCI = function(uci) {

      var tUCI = "http://uci.or.kr/I421:" + uci + "@N2C";
      window.open(tUCI, "UCI 정보", "width=540, height=405, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
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
        <a href="heritage_theme.do"><img src="${croot}images/common/gnb_01.png" alt="문화유산" /></a>
        <a href="biology_theme.do" class="page"><img src="${croot}images/common/gnb_02.png" alt="생물정보" /></a>
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
        <p>생물정보 검색</p>
        <div class="breadcrumbs"><a href="main.do">HOME</a><a href="#">생물정보</a><span>검색</span></div>
      </div>
    </div>
    <div class="subBody">
      <div class="subBodyArea">
        <!-- 좌측 본문 -->
        <div class="textSection">
          <h2>${entry.entryTitle}</h2>
          <c:out value="${basic}" escapeXml="false" />
          <c:set var="referer" value="" />
          <c:if test="${cat == '1'}"><c:set var="referer" value="biology_research.do" /></c:if>
          <c:if test="${cat == '2'}"><c:set var="referer" value="biology_search.do" /></c:if>
          <div class="sideR"><button class="button type1" onclick="goPage('${referer}');">목록</button></div>
        </div>
        <!-- 우측 본문 -->
        <div class="descSection">
          <h2 class="uci"><c:out value="${uciresult.uciCode}" /> <button class="button type2" onclick="popupUCI('${uciresult.uciCode}');">Info</button></h2>

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
                <th>${informations[0].outlineName}</th>
                <td>${informations[0].outlineData}</td>
              </tr>
              <tr>
                <th>${informations[1].outlineName}</th>
                <td>${informations[1].outlineData}</td>
              </tr>
              <tr>
                <th>${informations[2].outlineName}</th>
                <td>${informations[2].outlineData}</td>
              </tr>
              </tbody>
            </table>
          </div>

          <h3>관련 생물종</h3>
          <div class="board bioList"><!-- board -->
            <ul>
              <c:forEach var="data_relations" items="${list_relations}">
              <li><a href="biology_view.do?idx=${data_relations.idx}&title=${title}"><img src="${croot}images/${data_relations.filename}" alt=""> <span>${data_relations.entryTitle}</span></a></li>
              </c:forEach>
              <!-- li><a href="biology_view.do?idx="><img src="http://www.nature.go.kr/newkfsweb/fileUpload/plants/basic/Lemnaceae/Spirodela/12005/12005_1.jpg" alt=""> <span>개구리밥</span></a></li>
              <li><a href="#"><img src="http://www.nature.go.kr/newkfsweb/fileUpload/plants/basic/Nymphaeaceae/Nymphaea/12024/1.JPG" alt=""> <span>수련</span></a></li>
              <li><a href="#"><img src="http://www.nature.go.kr/newkfsweb/fileUpload/plants/basic/Hydrocharitaceae/Hydrilla/12061/5.JPG" alt=""> <span>검정말</span></a></li>
              <li><a href="#"><img src="http://www.nature.go.kr/newkfsweb/fileUpload/plants/basic/Gramineae/Phragmites/14649/1.JPG" alt=""> <span>갈대</span></a></li>
              <li><a href="#"><img src="http://www.nature.go.kr/newkfsweb/fileUpload/plants/basic/Typhaceae/Typha/12079/1.JPG" alt=""> <span>부들</span></a></li-->
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

<!-- 용어 레이어 -->
<span id="term1pop" style="display:block;"><span class="term miniPop"><p class="miniPop_title">홍예문</p><figure><img src="${croot}images/@pic02.jpg" alt="" class="miniPop_image" width=270 height=180></figure><a class="btnX" href="#"><img src="/resources/images/common/btn_x.png" alt=""></a></span><img src="${croot}images/bg_po.png" class="pointDot"></span>

</body>
</html>