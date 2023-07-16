package springframework.com.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import springframework.com.main.service.LoginService;

import java.util.*;

@Controller
public class MainContorller {
    @Autowired
    private LoginService loginService;
    private static final Logger logger = LoggerFactory.getLogger(LoginContorller.class);
    @RequestMapping("/main/mainPage.do")
    public String mainPage() {
        return "main/main";
    }
    @RequestMapping("/loginPage.do")
    public String loginPage() {
        return "login/login";
    }

    /* 사용법 부분 삭제될 부분 */
    @RequestMapping("/test/customAjax")
    public String customAjax(@RequestParam Map<String,Object> map, Model model) {
        System.out.println("customAjax 받아온 params : "+ map);
        model.addAttribute("rs",loginService.getTestDataSmaple()); // 모델에 rs로 담아줄것
        return "jsonView";
    }
    @RequestMapping("/test/customKendoGrid")
    public String customKendoGrid(@RequestParam Map<String,Object> map, Model model) {
        System.out.println("customKendoGrid의 받아온 params : "+ map);
        model.addAttribute("rs",loginService.getTestDataSmaple()); // 모델에 rs로 담아줄것
        return "jsonView";
    }
    /* 사용법 부분 삭제될 부분 */
}
