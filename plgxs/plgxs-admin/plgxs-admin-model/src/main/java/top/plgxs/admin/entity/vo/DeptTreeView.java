package top.plgxs.admin.entity.vo;

import top.plgxs.admin.entity.PlgDept;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Strangers。
 * @version 1.0.0
 * @date 9:35 2019/7/13
 */
public class DeptTreeView {
    private Integer id;
    private Integer pId;
    private String name;
    private String open;
    private String chkDisabled;

    public DeptTreeView() {
        super();
    }

    public DeptTreeView(PlgDept dept) {
        this.id = dept.getId();
        this.pId = dept.getParentId();
        this.name = dept.getDeptName();
        this.open = null;
        this.chkDisabled = "false";
    }



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOpen() {
        return open;
    }

    public void setOpen(String open) {
        this.open = open;
    }

    public String getChkDisabled() {
        return chkDisabled;
    }

    public void setChkDisabled(String chkDisabled) {
        this.chkDisabled = chkDisabled;
    }
}
