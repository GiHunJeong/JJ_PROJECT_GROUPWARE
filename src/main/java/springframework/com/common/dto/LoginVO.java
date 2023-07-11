package springframework.com.common.dto;

import lombok.Data;

@Data
public class LoginVO {
    private String id;
    private String password;
    private String name;
    private String emailId;
    private String empSeq;
    private String deptName;
    private String deptCode;
    private String addr;
    private String addrDetail;
    private String zipCode;
    private String regDate;
    public LoginVO() {
    }
}
