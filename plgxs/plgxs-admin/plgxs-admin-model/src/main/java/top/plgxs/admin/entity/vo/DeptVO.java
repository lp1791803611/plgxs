package top.plgxs.admin.entity.vo;

import top.plgxs.admin.entity.PlgDept;

import java.util.Date;

/**
 * @author Strangers。
 * @version 1.0.0
 * @date 22:51 2019/5/8
 */
public class DeptVO {

    private Integer id;

    /**
     * 父id
     */
    private Integer pid;

    /**
     * 部门代码
     */
    private String deptCode;

    /**
     * 部门名称
     */
    private String deptName;

    /**
     * 排序号
     */
    private Long seq;

    /**
     * 状态，0-启用，1-冻结
     */
    private Integer status;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建人姓名
     */
    private String createPersonName;

    public DeptVO() {
        super();
    }

    public DeptVO(Integer id, Integer pid, String deptCode, String deptName, Long seq, Integer status, Date createTime, String createPersonName) {
        this.id = id;
        this.pid = pid;
        this.deptCode = deptCode;
        this.deptName = deptName;
        this.seq = seq;
        this.status = status;
        this.createTime = createTime;
        this.createPersonName = createPersonName;
    }

    public DeptVO(PlgDept dept){
        this.id = dept.getId();
        this.pid = dept.getParentId();
        this.deptCode = dept.getDeptCode();
        this.deptName = deptName;
        this.seq = seq;
        this.status = status;
        this.createTime = createTime;
        this.createPersonName = createPersonName;
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

    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreatePersonName() {
        return createPersonName;
    }

    public void setCreatePersonName(String createPersonName) {
        this.createPersonName = createPersonName;
    }

    @Override
    public String toString() {
        return "DeptVO{" +
                "id=" + id +
                ", pid=" + pid +
                ", deptCode=" + deptCode +
                ", deptName='" + deptName + '\'' +
                ", seq=" + seq +
                ", status=" + status +
                ", createTime=" + createTime +
                ", createPersonName='" + createPersonName + '\'' +
                '}';
    }
}
