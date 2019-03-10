package top.plgxs.admin.entity.vo;

import top.plgxs.admin.entity.PlgUser;
import top.plgxs.common.TimeUtil;

import java.util.Date;

/**
 * 用户vo
 */
public class PlgUserVO {

    /**
     * 主键uuid
     */
    private String id;
    /**
     * 用户名
     */
    private String username;
    /**
     * 手机号
     */
    private String mobile;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 昵称
     */
    private String nickname;

    /**
     * 性别，0-保密，1-男，2-女
     */
    private String gender;

    /**
     * 真实姓名
     */
    private String realname;

    /**
     * 身份证号
     */
    private String idNumber;
    /**
     * 注册时间
     */
    private String registerTime;

    /**
     * 登录次数
     */
    private String loginNumber;

    /**
     * 最后登录时间
     */
    private String lastLoginTime;

    /**
     * 更新时间
     */
    private String updateTime;

    /**
     * 状态，1-冻结，0-正常
     */
    private String status;

    public PlgUserVO() {
        super();
    }

    public PlgUserVO(String id, String username, String mobile, String email, String nickname, String gender, String realname, String idNumber, String registerTime, String loginNumber, String lastLoginTime, String updateTime, String status) {
        this.id = id;
        this.username = username;
        this.mobile = mobile;
        this.email = email;
        this.nickname = nickname;
        this.gender = gender;
        this.realname = realname;
        this.idNumber = idNumber;
        this.registerTime = registerTime;
        this.loginNumber = loginNumber;
        this.lastLoginTime = lastLoginTime;
        this.updateTime = updateTime;
        this.status = status;
    }

    public PlgUserVO(PlgUser user){
        this.id = user.getId();
        this.username = user.getUsername();
        this.mobile = user.getMobile();
        this.email = user.getEmail();
        this.nickname = user.getNickname();
        switch (user.getGender()){
            case 0:
                this.gender = "保密";
                break;
            case 1:
                this.gender = "男";
                break;
            case 2:
                this.gender = "女";
                break;
                default:
                    this.gender = "保密";
                    break;
        }
        this.realname = user.getRealname();
        this.idNumber = user.getIdNumber();
        this.registerTime = TimeUtil.getDateTimeString(user.getRegisterTime());
        this.loginNumber = String.valueOf(user.getLoginNumber());
        this.lastLoginTime = TimeUtil.getDateTimeString(user.getLastLoginTime());
        this.updateTime = TimeUtil.getDateTimeString(user.getUpdateTime());
        switch (user.getStatus()){
            case 0:
                this.status = "启用";
                break;
            case 1:
                this.status = "冻结";
                break;
                default:
                    this.status = "启用";
                    break;
        }
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(String registerTime) {
        this.registerTime = registerTime;
    }

    public String getLoginNumber() {
        return loginNumber;
    }

    public void setLoginNumber(String loginNumber) {
        this.loginNumber = loginNumber;
    }

    public String getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(String lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "PlgUserVO{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", mobile='" + mobile + '\'' +
                ", email='" + email + '\'' +
                ", nickname='" + nickname + '\'' +
                ", gender='" + gender + '\'' +
                ", realname='" + realname + '\'' +
                ", idNumber='" + idNumber + '\'' +
                ", registerTime='" + registerTime + '\'' +
                ", loginNumber='" + loginNumber + '\'' +
                ", lastLoginTime='" + lastLoginTime + '\'' +
                ", updateTime='" + updateTime + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
