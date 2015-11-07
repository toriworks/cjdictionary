package com.hyonga.dictionary.common;

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

public class MUtility {

    /** Logger object */
    private static final Logger logger = LoggerFactory.getLogger(MUtility.class);

    //    private static final String CMS_URL = "http://hyonga.iptime.org:28080/CMS100Data/EntryData";
    private static final String CMS_URL = "http://open.chunjae.co.kr:7080/CMS100Data/EntryData";

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
                strRet += "<p>" + elementOfBasic.getFirstChild().getNodeValue() + "</p>";
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
                    strRet = "<p><strong><a href=\"javascript:winopen('" + v + "');\">" + v + "</a></strong></p>";
                } else {
                    strRet += "<p><strong>" + v + "</strong></p>";
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
                strRet += "<figure>";
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
                        strRet += "<p>" + elementOfDescText.getFirstChild().getNodeValue() + "<p />";
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
}
