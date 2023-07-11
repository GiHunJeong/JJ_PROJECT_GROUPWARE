package springframework.com.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import springframework.com.common.dto.LoginVO;
import springframework.com.main.service.LoginService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginContorller {
    private static final Logger logger = LoggerFactory.getLogger(LoginContorller.class);
    @Autowired
    private LoginService loginService;
    @RequestMapping("/main/main.do")
    public String mainPage(HttpServletRequest request) {
        HttpSession session = request.getSession();
        LoginVO loginVO = (LoginVO) session.getAttribute("LoginVO");

        if(loginVO != null){
            return "forward:/main/mainPage.do";
        } else {
            return "redirect:/loginPage.do";
        }
    }
    @RequestMapping("/loginCheck")
    public String loginCheck(@RequestParam Map<String, Object> map, Model model){
        Map<String, Object> loginCheckResult = loginService.loginCheck(map);
        model.addAttribute("cnt", loginCheckResult.get("result"));
        model.addAttribute("message", loginCheckResult.get("message"));
        return "jsonView";
    }

    /*@RequestMapping("/loginAccess.do")
    public String loginAccess(@RequestParam Map<String, Object> params, @ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception{

        // 1. 일반 로그인 처리
        Map<String, Object> resultMap = loginService.actionLogin(params);
        LoginVO login = loginService.actionLogin2(loginVO);
        boolean loginPolicyYn = true;
        login.setErpEmpCd(resultMap.get("ERP_EMP_NUM").toString());
        if (resultMap != null && resultMap.get("id") != null && !resultMap.get("id").equals("") && loginPolicyYn) {
            // 총관리자 여부
            boolean isAdmin = false;

            Map<String, Object> loginMap = new HashMap<>();
            loginMap.put("emp_seq", login.getUniqId());
            loginMap.put("emp_name", login.getName());
            loginMap.put("dept_seq", login.getOrgnztId());
            loginMap.put("position_code", login.getPositionCode());
            loginMap.put("duty_code", login.getDutyCode());
            loginMap.put("id", login.getId());
            loginMap.put("erp_emp_num", login.getErpEmpCd());
            String ip = request.getHeader("X-Forwarded-For");
            if(ip == null){
                ip = request.getRemoteAddr();
            }



            loginMap.put("ip", ip);
            //로그인 시 DB에 로그 저장
            loginService.setLoginLogInsert(loginMap);

            if(login.getUniqId().equals("1")){
                isAdmin = true;
                login.setUserSe("ADMIN");
                loginMap.put("userSe", "ADMIN");
            }



            //mssql CO_CD 정보 추가
            Map<String, Object> loginMsMap = loginService.actionLoginMs(loginMap);
            if (!loginMsMap.isEmpty()) {
                login.setErpCoCd(loginMsMap.get("CO_CD").toString());
            }
            String empSeq = login.getUniqId();
            Map<String, Object> empMap = loginService.getEmpInfo(empSeq);
            request.getSession().setAttribute("isAdmin", isAdmin);
            request.getSession().setAttribute("LoginVO", login);
            request.getSession().setAttribute("empMap", empMap);
            return "redirect:/intra/mainContent.do";
        } else {
            model.addAttribute("message", "Login failed.");
            return "forward:/loginPage.do";
        }
    }*/
    @RequestMapping("/loginAccess.do")
    public String loginAccess(@RequestParam Map<String, Object> params, @ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) {
        loginVO.setId(params.get("id").toString());
        LoginVO login = loginService.actionLogin(loginVO);
        request.getSession().setAttribute("LoginVO", login);
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(1800);
        return "redirect:/main/mainPage.do";
    }
    @RequestMapping("/logout.do")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/main/main.do";
    }
}
