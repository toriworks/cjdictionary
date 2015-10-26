package com.hyonga.dictionary.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
public class BiologyController {

    /** Logger object */
    private final Logger logger = LoggerFactory.getLogger(BiologyController.class);

    @RequestMapping(value = "/biology_view.do", method = RequestMethod.GET)
    public String biologyViewPage(Map<String, Object> model) {
        logger.debug("biologyViewPage() is executed!");


        return "biology_view";
    }
}
