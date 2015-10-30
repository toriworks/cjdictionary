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
        if (doc != null) {
            nodeLisfOfBasic = doc.getElementsByTagName("BASIC");
            elementOfBasic = (Element) nodeLisfOfBasic.item(0);
            if (elementOfBasic != null) {
                NodeList nodeListOfText = elementOfBasic.getElementsByTagName("TEXT");
                Element elementOfText = (Element) nodeListOfText.item(0);
                bodyFirst = elementOfText.getFirstChild().getNodeValue();
                bodyFirst = replaceHightlight(bodyFirst);
            }

            // 하단설명부 얻기
            if (nodeLisfOfBasic.getLength() > 1) {
                Element elementOfSecondBasic = (Element) nodeLisfOfBasic.item(1);
                NodeList nodeListOfSecondText = elementOfSecondBasic.getElementsByTagName("TEXT");
                Element elementOfSecondText = (Element) nodeListOfSecondText.item(0);
                bodySecond = elementOfSecondText.getFirstChild().getNodeValue();
                bodySecond = replaceHightlight(bodySecond);
            }

            logger.debug("bodySecond is :" + bodySecond + "<<END");


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
        CommonBasicXML.setBodySecond(bodySecond);
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
        ori = ori.replaceAll("^<\\$", "<a href=\"showLayer('");
        ori = ori.replaceAll("#", "','");
        ori = ori.replaceAll("\\^", "\");");
        ori = ori.replaceAll("(\\$>)", "</a>");

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
}
