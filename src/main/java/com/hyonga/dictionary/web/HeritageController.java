package com.hyonga.dictionary.web;

import com.hyonga.dictionary.domain.HeritageSearchBasic;
import com.hyonga.dictionary.common.Utility;
import com.hyonga.dictionary.domain.*;
import com.hyonga.dictionary.service.IHeritageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
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

    /** 한 페이지당 자료 수 */
    private static final int PAGE_SIZE = 21;

    /** 페이징 블록 수 */
    private static final int BLOCK_SIZE = 10;

    /** Serivce object */
    @Autowired
    private IHeritageService iHeritageService;

    @RequestMapping(value = "/heritage_theme.do", method = RequestMethod.GET)
    public String heritageThemePage(Map<String, Object> model) {
        logger.debug("---->heritageThemePage() is executed!");

        return "heritage_theme";
    }

    /**
     * 문화유산 검색 입력 페이지
     * @param model
     * @return
     */
    @RequestMapping(value = "/heritage_search.do", method = RequestMethod.GET)
    public String heritageSearchPage(Map<String, Object> model) {
        logger.debug("---->heritageSearchPage() is executed!");

        return "heritage_search";
    }

    /**
     * 문화유산 검색 처리
     * @param model
     * @return
     */
    @RequestMapping(value = "/heritage_search.do", method = RequestMethod.POST)
    public ModelAndView heritageSearchResult(@RequestParam Map<String, String> model) {
        logger.debug("---->heritageSearchResult() is executed!");
        String munitidx = "" + model.get("munitidx");
        String entryTitle = model.get("entryTitle");

        // 페이징
        String strPage = (null != model.get("page")) ? model.get("page") : "1";
        int startPage = (Integer.parseInt(strPage) - 1) * PAGE_SIZE + 1;

        HeritageSearchCondition searchCondition = new HeritageSearchCondition();
        searchCondition.setEntryTitle(entryTitle);
        searchCondition.setStartPage(startPage);
        if (!"".equals(munitidx) && null != munitidx) {
            searchCondition.setMunitidx(munitidx);
        } else {
            searchCondition.setMunitidx("");
        }
        logger.debug("---->파라미터 : " + model.toString() + "<<END");
        logger.debug("---->searchCondition : " + searchCondition.toString() + "<<END");

        List<HeritageSearchResult> lists = iHeritageService.listHeritageSearchResult(searchCondition);
        int sizeOfTotalList = iHeritageService.sizeOfHeritageSearchResult(searchCondition);
        int modVal = (sizeOfTotalList > 0) ? sizeOfTotalList % PAGE_SIZE : 0;
        int divVal = (sizeOfTotalList > 0) ? sizeOfTotalList / PAGE_SIZE : 0;
        int blockPage = (modVal > 0) ? divVal + 1 : divVal;
        logger.debug("---->modVal : " + modVal + "<<END");
        logger.debug("---->divVal : " + divVal + "<<END");
        logger.debug("---->blockPage : " + blockPage + "<<END");
        logger.debug("---->listHeritageSearchResult size : " + sizeOfTotalList + "<<END");

        // 블럭 계산
        int blockCnt = (blockPage / BLOCK_SIZE) > 0 ? (blockPage / BLOCK_SIZE) + 1 : (blockPage / BLOCK_SIZE);
        int curPageDiv = (Integer.parseInt(strPage) >= BLOCK_SIZE) ? (Integer.parseInt(strPage) / BLOCK_SIZE) + 1 : 1;
        logger.debug("---->blockCnt : " + blockCnt + "<<END");
        logger.debug("---->curPageDiv : " + curPageDiv + "<<END");

        // 이전, 다음
        int canPrev = (curPageDiv > 1) ? 1 : 0;
        int canNext = (curPageDiv < blockCnt) ? 1 : 0;

        ModelAndView mav = new ModelAndView();
        mav.addObject("munitidx", searchCondition.getMunitidx());
        if (null != searchCondition.getMunitidx()) {
            mav.addObject("strMUnitIdx", Utility.getStrMUnitIdx(searchCondition.getMunitidx()));
        } else {
            mav.addObject("strMUnitIdx", "");
        }
        mav.addObject("entryTitle", searchCondition.getEntryTitle());
        mav.addObject("refineEntryTitle", Utility.getRefineEntryTitle(searchCondition.getMunitidx(), searchCondition.getEntryTitle()));
        mav.addObject("data", lists);
        mav.addObject("totalCount", sizeOfTotalList);
        mav.addObject("modVal", modVal);
        mav.addObject("divVal", divVal);
        mav.addObject("blockPage", blockPage);
        mav.addObject("page", strPage);
        mav.addObject("startPage", startPage);
        mav.addObject("canPrev", canPrev);
        mav.addObject("canNext", canNext);
        mav.addObject("curPageDiv", curPageDiv);

        // 문화유산 이미지 검색결과 수 얻기
        int countOfImg = iHeritageService.sizeOfHeritageImgSearchResult(searchCondition);
//        List<HeritageSearchImgResult> imgLists = iHeritageService.listHeritageSearchImg(searchCondition);
//        if (null != imgLists) {
//            countOfImg = imgLists.size();
//        }
        mav.addObject("imgTotalCount", countOfImg);

        mav.setViewName("heritage_search_result");

        return mav;
    }

    /**
     * 문화유산 학습자료
     * @param model
     * @return
     */
    @RequestMapping(value = "/heritage_research.do", method = RequestMethod.GET)
    public String heritageResearchPage(Map<String, Object> model) {
        logger.debug("---->heritageResearchPage() is executed!");
        return "heritage_research";
    }

    /**
     * 문화유산 테마별 자료 상세 페이지
     * @param model
     * @return
     */
    @RequestMapping(value = "/heritage_view.do", method = RequestMethod.GET)
    public ModelAndView heritageResearchDetail(@RequestParam Map<String, String> model) {
        logger.debug("---->heritageResearchDetail() is executed!");
        ModelAndView mav = new ModelAndView();

        // 파라미터 변수처리
        String idx = model.get("idx");
        String title = model.get("title");
        mav.addObject("title", title);

        logger.debug("---->문화유산 학습자료 파라미터 idx : " + idx + "<<END");

        /////////////////////////////////////////////////////////////////////////////////////////
        // 엔트리 기본정보 추가
        HeritageSearchEntry heritageSearchEntry = iHeritageService.getHeritageSearchEntry(idx);
        String entryTag = heritageSearchEntry.getTag();
        entryTag = Utility.getLastWordFromString(entryTag, ",");
        heritageSearchEntry.setTag(entryTag);
        //
        logger.debug("---->taskidx:" + heritageSearchEntry.getTaskidx() + "<<END");
        mav.addObject("entry", heritageSearchEntry);

        /////////////////////////////////////////////////////////////////////////////////////////
        // 엔트리 기본정보
        List<HeritageSearchBasic> listHeritageSearchBasic = iHeritageService.listHeritageSearchBasic(idx);
        String basicIndexContent = "";
        String basicTag = "";
        for (int o=0; o<listHeritageSearchBasic.size(); o++) {
            // BASIC, IMAGE 태그만 처리
            String tempData = listHeritageSearchBasic.get(o).getRecType();
            tempData = tempData.toUpperCase();

            if (tempData.equals("BASIC")) {
                basicIndexContent += Utility.parseBasicText2Html(listHeritageSearchBasic.get(o).getContent());
            } else if (tempData.equals("IMAGE")) {
                basicIndexContent += Utility.parseBasicImg2Html(listHeritageSearchBasic.get(o).getContent(), heritageSearchEntry.getTaskidx());
            } else if (tempData.equals("MAINTITLE")) {
                basicIndexContent += Utility.parseBasicMainTitleText2Html(listHeritageSearchBasic.get(o).getContent());
            }
        }

        logger.debug(basicIndexContent);
        mav.addObject("basic", basicIndexContent);

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
            logger.debug("---->문화유산 학습자료 - heritageSearchEntryUCIResult is null");
        }

        mav.setViewName("heritage_view");
        return mav;
    }

    /**
     * 문화유산 학습자료 상세 페이지
     * @param model
     * @return
     */
    @RequestMapping(value = "/heritage_view2.do", method = RequestMethod.GET)
    public ModelAndView heritageResearchDetail2(@RequestParam Map<String, String> model) {
        logger.debug("---->heritageResearchDetail2() is executed!");
        ModelAndView mav = new ModelAndView();

        // 파라미터 변수처리
        String idx = model.get("idx");
        logger.debug("---->문화유산 학습자료 파라미터 idx : " + idx + "<<END");

        String category = model.get("cat");
        mav.addObject("cat", category);

        /////////////////////////////////////////////////////////////////////////////////////////
        // 엔트리 기본정보 추가
        HeritageSearchEntry heritageSearchEntry = iHeritageService.getHeritageSearchEntry(idx);
        String entryTag = heritageSearchEntry.getTag();
        entryTag = Utility.getLastWordFromString(entryTag, ",");
        heritageSearchEntry.setTag(entryTag);
        //
        mav.addObject("entry", heritageSearchEntry);

        /////////////////////////////////////////////////////////////////////////////////////////
        // 엔트리 기본정보
        List<HeritageSearchBasic> listHeritageSearchBasic = iHeritageService.listHeritageSearchBasic(idx);
        String basicIndexContent = "";
        String basicTag = "";
        for (int o=0; o<listHeritageSearchBasic.size(); o++) {
            // BASIC, IMAGE 태그만 처리
            String tempData = listHeritageSearchBasic.get(o).getRecType();
            tempData = tempData.toUpperCase();

            if (tempData.equals("BASIC")) {
                basicIndexContent += Utility.parseBasicText2Html(listHeritageSearchBasic.get(o).getContent());
            } else if (tempData.equals("IMAGE")) {
                basicIndexContent += Utility.parseBasicImg2Html(listHeritageSearchBasic.get(o).getContent(), heritageSearchEntry.getTaskidx());
            } else if (tempData.equals("MAINTITLE")) {
                basicIndexContent += Utility.parseBasicMainTitleText2Html(listHeritageSearchBasic.get(o).getContent());
            }
        }

        logger.debug(basicIndexContent);
        mav.addObject("basic", basicIndexContent);

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
            if (null != heritageSearchEntryUCIResult.getChapterData()) {
                mav.addObject("arr_chapterdata", Utility.splitStringByWord(heritageSearchEntryUCIResult.getChapterData(), ","));
            } else {
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
            logger.debug("---->문화유산 학습자료 - heritageSearchEntryUCIResult is null");
        }

        mav.setViewName("heritage_view2");
        return mav;
    }

    /**
     * 문화유산 테마 상세 목록
     * @param model
     * @return
     */
    @RequestMapping(value = "/heritage_list.do", method = RequestMethod.GET)
    public ModelAndView heritageListPage(@RequestParam Map<String, String> model) {
        logger.debug("---->heritageListPage() is executed!");
        logger.debug("---->binderIdx:" + model.get("binderIdx"));
        logger.debug("---->title:" + model.get("title"));

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

        mav.setViewName("heritage_list");
        return mav;
    }

    @RequestMapping(value = "/heritage_search_img.do", method = RequestMethod.POST)
    public ModelAndView heritageSearchImg(@RequestParam Map<String, String> model) {
        logger.debug("---->heritageSearchImg() is executed!");

        String munitidx = "" + model.get("munitidx");
        String entryTitle = model.get("entryTitle");

        // 페이징
        String strPage = (null != model.get("page")) ? model.get("page") : "1";
        int startPage = (Integer.parseInt(strPage) - 1) * PAGE_SIZE + 1;

        HeritageSearchCondition searchCondition = new HeritageSearchCondition();
        searchCondition.setEntryTitle(entryTitle);
        searchCondition.setStartPage(startPage);
        if (!"".equals(munitidx) && null != munitidx) {
            searchCondition.setMunitidx(munitidx);
        } else {
            searchCondition.setMunitidx("");
        }
        logger.debug("---->파라미터 : " + model.toString() + "<<END");
        logger.debug("---->searchCondition : " + searchCondition.toString() + "<<END");

        ModelAndView mav = new ModelAndView();
        mav.setViewName("heritage_search_img");

        List<HeritageSearchImgResult> lists = iHeritageService.listHeritageSearchImg(searchCondition);
        int sizeOfTotalList = iHeritageService.sizeOfHeritageImgSearchResult(searchCondition);
        int modVal = (sizeOfTotalList > 0) ? sizeOfTotalList % PAGE_SIZE : 0;
        int divVal = (sizeOfTotalList > 0) ? sizeOfTotalList / PAGE_SIZE : 0;
        int blockPage = (modVal > 0) ? divVal + 1 : divVal;
        logger.debug("---->modVal : " + modVal + "<<END");
        logger.debug("---->divVal : " + divVal + "<<END");
        logger.debug("---->blockPage : " + blockPage + "<<END");
        logger.debug("---->listHeritageSearchImg size : " + sizeOfTotalList + "<<END");

        // 블럭 계산
        int blockCnt = (blockPage / BLOCK_SIZE) > 0 ? (blockPage / BLOCK_SIZE) + 1 : (blockPage / BLOCK_SIZE);
        int curPageDiv = (Integer.parseInt(strPage) >= BLOCK_SIZE) ? (Integer.parseInt(strPage) / BLOCK_SIZE) + 1 : 1;
        logger.debug("---->blockCnt : " + blockCnt + "<<END");
        logger.debug("---->curPageDiv : " + curPageDiv + "<<END");

        // 이전, 다음
        int canPrev = (curPageDiv > 1) ? 1 : 0;
        int canNext = (curPageDiv < blockCnt) ? 1 : 0;

        mav.addObject("munitidx", searchCondition.getMunitidx());
        if (null != searchCondition.getMunitidx()) {
            mav.addObject("strMUnitIdx", Utility.getStrMUnitIdx(searchCondition.getMunitidx()));
        } else {
            mav.addObject("strMUnitIdx", "");
        }
        mav.addObject("entryTitle", searchCondition.getEntryTitle());
        mav.addObject("refineEntryTitle", Utility.getRefineEntryTitle(searchCondition.getMunitidx(), searchCondition.getEntryTitle()));
        mav.addObject("data", lists);
        mav.addObject("totalCount", sizeOfTotalList);
        mav.addObject("modVal", modVal);
        mav.addObject("divVal", divVal);
        mav.addObject("blockPage", blockPage);
        mav.addObject("page", strPage);
        mav.addObject("startPage", startPage);
        mav.addObject("canPrev", canPrev);
        mav.addObject("canNext", canNext);
        mav.addObject("curPageDiv", curPageDiv);

        // 문화유산 검색결과 수 얻기
        int countOfData = iHeritageService.sizeOfHeritageSearchResult(searchCondition);
        logger.debug("countOfData:" + countOfData);
//        List<HeritageSearchResult> dataList = iHeritageService.listHeritageSearchResult(searchCondition);
//        if (null != dataList) {
//            countOfData = dataList.size();
//        }
        mav.addObject("dataTotalCount", countOfData);

        return mav;
    }
}
