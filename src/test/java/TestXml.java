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
        String xml = "<?xml version='1.0' encoding='UTF-8' ?><ROOT><BASIC><TEXT><![CDATA[조선시대 서울도성을 둘러싸고 있던 성곽의 정문으로 원래 이름은 숭례문이며, 남쪽에 있다고 해서 남대문이라고도 불렀다. 현재 서울에 남아 있는 목조 건물 중 가장 오래된 것으로 태조 5년(1396)에 짓기 시작하여 태조 7년(1398)에 완성하였다.<br /><br />]]></TEXT></BASIC>";
        xml = xml + "<IMAGE><CAPTION><TEXT><![CDATA[<br />]]></TEXT></CAPTION><DESCRIPTION><TEXT><![CDATA[<br />]]></TEXT></DESCRIPTION><LINK><TEXT><![CDATA[<br />]]></TEXT></LINK><IMGS><IMG><FILENAME>81_57412_235126_2.jpg</FILENAME><WIDTH>300</WIDTH><HEIGHT></HEIGHT></IMG></IMGS></IMAGE><BASIC><TEXT><![CDATA[이 건물은 세종 30년(1448)에 고쳐 지은 것인데 1961∼1963년 해체·수리 때 성종 10년(1479)에도 큰 공사가 있었다는 사실이 밝혀졌다. 이후, 2008년 2월 10일 숭례문 방화 화재로 누각 2층 지붕이 붕괴되고 1층 지붕도 일부 소실되는 등 큰 피해를 입었으며, 5년 2개월에 걸친 복원공사 끝에 2013년 5월 4일 준공되어 일반에 공개되고 있다.<br /><br />이 문은 돌을 높이 쌓아 만든 석축 가운데에 무지개 모양의 홍예문을 두고, 그 위에 앞면 5칸·옆면 2칸 크기로 지은 누각형 2층 건물이다. 지붕은 앞면에서 볼 때 사다리꼴 형태를 하고 있는데, 이러한 지붕을 우진각지붕이라 한다. 지붕 처마를 받치기 위해 기둥 위부분에 장식하여 짠 구조가 기둥 위뿐만 아니라 기둥 사이에도 있는 다포 양식으로, 그 형태가 곡이 심하지 않고 짜임도 건실해 조선 전기의 특징을 잘 보여주고 있다.<br /><br />『지봉유설』의 기록에는 ‘숭례문’이라고 쓴 현판을 양녕대군이 썼다고 한다. 지어진 연대를 정확히 알 수 있는 서울 성곽 중에서 제일 오래된 목조 건축물이다.<br /><br />ㅇ 숭례문 방화 화재(2008.2.10)<br />- 2008년 숭례문 방화 사건(崇禮門放火事件)은 2008년 2월 10일 ~ 2월 11일 숭례문 건물이 방화로 타 무너진 사건이다. 화재는 2008년 2월 10일 오후 8시 40분 전후에 발생하여 다음날인 2008년 2월 11일 오전 0시 40분경 숭례문의 누각 2층 지붕이 붕괴하였고 이어 1층에도 불이 붙어 화재 5시간 만인 오전 1시 55분쯤 석축을 제외한 건물이 훼손되었다.]]></TEXT></BASIC><IMAGE><CAPTION><TEXT><![CDATA[서울숭례문 1,2층 추녀]]></TEXT></CAPTION><DESCRIPTION><TEXT><![CDATA[<br />]]></TEXT></DESCRIPTION><LINK><TEXT><![CDATA[<br />]]></TEXT></LINK><IMGS><IMG><FILENAME>81_57412_235126_3.jpg</FILENAME><WIDTH>300</WIDTH><HEIGHT></HEIGHT></IMG></IMGS></IMAGE><IMAGE><CAPTION><TEXT><![CDATA[서울숭례문 1층 내부 귀공포]]></TEXT></CAPTION><DESCRIPTION><TEXT><![CDATA[<br />]]></TEXT></DESCRIPTION><LINK><TEXT><![CDATA[<br />]]></TEXT></LINK><IMGS><IMG><FILENAME>81_57412_235126_4.jpg</FILENAME><WIDTH>300</WIDTH><HEIGHT></HEIGHT></IMG></IMGS></IMAGE><IMAGE><CAPTION><TEXT><![CDATA[서울숭례문(현판)]]></TEXT></CAPTION><DESCRIPTION><TEXT><![CDATA[<br />]]></TEXT></DESCRIPTION><LINK><TEXT><![CDATA[<br />]]></TEXT></LINK><IMGS><IMG><FILENAME>81_57412_235126_8.jpg</FILENAME><WIDTH>300</WIDTH><HEIGHT></HEIGHT></IMG></IMGS></IMAGE><IMAGE><CAPTION><TEXT><![CDATA[서울숭례문(측면단층)]]></TEXT></CAPTION><DESCRIPTION><TEXT><![CDATA[<br />]]></TEXT></DESCRIPTION><LINK><TEXT><![CDATA[<br />]]></TEXT></LINK><IMGS><IMG><FILENAME>81_57412_235126_7.jpg</FILENAME><WIDTH>300</WIDTH><HEIGHT></HEIGHT></IMG></IMGS></IMAGE><IMAGE><CAPTION><TEXT><![CDATA[숭례문 화재 현장 001]]></TEXT></CAPTION><DESCRIPTION><TEXT><![CDATA[<br />]]></TEXT></DESCRIPTION><LINK><TEXT><![CDATA[<br />]]></TEXT></LINK><IMGS><IMG><FILENAME>81_57412_235126_9.jpg</FILENAME><WIDTH>300</WIDTH><HEIGHT></HEIGHT></IMG></IMGS></IMAGE><IMAGE><CAPTION><TEXT><![CDATA[숭례문 복구 기념식]]></TEXT></CAPTION><DESCRIPTION><TEXT><![CDATA[<br />]]></TEXT></DESCRIPTION><LINK><TEXT><![CDATA[<br />]]></TEXT></LINK><IMGS><IMG><FILENAME>81_57412_235126_1.jpg</FILENAME><WIDTH>300</WIDTH><HEIGHT></HEIGHT></IMG></IMGS></IMAGE>";

        xml = xml + "</ROOT>";

        Document doc = convertStringToDocument(xml);
        NodeList nodeList = doc.getElementsByTagName("BASIC");
        int lengthOfNode = nodeList.getLength();
        Element value = (Element) nodeList.item(0);
        NodeList textNodeList = value.getElementsByTagName("TEXT");
        int lengthOfNode2 = textNodeList.getLength();
        Element textElement = (Element) textNodeList.item(0);
        System.out.println("------>" + lengthOfNode2 + ":" + textElement.getFirstChild().getNodeValue() + "<------");

        Element value2 = (Element) nodeList.item(1);
        NodeList textNodeList2 = value2.getElementsByTagName("TEXT");
        Element textElement2 = (Element) textNodeList2.item(0);
        System.out.println("====>" + textElement2.getFirstChild().getNodeValue() + "<====");



        // 이미지
        NodeList nodeList3 = doc.getElementsByTagName("IMGS");
        int lengthOfNode3 = nodeList3.getLength();
        System.out.println("lengthOfNod3:" + lengthOfNode3);
        Element value3 = (Element) nodeList3.item(0);
        NodeList textNodeList3 = value3.getElementsByTagName("FILENAME");
        Element textElement3 = (Element) textNodeList3.item(0);
        System.out.println("####>" + textElement3.getFirstChild().getNodeValue() + "<####");




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
}
