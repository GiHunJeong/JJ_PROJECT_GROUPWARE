package springframework.com.main.repository;

import springframework.com.common.dao.AbstractDAO;
import org.springframework.stereotype.Repository;
import springframework.com.common.dto.LoginVO;

import java.util.List;
import java.util.Map;

@Repository
public class LoginRepository extends AbstractDAO {
    public Map<String,Object> loginCheck(Map<String,Object> map) {
        return (Map<String,Object>) selectOne("login.loginCheck",map);
    }
    public LoginVO actionLogin(LoginVO loginVO) {
        return (LoginVO) selectOne("login.actionLogin",loginVO);
    }
}
