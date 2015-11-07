package com.hyonga.dictionary.common;

import com.hyonga.dictionary.domain.CommonBasicXML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.io.StringReader;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Utility {

    /** Logger object */
    private static final Logger logger = LoggerFactory.getLogger(Utility.class);

//    private static final String CMS_URL = "http://hyonga.iptime.org:28080/CMS100Data/EntryData";
    private static final String CMS_URL = "http://open.chunjae.co.kr:7080/CMS100Data/EntryData";

    public static String addComma(String str) {
        int iStr = Integer.parseInt(str);
        DecimalFormat df = new DecimalFormat("#,###");
        return df.format(iStr);
    }

    /**
     * 문자열로 된 XML을 객체로 얻는다.
     * @param xmlStr
     * @return
     */
    public static Document convertStringToDocument(String xmlStr) {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;

        try {
            builder = factory.newDocumentBuilder();
            Document doc = builder.parse(new InputSource(new StringReader(xmlStr)));

            return doc;
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static String[] splitStringByWord(String ori, String splitter) {
        String[] arrSplittedString = ori.split(splitter);
        return arrSplittedString;
    }

    /**
     * 특정 문자를 기준으로 맨 마지막 단어를 얻음
     * @param ori
     * @param splitter
     * @return
     */
    public static String getLastWordFromString(String ori, String splitter) {
        String[] arrSplittedString = splitStringByWord(ori, ",");
        int lengthOfArr = arrSplittedString.length;

        String lastWord = "";
        if (lengthOfArr > 0) {
            lastWord = arrSplittedString[lengthOfArr - 1];
        }

        return lastWord;
    }

    /**
     * 문자열을 주어진 문자열로 나누기
     * @param ori
     * @return
     */
    public static Map<String, Object> makeRelationEntryData(String ori) {
        String[] arrSplittedString = splitStringByWord(ori, ",");
        int lengthOfArr = arrSplittedString.length;

        List<String> listRelationEntryData = new ArrayList<String>();
        for (int k=0; k<lengthOfArr; k++) {
            listRelationEntryData.add(arrSplittedString[k]);
        }

        Map<String, Object> iMap = new HashMap<String, Object>();
        iMap.put("listIdx", listRelationEntryData);
        return iMap;
    }

    /**
     * XML 문자열로부터 데이터를 얻음
     * @param xml
     * @return
     */
    public static CommonBasicXML getCommonBasicXML(String xml) {
        String bodyFirst = "";
        String bodySecond = "";
        String bodyImg = "";

        // 문자열로 된 xml을 객체로 얻음
        Document doc = Utility.convertStringToDocument(xml);
        NodeList nodeLisfOfBasic = null;
        Element elementOfBasic = null;

        // 상단설명부 얻기
        List<String> listBodySecond = new ArrayList<String>();
        if (doc != null) {
            nodeLisfOfBasic = doc.getElementsByTagName("BASIC");

            logger.debug("---->nodeListOfBasic 태그수 : " + nodeLisfOfBasic.getLength() + "<<END");

            for (int i=0; i<nodeLisfOfBasic.getLength(); i++) {
                String temp = "";

                elementOfBasic = (Element) nodeLisfOfBasic.item(i);
                NodeList nodeListOfText = elementOfBasic.getElementsByTagName("TEXT");
                Element elementOfText = (Element) nodeListOfText.item(0);
                temp = elementOfText.getFirstChild().getNodeValue();
                temp = replaceHightlight(temp);

                logger.debug("---->temp : " + temp + "<<END");
                listBodySecond.add(temp);
            }

            // 이미지 얻기
            NodeList nodeListOfImgs = doc.getElementsByTagName("IMGS");
            if (nodeListOfImgs.getLength() > 0) {
                Element elementOfImgs = (Element) nodeListOfImgs.item(0);
                NodeList nodeListOfFilename = elementOfImgs.getElementsByTagName("FILENAME");
                Element elementOfFilename = (Element) nodeListOfFilename.item(0);
                bodyImg = elementOfFilename.getFirstChild().getNodeValue();
            }
        }

        CommonBasicXML CommonBasicXML = new CommonBasicXML();
        CommonBasicXML.setBodyFirst(bodyFirst);
        CommonBasicXML.setBodySecond(listBodySecond);
        CommonBasicXML.setBodyImg(bodyImg);

        return CommonBasicXML;
    }

    /**
     * 하이라이트용 문자열 변경
     * @param ori
     * @return
     */
    public static String replaceHightlight(String ori) {
        // 변환 로직 규칙
        // 첫번째 문자열 매칭 - ^<\$  => <a href="showLayer('
        // 두번째 문자열 매칭 - #  => ','
        // 세번째 문자열 매칭 - ^  => ’);>
        // 네번째 문자열 매칭 - (\$>)  => </a>
        System.out.println("원본:" + ori + "<<END");

        // 정상동작하나 경우에 따라서 안될 수 있음
//        ori = ori.replaceAll("<\\$", "<a href=\"javascript:showLayer('");
//        ori = ori.replaceAll("#", "','");
//        ori = ori.replaceAll("\\^", "\');\">");
//        ori = ori.replaceAll("(\\$>)", "</a>");

        ori = ori.replaceAll("[$]", "");
        ori = ori.replaceAll("#", "\" value=\"/resources/images/highlight/");
        ori = ori.replaceAll("&lt;", "<a href=\"#term1pop\" class=\"termWord\" title=\"");
        ori = ori.replaceAll("\\^", "\">");
        ori = ori.replaceAll("&gt;", "</a>");
        ori = ori.replaceAll("href=\"\"", "href=\"#term1pop\"");

        System.out.println("변환본:" + ori + "<<END");
        return ori;
    }

    /**
     * 생물정보 분류 구분값 변경
     * @param ori
     * @return
     */
    public static String replaceBiologyGubun(String ori) {
        String ret = "";
        if(ori.equals("1000")) {
            ret = "기타";
        } else if(ori.equals("1034")) {
            ret = "포유류";
        } else if(ori.equals("1035")) {
            ret = "조류";
        } else if(ori.equals("1036")) {
            ret = "식물";
        } else if(ori.equals("1037")) {
            ret = "균류";
        } else if(ori.equals("1038")) {
            ret = "곤충";
        } else {
            ret = "해당없음";
        }

        return ret;
    }

    /**
     * 인덱스별 문자열 출력
     * @param munitidx
     * @return
     */
    public static String getStrMUnitIdx(String munitidx) {
        String strMUnitIdx = "";
        if (munitidx.equals("")) {
            strMUnitIdx = "전체";
        } else if (munitidx.equals("995")) {
            strMUnitIdx = "국보";
        } else if (munitidx.equals("996")) {
            strMUnitIdx = "보물";
        } else if (munitidx.equals("997")) {
            strMUnitIdx = "사적";
        } else if (munitidx.equals("998")) {
            strMUnitIdx = "중요무형문화재";
        } else if (munitidx.equals("999")) {
            strMUnitIdx = "천연기념물";
        } else if (munitidx.equals("1000")) {
            strMUnitIdx = "기타";
        }

        return strMUnitIdx;
    }

    /**
     * 검색어 변경 출력을 위한 문자열 변경
     * @param munitidx
     * @param entryTitle
     * @return
     */
    public static String getRefineEntryTitle(String munitidx, String entryTitle) {
        String refineEntryTitle = "";
        if (entryTitle.equals("") || entryTitle == "") {
            refineEntryTitle = Utility.getStrMUnitIdx(munitidx);
        } else {
            refineEntryTitle = entryTitle;
        }

        return refineEntryTitle;
    }

    /**
     * XML을 문자로 변경 
     * @param xml
     * @return
     */
    public static String parseBasicText2Html(String xml) {
        String ori = "<?xml version='1.0' encoding='UTF-8' ?><ROOT>";
        ori += xml;
        ori += "</ROOT>";

        logger.debug(ori);
        Document doc = convertStringToDocument(ori);
        NodeList nodeLisfOfBasic = null;
        Element elementOfBasic = null;
        String strRet = "";
        if (doc != null) {
            nodeLisfOfBasic = doc.getElementsByTagName("TEXT");
            int sizeOfNodeListText = nodeLisfOfBasic.getLength();
            logger.debug("---->sizeOfNodeListText:" + sizeOfNodeListText);

            for (int i=0; i<sizeOfNodeListText; i++) {
                elementOfBasic = (Element) nodeLisfOfBasic.item(i);
                strRet += "<p style=\"margin-top:-25px;\">" + elementOfBasic.getFirstChild().getNodeValue() + "</p>";
            }
        }

        strRet = replaceHightlight(strRet);

        logger.debug("---->최종 문자열 변환 : " + strRet + "<<END");
        return strRet;
    }

    /**
     * 메인 타이틀 변환
     * @param xml
     * @return
     */
    public static String parseBasicMainTitleText2Html(String xml) {
        String ori = "<?xml version='1.0' encoding='UTF-8' ?><ROOT>";
        ori += xml;
        ori += "</ROOT>";

        logger.debug(ori);
        Document doc = convertStringToDocument(ori);
        NodeList nodeLisfOfBasic = null;
        Element elementOfBasic = null;
        String strRet = "";
        if (doc != null) {
            nodeLisfOfBasic = doc.getElementsByTagName("TEXT");
            int sizeOfNodeListText = nodeLisfOfBasic.getLength();
            logger.debug("---->sizeOfNodeListText:" + sizeOfNodeListText);

            for (int i=0; i<sizeOfNodeListText; i++) {
                elementOfBasic = (Element) nodeLisfOfBasic.item(i);
                String v = "" + elementOfBasic.getFirstChild().getNodeValue();
                if (v.startsWith("http://") || v.startsWith("www")) {
                    strRet = "<p style=\"margin-top:50px;\"><strong><a href=\"javascript:winopen('" + v + "');\">" + v + "</a></strong></p>";
                } else {
                    strRet += "<p style=\"margin-top:50px;\"><strong>" + v + "</strong></p>";
                }
            }
        }

        logger.debug("---->최종 문자열 변환 : " + strRet + "<<END");
        return strRet;
    }

    /**
     * XML을 이미지로 변경
     * @param xml
     * @return
     */
    public static String parseBasicImg2Html(String xml, String taskId) {
        String ori = "<?xml version='1.0' encoding='UTF-8' ?><ROOT>";
        ori += xml;
        ori += "</ROOT>";

        logger.debug(ori);
        Document doc = convertStringToDocument(ori);
        NodeList nodeLisfOfBasic = null;
        NodeList nodeListOfCaption = null;
        NodeList nodeListOfDesc = null;
        NodeList nodeListOfLink = null;

        String strRet = "";
        if (doc != null) {
            nodeLisfOfBasic = doc.getElementsByTagName("IMG");
            nodeListOfCaption = doc.getElementsByTagName("CAPTION");
            nodeListOfDesc = doc.getElementsByTagName("DESCRIPTION");
            nodeListOfLink = doc.getElementsByTagName("LINK");
            int sizeOfNodeListText = nodeLisfOfBasic.getLength();
            logger.debug("---->sizeOfNodeListText:" + sizeOfNodeListText);

            for (int i=0; i<sizeOfNodeListText; i++) {
                Element elementOfImgs = (Element) nodeLisfOfBasic.item(i);
                Element elementOfCaption = (Element) nodeListOfCaption.item(i);
                Element elementOfDesc = (Element) nodeListOfDesc.item(i);
                Element elementOfLink = (Element) nodeListOfLink.item(i);

                NodeList nodeListOfFilename = elementOfImgs.getElementsByTagName("FILENAME");
                Element elementOfFilename = (Element) nodeListOfFilename.item(0);

                NodeList nodeListOfCaptionText = elementOfCaption.getElementsByTagName("TEXT");
                Element elementOfCaptionText = (Element) nodeListOfCaptionText.item(0);

                NodeList nodeListOfDescText = elementOfDesc.getElementsByTagName("TEXT");
                Element elementOfDescText = (Element) nodeListOfDescText.item(0);

                NodeList nodeListOfLinkText = elementOfLink.getElementsByTagName("TEXT");
                Element elementOfLinkText = (Element) nodeListOfLinkText.item(0);

//                strRet += "<figure>";
                strRet += "<figure style=\"margin-top:-25px;margin-bottom:-30px;text-align:center;\">";
                if (null != elementOfLinkText) {
                    if (elementOfLinkText.getFirstChild().getNodeValue().startsWith("http://") || elementOfLinkText.getFirstChild().getNodeValue().equals("www")) {
                        strRet += "<a href=\"javascript:winopen('" + elementOfLinkText.getFirstChild().getNodeValue() + "');\">";
                    }
                }
                strRet += "<img src=\"#CMS_URL#/#ENTRY_TASKID#/" + elementOfFilename.getFirstChild().getNodeValue() + "\">";
                if (null != elementOfLinkText) {
                    if (elementOfLinkText.getFirstChild().getNodeValue().startsWith("http://") || elementOfLinkText.getFirstChild().getNodeValue().equals("www")) {
                        strRet += "</a>";
                    }
                }
                if (null != elementOfCaptionText) {
                    if (!elementOfCaptionText.getFirstChild().getNodeValue().equals("")) {
                        String v = elementOfCaptionText.getFirstChild().getNodeValue();
                        if (!v.equals("<br>") && !v.equals("<br />") && !v.equals("<br/>")) {
                            strRet += "<p><" + elementOfCaptionText.getFirstChild().getNodeValue() + "><p />";
                        } else {
                            strRet += "<p></p>";
                        }
                    }
                }

                if (null != elementOfDescText) {
                    if (!elementOfDescText.getFirstChild().getNodeValue().equals("")) {
                        strRet += "<p style=\"margin-top:-25px;\">" + elementOfDescText.getFirstChild().getNodeValue() + "<p />";
                    }
                }
                strRet += "</figure>";
            }
        }

        strRet = strRet.replaceAll("#CMS_URL#", CMS_URL);
        strRet = strRet.replaceAll("#ENTRY_TASKID#", taskId);

        logger.debug(strRet);
        return strRet;
    }

    public static int isMobileBrowser(javax.servlet.http.HttpServletRequest request) {
        int isMobile = 0;
        String agent = request.getHeader("USER-AGENT");
        String[] mobileos = {
                "iphone", "ipod", "android", "blackberry", "windows cd",
                "nokia", "webos", "opera mini", "sonyericsson"
        };

        agent = agent.toLowerCase();
        int j = -1;
        for (int i=0; i<mobileos.length; i++) {
            j = agent.indexOf(mobileos[i]);

            if (j > -1) {
                isMobile = 1;
                break;
            }
        }

        return isMobile;
    }
}
