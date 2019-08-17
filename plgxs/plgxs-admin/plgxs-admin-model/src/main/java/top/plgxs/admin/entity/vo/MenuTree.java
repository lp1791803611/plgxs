package top.plgxs.admin.entity.vo;

import top.plgxs.admin.entity.PlgMenu;

import java.util.*;

/**
 * treeview菜单树
 * @author Strangers。
 * @version 1.0.0
 * @date 18:57 2019/8/10
 */
public class MenuTree {
    private Integer id;
    private Integer pid;
    private String text;
    private List<MenuTree> nodes = new ArrayList<>();
    private Map<String,Object> state = new HashMap<>();

    public MenuTree() {
        super();
    }

    public MenuTree(PlgMenu menu) {
        this.id = menu.getId();
        this.pid = menu.getParentId();
        this.text = menu.getMenuName();
    }

    public Integer getId() {
        return id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<MenuTree> getNodes() {
        return nodes;
    }

    public void setNodes(List<MenuTree> nodes) {
        this.nodes = nodes;
    }

    public Map<String, Object> getState() {
        return state;
    }

    public void setState(Map<String, Object> state) {
        this.state = state;
    }
}
