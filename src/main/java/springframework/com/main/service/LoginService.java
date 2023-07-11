package springframework.com.main.service;

import springframework.com.common.dto.LoginVO;

import java.util.List;
import java.util.Map;

public interface LoginService {
    Map<String, Object> loginCheck(Map<String,Object> map);
    LoginVO actionLogin(LoginVO loginVO);
}
