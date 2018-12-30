package top.plgxs.admin.entity;

import java.util.Date;

public class PlgUser {
    /**
     * 主键uuid
     */
    private String id;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码md5
     */
    private String password;

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
    private Integer gender;

    /**
     * 真实姓名
     */
    private String realname;

    /**
     * 身份证号
     */
    private String idNumber;

    /**
     * 头像url
     */
    private String headUrl;

    /**
     * 注册时间
     */
    private Date registerTime;

    /**
     * 登录次数
     */
    private Long loginNumber;

    /**
     * 最后登录时间
     */
    private Date lastLoginTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 状态，1-冻结，0-正常
     */
    private Integer status;

    /**
     * 手机验证码
     */
    private String mobileVerificationCode;

    /**
     * 邮箱验证码
     */
    private String emailVerificationCode;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber == null ? null : idNumber.trim();
    }

    public String getHeadUrl() {
        return headUrl;
    }

    public void setHeadUrl(String headUrl) {
        this.headUrl = headUrl == null ? null : headUrl.trim();
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public Long getLoginNumber() {
        return loginNumber;
    }

    public void setLoginNumber(Long loginNumber) {
        this.loginNumber = loginNumber;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMobileVerificationCode() {
        return mobileVerificationCode;
    }

    public void setMobileVerificationCode(String mobileVerificationCode) {
        this.mobileVerificationCode = mobileVerificationCode == null ? null : mobileVerificationCode.trim();
    }

    public String getEmailVerificationCode() {
        return emailVerificationCode;
    }

    public void setEmailVerificationCode(String emailVerificationCode) {
        this.emailVerificationCode = emailVerificationCode == null ? null : emailVerificationCode.trim();
    }
}