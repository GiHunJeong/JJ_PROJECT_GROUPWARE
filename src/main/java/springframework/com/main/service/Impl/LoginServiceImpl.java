package springframework.com.main.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import springframework.com.common.dto.LoginVO;
import springframework.com.main.repository.LoginRepository;
import springframework.com.main.service.LoginService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginRepository loginRepository;
    @Override
    public Map<String,Object> loginCheck(Map<String,Object> map) {
        Map<String,Object> result = new HashMap<>();
        try{
            Map<String,Object> li = loginRepository.loginCheck(map);
            if(map.get("password").toString().equals(li.get("PASSWORD"))) {
                result.put("result",2);
                result.put("message","로그인 성공.");
            }else {
                result.put("result",1);
                result.put("message","비밀번호가 잘못 되었습니다.");
            }
        }catch (Exception e) {
            result.put("result", 0);
            result.put("message","아이디가 존재하지 않습니다.");
        }
        return result;
    }
    @Override
    public LoginVO actionLogin(LoginVO loginVO) {
        LoginVO login = loginRepository.actionLogin(loginVO);
        return login;
    }
}
