package com.hyonga.dictionary.common;

import com.hyonga.dictionary.domain.HeritageBasicXML;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.io.StringReader;
import java.text.DecimalFormat;

public class Utility {

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
}
