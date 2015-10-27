package com.hyonga.dictionary.web;

import com.hyonga.dictionary.domain.HeritageSearchBasic;
import com.hyonga.dictionary.common.Utility;
import com.hyonga.dictionary.domain.*;
import com.hyonga.dictionary.service.IHeritageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class HeritageController {

    /** Logger object */
    private final Logger logger = LoggerFactory.getLogger(HeritageController.class);

    /** Serivce object */
    @Autowired
    private IHeritageService iHeritageService;

    @RequestMapping(value = "/heritage_theme.do", method = RequestMethod.GET)
    public String heritageThemePage(Map<String, Object> model) {
        logger.debug("heritageThemePage() is executed!");

        return "heritage_theme";
    }

    /**
     * 문화유산 검색 입력 페이지
     * @param model
     * @return
     */
    @RequestMapping(value = "/heritage_search.do", method = RequestMethod.GET)
    public String heritageSearchPage(Map<String, Object> model) {
        logger.debug("heritageSearchPage() is executed!");

        return "heritage_search";
    }

    /**
     * 문화유산 검색 처리
     * @param model
     * @return
     */
    @RequestMapping(value = "/heritage_search.do", method = RequestMethod.POST)
    public ModelAndView heritageSearchResult(@ModelAttribute HeritageSearchCondition model) {
        logger.debug("heritageSearchResult() is executed!");
        logger.debug("파라미터 : " + model.toString() + "<<END");

        List<HeritageSearchResult> lists = iHeritageService.listHeritageSearchResult(model);
        int countOfLists = lists.size();
        logger.debug("listHeritageSearchResult size : " + countOfLists + "<<END");

        ModelAndView mav = new ModelAndView();
        mav.addObject("munitidx", model.getMunitidx());
        mav.addObject("strMUnitIdx", this.getStrMUnitIdx(model.getMunitidx()));
        mav.addObject("entryTitle", model.getEntryTitle());
        mav.addObject("refineEntryTitle", this.getRefineEntryTitle(model.getMunitidx(), model.getEntryTitle()));
        mav.addObject("data", lists);
        mav.addObject("totalCount", Utility.addComma("0" + countOfLists));
        mav.setViewName("heritage_search_result");

        return mav;
    }

    /**
     * 문화유산 기획자료
     * @param model
     * @return
     */
    @RequestMapping(value = "/heritage_research.do", method = RequestMethod.GET)
    public String heritageResearchPage(Map<String, Object> model) {
        logger.debug("heritageResearchPage() is executed!");
        return "heritage_research";
    }

    /**
     * 문화유산 테마별 자료 상세 페이지
     * @param idx
     * @return
     */
    @RequestMapping(value = "/heritage_view.do", method = RequestMethod.GET)
    public ModelAndView heritageResearchDetail(String idx) {
        logger.debug("heritageResearchDetail() is executed!");
        ModelAndView mav = new ModelAndView();

        // TODO :

        mav.setViewName("heritage_view");
        return mav;
    }

    /**
     * 문화유산 기획자료 상세 페이지
     * @param idx
     * @return
     */
    @RequestMapping(value = "/heritage_view2.do", method = RequestMethod.GET)
    public ModelAndView heritageResearchDetail2(String idx) {
        logger.debug("heritageResearchDetail2() is executed!");
        ModelAndView mav = new ModelAndView();

        logger.debug("문화유산 기획자료 파라미터 idx : " + idx + "<<END");


        /////////////////////////////////////////////////////////////////////////////////////////
        // 엔트리 기본정보
        List<HeritageSearchBasic> listHeritageSearchBasic = iHeritageService.listHeritageSearchBasic(idx);
        String basicIndexContent = "";
        String basicTag = "";
        for (int o=0; o<listHeritageSearchBasic.size(); o++) {
            String tempData = listHeritageSearchBasic.get(o).getRecType();
            tempData = tempData.toUpperCase();

            if (tempData.equals("INDEXCONTENT")) {
                basicIndexContent = "<?xml version='1.0' encoding='UTF-8' ?><ROOT>" + listHeritageSearchBasic.get(o).getContent() + "</ROOT>";
            } else {
                basicTag =  listHeritageSearchBasic.get(o).getContent();;
            }
        }

        HeritageBasicXML heritageBasicXML = this.getHeritageBasicXML(basicIndexContent);
        mav.addObject("basic", heritageBasicXML);
        //
        logger.debug(heritageBasicXML.toString());
        logger.debug(basicTag);

        /////////////////////////////////////////////////////////////////////////////////////////
        // 엔트리 기본정보 추가
        HeritageSearchEntry heritageSearchEntry = iHeritageService.getHeritageSearchEntry(idx);
        String entryTag = heritageSearchEntry.getTag();
        entryTag = this.getLastWordFromString(entryTag, ",");
        heritageSearchEntry.setTag(entryTag);
        //
        mav.addObject("entry", heritageSearchEntry);

        /////////////////////////////////////////////////////////////////////////////////////////
        // 엔트리 부가정보
        HeritageSearchEntryUCIResult heritageSearchEntryUCIResult = iHeritageService.getHeritageSearchEntryUCIResult(idx);
        if (null != heritageSearchEntryUCIResult) {
            // UCI 코드얻기
            mav.addObject("uciresult", heritageSearchEntryUCIResult);

            // 개요 얻기
            List<Object> listInformations = iHeritageService.listHeritageSearchInformations(idx);
            mav.addObject("informations", listInformations);

            // 관련 문화재 얻기
            String relationEntryData = heritageSearchEntryUCIResult.getRelationEntryData();
            List<HeritageSearchRelations> listsHeritageSearchRelation = iHeritageService.listHeritageSearchRelations(this.makeRelationEntryData(relationEntryData));
            //
            // 태그가공
            List<String> listTags = new ArrayList<String>();
            for (int k=0; k<listsHeritageSearchRelation.size(); k++) {
                HeritageSearchRelations tempHeritageSearchRelations = listsHeritageSearchRelation.get(k);
                String tempTags = tempHeritageSearchRelations.getTag();
                tempTags = this.getLastWordFromString(tempTags, ",");

                tempHeritageSearchRelations.setTag(tempTags);
            }
            //
            mav.addObject("list_relations", listsHeritageSearchRelation);

            // 관련 교과 얻기
            mav.addObject("arr_chapterdata", this.splitStringByWord(heritageSearchEntryUCIResult.getChapterData(), ","));

            // 용어해설 얻기
            String termsData = heritageSearchEntryUCIResult.getTermsData();
            List<HeritageSearchRelations> listsHeritageTermsData = iHeritageService.listHeritageSearchRelations(this.makeRelationEntryData(termsData));
            //
            mav.addObject("list_terms", listsHeritageTermsData);

        } else {
            logger.debug("문화유산 기획자료 - heritageSearchEntryUCIResult is null");
        }

        mav.setViewName("heritage_view2");
        return mav;
    }

    @RequestMapping(value = "/heritage_list.do", method = RequestMethod.GET)
    public String heritageListPage(Map<String, Object> model) {
        logger.debug("heritageListPage() is executed!");

        return "heritage_list";
    }


    /**
     * 검색어 변경 출력을 위한 문자열 변경
     * @param munitidx
     * @param entryTitle
     * @return
     */
    private String getRefineEntryTitle(String munitidx, String entryTitle) {
        String refineEntryTitle = "";
        if (entryTitle.equals("") || entryTitle == "") {
            refineEntryTitle = this.getStrMUnitIdx(munitidx);
        } else {
            refineEntryTitle = entryTitle;
        }

        logger.debug("새로 지정된 값 : " + refineEntryTitle);
        return refineEntryTitle;
    }

    /**
     * 인덱스별 문자열 출력
     * @param munitidx
     * @return
     */
    private String getStrMUnitIdx(String munitidx) {
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
     * 문자열을 주어진 문자열로 나누기
     * @param ori
     * @param splitter
     * @return
     */
    private String[] splitStringByWord(String ori, String splitter) {
        String[] arrSplittedString = ori.split(splitter);
        return arrSplittedString;
    }

    private Map<String, Object> makeRelationEntryData(String ori) {
        String[] arrSplittedString = this.splitStringByWord(ori, ",");
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
     * 특정 문자를 기준으로 맨 마지막 단어를 얻음
     * @param ori
     * @param splitter
     * @return
     */
    private String getLastWordFromString(String ori, String splitter) {
        String[] arrSplittedString = this.splitStringByWord(ori, ",");
        int lengthOfArr = arrSplittedString.length;

        String lastWord = "";
        if (lengthOfArr > 0) {
            lastWord = arrSplittedString[lengthOfArr - 1];
        }

        return lastWord;
    }

    /**
     * XML 문자열로부터 데이터를 얻음
     * @param xml
     * @return
     */
    private HeritageBasicXML getHeritageBasicXML(String xml) {
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
                //
                logger.debug("bodyFirst : " + bodyFirst);
            }

            // 하단설명부 얻기
            if (nodeLisfOfBasic.getLength() > 1) {
                Element elementOfSecondBasic = (Element) nodeLisfOfBasic.item(1);
                NodeList nodeListOfSecondText = elementOfSecondBasic.getElementsByTagName("TEXT");
                Element elementOfSecondText = (Element) nodeListOfSecondText.item(0);
                bodySecond = elementOfSecondText.getFirstChild().getNodeValue();
                //
                logger.debug("bodySecond : " + bodySecond);
            }

            // 이미지 얻기
            NodeList nodeListOfImgs = doc.getElementsByTagName("IMGS");
            if (nodeListOfImgs.getLength() > 0) {
                Element elementOfImgs = (Element) nodeListOfImgs.item(0);
                NodeList nodeListOfFilename = elementOfImgs.getElementsByTagName("FILENAME");
                Element elementOfFilename = (Element) nodeListOfFilename.item(0);
                bodyImg = elementOfFilename.getFirstChild().getNodeValue();
                //
                logger.debug("bodyImg : " + bodyImg);
            }
        }

        HeritageBasicXML heritageBasicXML = new HeritageBasicXML();
        heritageBasicXML.setBodyFirst(bodyFirst);
        heritageBasicXML.setBodySecond(bodySecond);
        heritageBasicXML.setBodyImg(bodyImg);

        return heritageBasicXML;
    }
}
