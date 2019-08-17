package top.plgxs.admin.entity;

public class PlgUserDeptKey {
    /**
     * 
     */
    private String userId;

    /**
     * 
     */
    private Integer deptId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }
}