package com.hyonga.dictionary.web;

import com.hyonga.dictionary.common.Utility;
import com.hyonga.dictionary.domain.HeritageSearchCondition;
import com.hyonga.dictionary.domain.HeritageSearchResult;
import com.hyonga.dictionary.service.IHeritageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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

    @RequestMapping(value = "/heritage_search.do", method = RequestMethod.GET)
    public String heritageSearchPage(Map<String, Object> model) {
        logger.debug("heritageSearchPage() is executed!");

        return "heritage_search";
    }

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
}
