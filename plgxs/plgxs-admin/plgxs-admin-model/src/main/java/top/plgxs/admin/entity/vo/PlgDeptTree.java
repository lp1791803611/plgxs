package top.plgxs.admin.entity.vo;

import top.plgxs.admin.entity.PlgDept;

/**
 * @author Strangers。
 * @version 1.0.0
 * @date 10:59 2019/7/6
 */
public class PlgDeptTree {
    private Integer id;
    private Integer pid;
    private String name;
    private String deptCode;
    private Long seq;
    private Integer status;

    public PlgDeptTree() {
        super();
    }

    public PlgDeptTree(Integer id, Integer pid, String name, String deptCode, Long seq, Integer status) {
        this.id = id;
        this.pid = pid;
        this.name = name;
        this.deptCode = deptCode;
        this.seq = seq;
        this.status = status;
    }

    public PlgDeptTree(PlgDept dept){
        this.id = dept.getId();
        this.pid = dept.getParentId();
        this.name = dept.getDeptName();
        this.deptCode = dept.getDeptCode();
        this.seq = dept.getSeq();
        this.status = dept.getStatus();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode;
    }

    public Long getSeq() {
        return seq;
    }

    public void setSeq(Long seq) {
        this.seq = seq;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
