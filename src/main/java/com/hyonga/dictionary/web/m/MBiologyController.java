package com.hyonga.dictionary.web.m;

import com.hyonga.dictionary.common.MUtility;
import com.hyonga.dictionary.common.Utility;
import com.hyonga.dictionary.domain.*;
import com.hyonga.dictionary.service.IHeritageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/m")
public class MBiologyController {

    /** Logger object */
    private final Logger logger = LoggerFactory.getLogger(MBiologyController.class);

    /** 한 페이지당 자료 수 */
    private static final int PAGE_SIZE = 21;

    /** 페이징 블록 수 */
    private static final int BLOCK_SIZE = 10;

    /** Serivce object */
    @Autowired
    private IHeritageService iHeritageService;

    @RequestMapping(value = "/biology_theme.do", method = RequestMethod.GET)
    public String biologyThemePage(Map<String, Object> model) {
        logger.debug("---->biologyThemePage() is executed!");

        return "m/biology_theme";
    }

    /**
     * 생물정보 학습자료 상세 페이지
     * @param model
     * @return
     */
    @RequestMapping(value = "/biology_view.do", method = RequestMethod.GET)
    public ModelAndView biologyResearchDetail(@RequestParam Map<String, String> model) {
        logger.debug("---->biologyResearchDetail() is executed!");
        ModelAndView mav = new ModelAndView();

        // 파라미터 변수처리
        String idx = model.get("idx");
        String title = model.get("title");
        mav.addObject("title", title);

        logger.debug("---->생물정보 학습자료 파라미터 idx : " + idx + "<<END");


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
        // 엔트리 기본정보
        List<HeritageSearchBasic> listHeritageSearchBasic = iHeritageService.listHeritageSearchBasic(idx);
        String basicIndexContent = "";
        String basicTag = "";
        for (int o=0; o<listHeritageSearchBasic.size(); o++) {
            // BASIC, IMAGE 태그만 처리
            String tempData = listHeritageSearchBasic.get(o).getRecType();
            tempData = tempData.toUpperCase();

            if (tempData.equals("BASIC")) {
                basicIndexContent += MUtility.parseBasicText2Html(listHeritageSearchBasic.get(o).getContent());
            } else if (tempData.equals("IMAGE")) {
                basicIndexContent += MUtility.parseBasicImg2Html(listHeritageSearchBasic.get(o).getContent(), heritageSearchEntry.getTaskidx());
            } else if (tempData.equals("MAINTITLE")) {
                basicIndexContent += MUtility.parseBasicMainTitleText2Html(listHeritageSearchBasic.get(o).getContent());
            }
        }

        logger.debug(basicIndexContent);
        mav.addObject("basic", basicIndexContent);

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
            logger.debug("---->------- relationEntryData -------");
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
            logger.debug("---->------- termsData -------");
            logger.debug(termsData);

            if (null != termsData) {
                List<HeritageSearchRelations> listsHeritageTermsData = iHeritageService.listHeritageSearchRelations(Utility.makeRelationEntryData(termsData));
                //
                mav.addObject("list_terms", listsHeritageTermsData);
            } else {
                mav.addObject("list_terms", "");
            }
        } else {
            logger.debug("---->생물정보 학습자료 - biologySearchEntryUCIResult is null");
        }

        mav.setViewName("m/biology_view");

        return mav;
    }

    /**
     * 생물정보 학습자료 상세 페이지
     * @param model
     * @return
     */
    @RequestMapping(value = "/biology_view2.do", method = RequestMethod.GET)
    public ModelAndView biologyResearchDetail2(@RequestParam Map<String, String> model) {
        logger.debug("---->biologyResearchDetail2() is executed!");
        ModelAndView mav = new ModelAndView();

        // 파라미터 변수처리
        String idx = model.get("idx");
        logger.debug("---->생물정보 학습자료 파라미터 idx : " + idx + "<<END");

        String category = model.get("cat");
        mav.addObject("cat", category);

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
        // 엔트리 기본정보
        List<HeritageSearchBasic> listHeritageSearchBasic = iHeritageService.listHeritageSearchBasic(idx);
        String basicIndexContent = "";
        String basicTag = "";
        for (int o=0; o<listHeritageSearchBasic.size(); o++) {
            // BASIC, IMAGE, MAINTITLE 태그만 처리
            String tempData = listHeritageSearchBasic.get(o).getRecType();
            tempData = tempData.toUpperCase();

            if (tempData.equals("BASIC")) {
                basicIndexContent += MUtility.parseBasicText2Html(listHeritageSearchBasic.get(o).getContent());
            } else if (tempData.equals("IMAGE")) {
                basicIndexContent += MUtility.parseBasicImg2Html(listHeritageSearchBasic.get(o).getContent(), heritageSearchEntry.getTaskidx());
            } else if (tempData.equals("MAINTITLE")) {
                basicIndexContent += MUtility.parseBasicMainTitleText2Html(listHeritageSearchBasic.get(o).getContent());
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
            logger.debug("---->생물정보 학습자료 - heritageSearchEntryUCIResult is null");
        }

        mav.setViewName("m/biology_view2");
        return mav;
    }

    /**
     * 생물정보 검색 입력 페이지
     * @param model
     * @return
     */
    @RequestMapping(value = "/biology_search.do", method = RequestMethod.GET)
    public String biologySearchPage(Map<String, Object> model) {
        logger.debug("---->biologySearchPage() is executed!");

        return "m/biology_search";
    }

    /**
     * 생물정보 테마 상세 목록
     * @param model
     * @return
     */
    @RequestMapping(value = "/biology_list.do", method = RequestMethod.GET)
    public ModelAndView biologyListPage(@RequestParam Map<String, String> model) {
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

        mav.setViewName("m/biology_list");
        return mav;
    }

    /**
     * 생물정보 검색 처리
     * @param model
     * @return
     */
    @RequestMapping(value = "/biology_search.do", method = RequestMethod.POST)
    public ModelAndView biologySearchResult(@RequestParam Map<String, String> model) {
        logger.debug("---->biologySearchResult() is executed!");
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

        List<HeritageSearchResult> lists = iHeritageService.listBiologySearchResult(searchCondition);
        int sizeOfTotalList = iHeritageService.sizeOfBiologySearchResult(searchCondition);
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

        // 생물정보 이미지 검색결과 수 얻기
        int countOfImg = iHeritageService.sizeOfBiologyImgSearchResult(searchCondition);
//        List<HeritageSearchImgResult> imgLists = iHeritageService.listBiologySearchImg(searchCondition);
//        if (null != imgLists) {
//            countOfImg = imgLists.size();
//        }
        mav.addObject("imgTotalCount", countOfImg);

        mav.setViewName("m/biology_search_result");

        return mav;
    }

    @RequestMapping(value = "/biology_search_img.do", method = RequestMethod.POST)
    public ModelAndView biologySearchImg(@RequestParam Map<String, String> model) {
        logger.debug("---->biologySearchImg() is executed!");

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

        List<HeritageSearchImgResult> lists = iHeritageService.listBiologySearchImg(searchCondition);
        int sizeOfTotalList = iHeritageService.sizeOfBiologyImgSearchResult(searchCondition);
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

        ModelAndView mav = new ModelAndView();
        mav.setViewName("m/biology_search_img");
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

        // 생물정보 검색결과 수 얻기
        int countOfData = this.iHeritageService.sizeOfBiologySearchResult(searchCondition);
//        List<HeritageSearchResult> dataList = iHeritageService.listBiologySearchResult(searchCondition);
//        if (null != dataList) {
//            countOfData = dataList.size();
//        }
        mav.addObject("dataTotalCount", countOfData);

        return mav;
    }

}
