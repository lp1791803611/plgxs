package top.plgxs.admin.entity;

public class PlgRoleMenuKey {
    /**
     * 
     */
    private String roleId;

    /**
     * 
     */
    private Integer menuId;

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }
}