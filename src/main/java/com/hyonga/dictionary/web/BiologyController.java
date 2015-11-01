package com.hyonga.dictionary.web;

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
import org.springframework.web.bind.annotation.RequestParam;
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
     * @param model
     * @return
     */
    @RequestMapping(value = "/biology_view.do", method = RequestMethod.GET)
    public ModelAndView biologyResearchDetail(@RequestParam Map<String, String> model) {
        logger.debug("biologyResearchDetail() is executed!");
        ModelAndView mav = new ModelAndView();

        // 파라미터 변수처리
        String idx = model.get("idx");
        String title = model.get("title");
        mav.addObject("title", title);

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
     * 생물정보 기획자료 상세 페이지
     * @param model
     * @return
     */
    @RequestMapping(value = "/biology_view2.do", method = RequestMethod.GET)
    public ModelAndView biologyResearchDetail2(@RequestParam Map<String, String> model) {
        logger.debug("biologyResearchDetail2() is executed!");
        ModelAndView mav = new ModelAndView();

        // 파라미터 변수처리
        String idx = model.get("idx");
        logger.debug("생물정보 기획자료 파라미터 idx : " + idx + "<<END");

        String category = model.get("cat");
        mav.addObject("cat", category);

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
                basicTag =  listHeritageSearchBasic.get(o).getContent();
            }
        }

        logger.debug(basicIndexContent);

        CommonBasicXML commonBasicXML = Utility.getCommonBasicXML(basicIndexContent);
        mav.addObject("basic", commonBasicXML);
        //
        logger.debug(commonBasicXML.toString());
        logger.debug(basicTag);

        /////////////////////////////////////////////////////////////////////////////////////////
        // 엔트리 기본정보 추가
        HeritageSearchEntry heritageSearchEntry = iHeritageService.getHeritageSearchEntry(idx);
        String entryTag = heritageSearchEntry.getTag();
        if(null != entryTag) {
            entryTag = Utility.getLastWordFromString(entryTag, ",");
            heritageSearchEntry.setTag(entryTag);
            //
            mav.addObject("entry", heritageSearchEntry);
        }

        /////////////////////////////////////////////////////////////////////////////////////////
        // 엔트리 부가정보
        HeritageSearchEntryUCIResult heritageSearchEntryUCIResult = iHeritageService.getHeritageSearchEntryUCIResult(idx);
        if (null != heritageSearchEntryUCIResult) {
            // UCI 코드얻기
            mav.addObject("uciresult", heritageSearchEntryUCIResult);

            // 개요 얻기
            List<Object> listInformations = iHeritageService.listHeritageSearchInformations(idx);
            mav.addObject("informations", listInformations);

            // 관련 정보 얻기
            String relationEntryData = heritageSearchEntryUCIResult.getRelationEntryData();
            if (null != relationEntryData) {
                List<HeritageSearchRelations> listsHeritageSearchRelation = iHeritageService.listHeritageSearchRelations(Utility.makeRelationEntryData(relationEntryData));
                //
                // 태그가공
                List<String> listTags = new ArrayList<String>();
                for (int k = 0; k < listsHeritageSearchRelation.size(); k++) {
                    HeritageSearchRelations tempHeritageSearchRelations = listsHeritageSearchRelation.get(k);
                    String tempTags = tempHeritageSearchRelations.getTag();
                    tempTags = Utility.getLastWordFromString(tempTags, ",");

                    tempHeritageSearchRelations.setTag(tempTags);
                }
                //
                mav.addObject("list_relations", listsHeritageSearchRelation);

                // 관련 교과 얻기
                mav.addObject("arr_chapterdata", Utility.splitStringByWord(heritageSearchEntryUCIResult.getChapterData(), ","));
            } else {
                mav.addObject("list_relations", "");
                mav.addObject("arr_chapterdata", "");
            }

            // 용어해설 얻기
            String termsData = heritageSearchEntryUCIResult.getTermsData();
            if (null != termsData) {
                List<HeritageSearchRelations> listsHeritageTermsData = iHeritageService.listHeritageSearchRelations(Utility.makeRelationEntryData(termsData));
                //
                mav.addObject("list_terms", listsHeritageTermsData);
            } else {
                mav.addObject("list_terms", "");
            }

        } else {
            logger.debug("생물정보 기획자료 - heritageSearchEntryUCIResult is null");
        }

        mav.setViewName("biology_view2");
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

    /**
     * 생물정보 테마 상세 목록
     * @param model
     * @return
     */
    @RequestMapping(value = "/biology_list.do", method = RequestMethod.GET)
    public ModelAndView biologyListPage(@RequestParam Map<String, String> model) {
        logger.debug("heritageListPage() is executed!");
        logger.debug("binderIdx:" + model.get("binderIdx"));
        logger.debug("title:" + model.get("title"));

        // 파라미터 변수처리
        String binderIdx = model.get("binderIdx");
        String title = model.get("title");

        // binderIdx를 통해서 entryIdx 추출
        List<HeritageSearchResult> listTheme = this.iHeritageService.listHeritageTheme(binderIdx);
        int sizeOfList = listTheme.size();

        ModelAndView mav = new ModelAndView();
        mav.addObject("title", title);
        mav.addObject("data", listTheme);
        mav.addObject("list_size", sizeOfList);

        mav.setViewName("biology_list");
        return mav;
    }

    /**
     * 생물정보 검색 처리
     * @param model
     * @return
     */
    @RequestMapping(value = "/biology_search.do", method = RequestMethod.POST)
    public ModelAndView biologySearchResult(@RequestParam Map<String, String> model) {
        logger.debug("biologySearchResult() is executed!");
        String munitIdx = model.get("munitIdx");
        String entryTitle = model.get("entryTitle");

        HeritageSearchCondition searchCondition = new HeritageSearchCondition();
        searchCondition.setEntryTitle(entryTitle);
        logger.debug("파라미터 : " + model.toString() + "<<END");

        List<HeritageSearchResult> lists = iHeritageService.listBiologySearchResult(searchCondition);
        int countOfLists = lists.size();
        logger.debug("listHeritageSearchResult size : " + countOfLists + "<<END");

        ModelAndView mav = new ModelAndView();
        mav.addObject("munitidx", searchCondition.getMunitidx());
        mav.addObject("strMUnitIdx", Utility.getStrMUnitIdx(searchCondition.getMunitidx()));
        mav.addObject("entryTitle", searchCondition.getEntryTitle());
        mav.addObject("refineEntryTitle", Utility.getRefineEntryTitle(searchCondition.getMunitidx(), searchCondition.getEntryTitle()));
        mav.addObject("data", lists);
        mav.addObject("totalCount", Utility.addComma("0" + countOfLists));

        mav.setViewName("biology_search_result");

        return mav;
    }

}
