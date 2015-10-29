package com.hyonga.dictionary.web;

import com.hyonga.dictionary.common.Utility;
import com.hyonga.dictionary.domain.*;
import com.hyonga.dictionary.service.IHeritageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class BiologyController {

    /** Logger object */
    private final Logger logger = LoggerFactory.getLogger(BiologyController.class);

    /** Serivce object */
    @Autowired
    private IHeritageService iHeritageService;

    @RequestMapping(value = "/biology_theme.do", method = RequestMethod.GET)
    public String biologyThemePage(Map<String, Object> model) {
        logger.debug("biologyThemePage() is executed!");

        return "biology_theme";
    }

    /**
     * 생물정보 학습자료 상세 페이지
     * @param idx
     * @return
     */
    @RequestMapping(value = "/biology_view.do", method = RequestMethod.GET)
    public ModelAndView biologyResearchDetail2(String idx) {
        logger.debug("biologyResearchDetail2() is executed!");
        ModelAndView mav = new ModelAndView();

        logger.debug("생물정보 기획자료 파라미터 idx : " + idx + "<<END");


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

        CommonBasicXML commonBasicXML = Utility.getCommonBasicXML(basicIndexContent);
        mav.addObject("basic", commonBasicXML);
        //
        logger.debug(commonBasicXML.toString());
        logger.debug("------- tag -------");
        logger.debug(basicTag);                     // 데이터가 있기도 하고 없기도 함(대부분 빈 값)

        /////////////////////////////////////////////////////////////////////////////////////////
        // 엔트리 기본정보 추가
        HeritageSearchEntry biologySearchEntry = iHeritageService.getHeritageSearchEntry(idx);
        String entryTag = biologySearchEntry.getTag();
        entryTag = Utility.getLastWordFromString(entryTag, ",");
        biologySearchEntry.setTag(entryTag);

        logger.debug("------- entryTag -------");
        logger.debug(entryTag);
        mav.addObject("entry", biologySearchEntry);

        /////////////////////////////////////////////////////////////////////////////////////////
        // 엔트리 부가정보
        HeritageSearchEntryUCIResult biologySearchEntryUCIResult = iHeritageService.getHeritageSearchEntryUCIResult(idx);
        if (null != biologySearchEntryUCIResult) {
            // UCI 코드얻기
            mav.addObject("uciresult", biologySearchEntryUCIResult);

            // 개요 얻기
            List<Object> listInformations = iHeritageService.listHeritageSearchInformations(idx);
            mav.addObject("informations", listInformations);

            // 관련 문화재 얻기
            String relationEntryData = biologySearchEntryUCIResult.getRelationEntryData();
            logger.debug("------- relationEntryData -------");
            logger.debug(relationEntryData);

            if (null != relationEntryData) {
                List<HeritageSearchRelations> listsHeritageSearchRelation = iHeritageService.listHeritageSearchRelations(Utility.makeRelationEntryData(relationEntryData));
                //
                // 태그가공
                List<String> listTags = new ArrayList<String>();
                for (int k=0; k<listsHeritageSearchRelation.size(); k++) {
                    HeritageSearchRelations tempHeritageSearchRelations = listsHeritageSearchRelation.get(k);
                    String tempTags = tempHeritageSearchRelations.getTag();
                    tempTags = Utility.getLastWordFromString(tempTags, ",");

                    tempHeritageSearchRelations.setTag(tempTags);
                }
                //
                mav.addObject("list_relations", listsHeritageSearchRelation);
            } else {
                mav.addObject("list_relations", "");
            }

            // 관련 교과 얻기
            if (null != biologySearchEntryUCIResult.getChapterData()) {
                mav.addObject("arr_chapterdata", Utility.splitStringByWord(biologySearchEntryUCIResult.getChapterData(), ","));
            } else {
                mav.addObject("arr_chapterdata", "");
            }

            // 용어해설 얻기
            String termsData = biologySearchEntryUCIResult.getTermsData();
            logger.debug("------- termsData -------");
            logger.debug(termsData);

            if (null != termsData) {
                List<HeritageSearchRelations> listsHeritageTermsData = iHeritageService.listHeritageSearchRelations(Utility.makeRelationEntryData(termsData));
                //
                mav.addObject("list_terms", listsHeritageTermsData);
            } else {
                mav.addObject("list_terms", "");
            }
        } else {
            logger.debug("생물정보 기획자료 - biologySearchEntryUCIResult is null");
        }

        mav.setViewName("biology_view");

        return mav;
    }

    /**
     * 생물정보 검색 입력 페이지
     * @param model
     * @return
     */
    @RequestMapping(value = "/biology_search.do", method = RequestMethod.GET)
    public String biologySearchPage(Map<String, Object> model) {
        logger.debug("biologySearchPage() is executed!");

        return "biology_search";
    }

}
