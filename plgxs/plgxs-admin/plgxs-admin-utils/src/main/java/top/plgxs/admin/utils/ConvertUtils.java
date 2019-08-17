package top.plgxs.admin.utils;

import org.apache.commons.lang3.StringUtils;
import top.plgxs.admin.entity.PlgDept;
import top.plgxs.admin.entity.PlgMenu;
import top.plgxs.admin.entity.PlgUser;
import top.plgxs.admin.entity.vo.*;

import java.util.ArrayList;
import java.util.List;

/**
 * 转换类
 */
public class ConvertUtils {

    /**
     * 将PlgUser集合转换为VO集合
     * @param
     * @return
     * @author Strangers。
     * @date 23:01 2019/5/8
     */
    public static List<PlgUserVO> convertUserToVO(List<PlgUser> users){
        List<PlgUserVO> list = new ArrayList<>();
        if(users == null || users.size() == 0){
            return list;
        }
        for(int i=0,len=users.size();i<len;i++){
            PlgUserVO vo = new PlgUserVO(users.get(i));
            list.add(vo);
        }
        return list;
    }

    /**
     * 将PlgDept集合转换为VO集合
     * @param
     * @return
     * @author Strangers。
     * @date 23:02 2019/5/8
     */
    public static List<DeptVO> convertDeptToVO(List<PlgDept> depts){
        List<DeptVO> list = new ArrayList<>();
        if(depts == null || depts.size() == 0){
            return list;
        }
        for(int i=0,len=depts.size();i<len;i++){
            DeptVO vo = new DeptVO(depts.get(i));
            list.add(vo);
        }
        return list;
    }

    /**
     * 将PlgDept集合转换为Tree集合
     * @param
     * @return
     * @author Strangers。
     * @date 23:02 2019/5/8
     */
    public static List<PlgDeptTree> convertDeptToTree(List<PlgDept> depts){
        List<PlgDeptTree> list = new ArrayList<>();
        if(depts == null || depts.size() == 0){
            return list;
        }
        for(int i=0,len=depts.size();i<len;i++){
            PlgDeptTree vo = new PlgDeptTree(depts.get(i));
            list.add(vo);
        }
        return list;
    }

    /**
     * 将dept转换为treeview格式的数据
     * @param depts
     * @return
     */
    public static List<DeptTreeView> convertDeptToTreeView(List<PlgDept> depts){
        List<DeptTreeView> list = new ArrayList<>();
        if(depts == null || depts.size() == 0){
            return list;
        }
        for(int i=0,len=depts.size();i<len;i++){
            DeptTreeView vo = new DeptTreeView(depts.get(i));
            list.add(vo);
        }
        return list;
    }

    /**
     * 将menu转换为treeview格式的数据
     * @param menus
     * @return
     */
    public static List<MenuTree> convertMenuToTreeView(List<PlgMenu> menus){
        List<MenuTree> list = new ArrayList<>();
        if(menus == null || menus.size() == 0){
            return list;
        }
        for(int i=0,len=menus.size();i<len;i++){
            MenuTree vo = new MenuTree(menus.get(i));
            list.add(vo);
        }
        return list;
    }

    public static PlgMenu convertMenuToVo(MenuVo menuVo) {
        if(menuVo == null){
            return null;
        }
        PlgMenu menu = new PlgMenu();
        Integer id = StringUtils.isBlank(menuVo.getId()) ? null:Integer.parseInt(menuVo.getId());
        Integer parentId = StringUtils.isBlank(menuVo.getParentId()) ? 0:Integer.parseInt(menuVo.getParentId());
        Integer status = StringUtils.isBlank(menuVo.getStatus()) ? 0:Integer.parseInt(menuVo.getStatus());
        Integer orderNum = StringUtils.isBlank(menuVo.getOrderNumber()) ? 1:Integer.parseInt(menuVo.getOrderNumber());
        menu.setId(id);
        menu.setParentId(parentId);
        menu.setMenuName(menuVo.getMenuName());
        menu.setMenuUrl(menuVo.getMenuUrl());
        menu.setType(menuVo.getType());
        menu.setOrderNumber(orderNum);
        menu.setStatus(status);
        return menu;
    }
}
