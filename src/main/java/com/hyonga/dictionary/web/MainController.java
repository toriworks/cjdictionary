package com.hyonga.dictionary.web;

import com.hyonga.dictionary.common.Utility;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class MainController {

    /** Logger object */
    private final Logger logger = LoggerFactory.getLogger(MainController.class);

    /** Servlet request object */
    private @Autowired HttpServletRequest request;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView indexPage(Map<String, Object> model) {
        logger.debug("---->indexPage() is executed!");

        String url = "redirect:/main";
        return new ModelAndView(url);
    }

    @RequestMapping(value = "/main.do", method = RequestMethod.GET)
    public ModelAndView mainPage(Map<String, Object> model) {
        logger.debug("---->mainPage() is executed!");

        String targetPage = "main";
        if (Utility.isMobileBrowser(this.request) == 1) {
            // Move to mobile main page
            targetPage = "redirect:/m/main.do";
        }

        return new ModelAndView(targetPage);
    }
}
