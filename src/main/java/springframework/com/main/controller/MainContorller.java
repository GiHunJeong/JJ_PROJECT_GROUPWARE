package springframework.com.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.*;

@Controller
public class MainContorller {
    private static final Logger logger = LoggerFactory.getLogger(LoginContorller.class);
    @RequestMapping("/main/mainPage.do")
    public String mainPage() {
        System.out.println("메인페이지 이동");
        return "main/main";
    }
    @RequestMapping("/loginPage.do")
    public String loginPage() {
        return "login/login";
    }
    @RequestMapping("/test")
    public String test(@RequestParam Map<String,Object> map , Model model) {
        System.out.println(map);
        model.addAttribute("rs", "test");
        return "jsonView";
    }
}
