package top.plgxs.admin.entity;

public class PlgUserOpen {
    /**
     * 第三方openid
     */
    private String openId;

    /**
     * 用户id
     */
    private String userId;

    /**
     * 第三方类型，微信，QQ、微博等等
     */
    private String platformType;

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId == null ? null : openId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getPlatformType() {
        return platformType;
    }

    public void setPlatformType(String platformType) {
        this.platformType = platformType == null ? null : platformType.trim();
    }
}