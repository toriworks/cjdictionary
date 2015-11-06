package com.hyonga.dictionary.web.m;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
@RequestMapping("/m")
public class MStaticPageController {

    /** Define logger object */
    private final Logger logger = LoggerFactory.getLogger(MStaticPageController.class);

    @RequestMapping(value = "/intro_page.do", method = RequestMethod.GET)
    public String introPage(Map<String, Object> model) {
        logger.debug("---->introPage() is executed!");
        return "m/intro_page";
    }

    @RequestMapping(value = "/uci_page.do", method = RequestMethod.GET)
    public String uciPage(Map<String, Object> model) {
        logger.debug("---->uciPage() is executed!");
        return "m/uci_page";
    }

    /**
     * 생물정보 학습자료
     * @param model
     * @return
     */
    @RequestMapping(value = "/biology_research.do", method = RequestMethod.GET)
    public String biologyResearchPage(Map<String, Object> model) {
        logger.debug("---->heritageResearchPage() is executed!");
        return "m/biology_research";
    }
}
