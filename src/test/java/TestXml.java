import org.junit.Test;
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

public class TestXml {

    @Test
    public void testXml() {
        String xml = "";
        xml = "<?xml version='1.0' encoding='UTF-8' ?><ROOT><BASIC><TEXT><![CDATA[잎 : 밑부분에 달린 잎은 길이 4-6㎝,나비 0.7㎜정도로서 끝이 뾰족하지만 물 위에 뜨는 잎은 긴 타원형이고 길이 2-2.7㎝,너비 0.5-1㎝로 끝이 둔하며 밑부분이 예저이다. 엽병은 길이 6-14㎜이고 탁엽은 길이 6-16mm이다.]]></TEXT><ALIGN>left</ALIGN></BASIC><BASIC><TEXT><![CDATA[꽃 : 꽃은 양성으로서 5-9월에 피며 황록색이고 화경은 길이 8-16mm이며 화수는 길이 6-9mm이고수술과 암술은 각 4개이다.]]></TEXT><ALIGN>left</ALIGN></BASIC><BASIC><TEXT><![CDATA[열매 : &lt;$수과#085.jpg^수과$&gt;는 둥글고 대가 있으며 단단한 과피에 싸여 있고 뒷면에 닭볏 모양의 돌기가 있다.]]></TEXT><ALIGN>left</ALIGN></BASIC><BASIC><TEXT><![CDATA[줄기 : 물 속에 있는 줄기는 가지가 많이 갈라져 있다.]]></TEXT><ALIGN>left</ALIGN></BASIC><BASIC><TEXT><![CDATA[뿌리 : 땅속줄기가 옆으로 길게 뻗고 마디에서 뿌리와 가지가 많이 갈라지는 수중경이 나온다.]]></TEXT><ALIGN>left</ALIGN></BASIC><BASIC><TEXT><![CDATA[생육환경 : ▶물 속에서 자란다.]]></TEXT><ALIGN>left</ALIGN></BASIC><BASIC><TEXT><![CDATA[번식방법 : ▶가을철에 &lt;$겨드랑이눈#007.jpg^겨드랑이눈$&gt;이 떨어져 물에 잠겼다가 싹이 터서 자란다.]]></TEXT><ALIGN>left</ALIGN></BASIC><BASIC><TEXT><![CDATA[특징 : ▶가을철에 2개의 가시가 달린 &lt;$겨드랑이눈#007.jpg^겨드랑이눈$&gt;이 떨어져서 물 밑에 잠겼다가 싹이 터서 자라는 특색이 있다.]]></TEXT><ALIGN>left</ALIGN></BASIC><IMAGE><CAPTION><TEXT><![CDATA[<br />]]></TEXT></CAPTION><DESCRIPTION><TEXT><![CDATA[<br />]]></TEXT></DESCRIPTION><LINK><TEXT><![CDATA[<br />]]></TEXT></LINK><IMGS><IMG><FILENAME>152_74143_163333_1.jpg</FILENAME><WIDTH></WIDTH><HEIGHT></HEIGHT></IMG></IMGS><ALIGN></ALIGN></IMAGE><IMAGE><CAPTION><TEXT><![CDATA[<br />]]></TEXT></CAPTION><DESCRIPTION><TEXT><![CDATA[<br />]]></TEXT></DESCRIPTION><LINK><TEXT><![CDATA[<br />]]></TEXT></LINK><IMGS><IMG><FILENAME>152_74143_163333_2.jpg</FILENAME><WIDTH></WIDTH><HEIGHT></HEIGHT></IMG></IMGS><ALIGN></ALIGN></IMAGE></ROOT>";

//        Document doc = convertStringToDocument(xml);
//        NodeList nodeList = doc.getElementsByTagName("BASIC");
//        int lengthOfNode = nodeList.getLength();
//        Element value = (Element) nodeList.item(0);
//        NodeList textNodeList = value.getElementsByTagName("TEXT");
//        int lengthOfNode2 = textNodeList.getLength();
//        Element textElement = (Element) textNodeList.item(0);
//        System.out.println("------>" + lengthOfNode2 + ":" + textElement.getFirstChild().getNodeValue() + "<------");
//
//        Element value2 = (Element) nodeList.item(1);
//        NodeList textNodeList2 = value2.getElementsByTagName("TEXT");
//        Element textElement2 = (Element) textNodeList2.item(0);
//        System.out.println("====>" + textElement2.getFirstChild().getNodeValue() + "<====");
//
//
//
//        // 이미지
//        NodeList nodeList3 = doc.getElementsByTagName("IMGS");
//        int lengthOfNode3 = nodeList3.getLength();
//        System.out.println("lengthOfNod3:" + lengthOfNode3);
//        Element value3 = (Element) nodeList3.item(0);
//        NodeList textNodeList3 = value3.getElementsByTagName("FILENAME");
//        Element textElement3 = (Element) textNodeList3.item(0);
//        System.out.println("####>" + textElement3.getFirstChild().getNodeValue() + "<####");

        String bodyFirst = "";
        String bodySecond = "";
        String bodyImg = "";

        Document doc = convertStringToDocument(xml);
        NodeList nodeLisfOfBasic = null;
        Element elementOfBasic = null;

        // 상단설명부 얻기
        if (doc != null) {
            nodeLisfOfBasic = doc.getElementsByTagName("BASIC");
            System.out.println("nodeListOfBasic 태그수 : " + nodeLisfOfBasic.getLength() + "<<END");

            for (int i=0; i<nodeLisfOfBasic.getLength(); i++) {
                String temp = "";

                elementOfBasic = (Element) nodeLisfOfBasic.item(i);
                NodeList nodeListOfText = elementOfBasic.getElementsByTagName("TEXT");
                Element elementOfText = (Element) nodeListOfText.item(0);
                temp = elementOfText.getFirstChild().getNodeValue();
                temp = replaceHightlight(temp);

                System.out.println("temp : " + temp + "<<END");
            }

//            elementOfBasic = (Element) nodeLisfOfBasic.item(0);
//            if (elementOfBasic != null) {
//                NodeList nodeListOfText = elementOfBasic.getElementsByTagName("TEXT");
//                Element elementOfText = (Element) nodeListOfText.item(0);
//                bodyFirst = elementOfText.getFirstChild().getNodeValue();
//                bodyFirst = replaceHightlight(bodyFirst);
//            }

            // 하단설명부 얻기
            if (nodeLisfOfBasic.getLength() > 1) {
                Element elementOfSecondBasic = (Element) nodeLisfOfBasic.item(1);
                NodeList nodeListOfSecondText = elementOfSecondBasic.getElementsByTagName("TEXT");
                Element elementOfSecondText = (Element) nodeListOfSecondText.item(0);
                bodySecond = elementOfSecondText.getFirstChild().getNodeValue();
                bodySecond = replaceHightlight(bodySecond);
            }

            System.out.println("bodySecond is :" + bodySecond + "<<END");


            // 이미지 얻기
            NodeList nodeListOfImgs = doc.getElementsByTagName("IMGS");
            if (nodeListOfImgs.getLength() > 0) {
                Element elementOfImgs = (Element) nodeListOfImgs.item(0);
                NodeList nodeListOfFilename = elementOfImgs.getElementsByTagName("FILENAME");
                Element elementOfFilename = (Element) nodeListOfFilename.item(0);
                bodyImg = elementOfFilename.getFirstChild().getNodeValue();
            }
        }


    }

    private Document convertStringToDocument(String xmlStr) {
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

    private String replaceHightlight(String ori) {
        // 변환 로직 규칙
        // 첫번째 문자열 매칭 - ^<\$  => <a href="showLayer('
        // 두번째 문자열 매칭 - #  => ','
        // 세번째 문자열 매칭 - ^  => ’);>
        // 네번째 문자열 매칭 - (\$>)  => </a>
        ori = ori.replaceAll("^<\\$", "<a href=\"javascript:showLayer('");
        ori = ori.replaceAll("#", "','");
        ori = ori.replaceAll("\\^", "\");");
        ori = ori.replaceAll("(\\$>)", "</a>");

        return ori;
    }

    @Test
    public void replaceTest() {
        //String ori = "가을철에 &lt;$겨드랑이눈#007.jpg^겨드랑이눈$&gt;이 떨어져 물에 잠겼다가 싹이 터서 자란다.";
        //String ori = "<$잎자루#038.jpg^잎자루$>";
//        String ori = "부레옥잠의 <$잎자루#038.jpg^잎자루$>를 물에 넣어보면 그 이유를 알 수 있습니다.";
//        String ori = "가을철에 2개의 가시가 달린 &lt;$겨드랑이눈#007.jpg^겨드랑이눈$&gt;이 떨어져서 물 밑에 잠겼다가 싹이 터서 자라는 특색이 있다.";
        String ori = "▶가을철에 2개의 가시가 달린 &lt;$겨드랑이눈#007.jpg^겨드랑이눈$&gt;이 떨어져서 물 밑에 잠겼다가 싹이 터서 자라는 특색이 있다.";

//        ori = ori.replaceAll("[$]", "");
//        ori = ori.replaceAll("&lt;", "<a href=\"showLayer('");
//        ori = ori.replaceAll("#", "','");
//        ori = ori.replaceAll("\\^", "\');\">");
//        ori = ori.replaceAll("&gt;", "</a>");
        //<a href="#term1pop" class="termWord" title="홍예문_팝업타이틀2" value="images/@pic02.jpg">홍예문</a>

        System.out.println(ori);

//        ori = ori.replaceAll("[$]", "");
        ori = ori.replaceAll("#", "\" value=\"/resources/images/hightlight/");
        ori = ori.replaceAll("&lt;[$]", "<a href=\"#term1pop\" class=\"termWord\" title=\"");
        ori = ori.replaceAll("\\^", "\">");
        ori = ori.replaceAll("[$]&gt;", "</a>");
        ori = ori.replaceAll("href=\"\"", "href=\"#term1pop\"");

        System.out.println(ori);
    }

    @Test
    public void parseBasicText2Html() {
        String ori = "<?xml version='1.0' encoding='UTF-8' ?><ROOT>";
        ori += "<TEXT><![CDATA[일반적 특징 : 수컷의 겨울 깃은 머리와 목 부분이 검은색이며, 녹색의 금속광택이 있다. 어깨 깃과 등은 흰색 바탕에 가는 파도 모양의 검은색 가로줄이 촘촘히 있다. 허리, 위 꼬리 덮깃은 검은색이다. 윗가슴은 검은색이며, 아랫가슴과 배는 흰색이다. 옆구리는 잿빛을 띤 흰색으로 미세한 검은 갈색의 가로줄이 촘촘히 있다. 부리는 푸르스름한 회색이며, 다리는 녹색을 띤 회색이다.]]></TEXT><ALIGN>left</ALIGN>";
        ori += "</ROOT>";

        System.out.println(ori);
        Document doc = convertStringToDocument(ori);
        NodeList nodeLisfOfBasic = null;
        Element elementOfBasic = null;
        String strRet = "";
        if (doc != null) {
            nodeLisfOfBasic = doc.getElementsByTagName("TEXT");
            int sizeOfNodeListText = nodeLisfOfBasic.getLength();
            System.out.println("sizeOfNodeListText:" + sizeOfNodeListText);

            for (int i=0; i<sizeOfNodeListText; i++) {
                elementOfBasic = (Element) nodeLisfOfBasic.item(i);
                strRet += "<p>" + elementOfBasic.getFirstChild().getNodeValue() + "</p>";
            }
        }
    }

    @Test
    public void parseBasicImg2Html() {
        String ori = "<?xml version='1.0' encoding='UTF-8' ?><ROOT>";
        ori += "<CAPTION></CAPTION><DESCRIPTION></DESCRIPTION><LINK></LINK><ALIGN>left</ALIGN><IMGS><IMG><FILENAME>139_64221_151159_1.jpg</FILENAME><WIDTH>300</WIDTH><HEIGHT></HEIGHT></IMG><IMG><FILENAME>139_64221_151159_1.jpg</FILENAME><WIDTH>300</WIDTH><HEIGHT></HEIGHT></IMG><IMG><FILENAME>139_64221_151159_1.jpg</FILENAME><WIDTH>300</WIDTH><HEIGHT></HEIGHT></IMG></IMGS>";
        ori += "</ROOT>";

        System.out.println(ori);
        Document doc = convertStringToDocument(ori);
        NodeList nodeLisfOfBasic = null;
        Element elementOfBasic = null;
        String strRet = "";
        if (doc != null) {
            nodeLisfOfBasic = doc.getElementsByTagName("IMG");
            int sizeOfNodeListText = nodeLisfOfBasic.getLength();
            System.out.println("sizeOfNodeListText:" + sizeOfNodeListText);

            for (int i=0; i<sizeOfNodeListText; i++) {
                Element elementOfImgs = (Element) nodeLisfOfBasic.item(i);
                NodeList nodeListOfFilename = elementOfImgs.getElementsByTagName("FILENAME");
                Element elementOfFilename = (Element) nodeListOfFilename.item(0);
                strRet += "<figure>#IMG_ROOT#" + elementOfFilename.getFirstChild().getNodeValue() + "</figure>";
            }
        }

        System.out.println(strRet);
    }
}
