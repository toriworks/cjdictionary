package com.hyonga.dictionary.web.m;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
@RequestMapping("/m")
public class MMainController {

    /** Logger object */
    private final Logger logger = LoggerFactory.getLogger(MMainController.class);

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView indexPage(Map<String, Object> model) {
        logger.debug("---->indexPage() is executed!");

        String url = "redirect:/m/main";
        return new ModelAndView(url);
    }

    @RequestMapping(value = "/main.do", method = RequestMethod.GET)
    public String mainPage(Map<String, Object> model) {
        logger.debug("---->mainPage() is executed!");


        return "m/main";
    }
}
