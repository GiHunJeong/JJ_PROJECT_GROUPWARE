package springframework.com.main.controller;

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
    @RequestMapping("/main/mainPage.do")
    public String mainPage() {
        System.out.println("메인페이지 이동");
        return "main/main";
    }
    @RequestMapping("/main/loginPage.do")
    public String loginPage() {
        return "login/login";
    }
    @RequestMapping(value="/main/loginCheck", method = RequestMethod.POST)
    public String loginCheck(@RequestParam String username, @RequestParam String password) {
        System.out.println(username);
        System.out.println(password);
        String adminId = "admin";
        String adminPw = "1234";
        if(username.equals(adminId)) {
            System.out.println("아이디 일치");
            if(password.equals(adminPw)) {
                System.out.println("비밀번호 일치");
                return "main/main";
            }else {
                System.out.println("비밀번호 불일치");
                return "login/login";
            }
        }else{
            return "login/login";
        }
    }
    @RequestMapping("/test")
    public String test(@RequestParam Map<String,Object> map , Model model) {
        System.out.println(map);
        model.addAttribute("rs", "test");
        return "jsonView";
    }
}
