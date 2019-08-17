package top.plgxs.admin.service;

import com.github.pagehelper.PageInfo;
import top.plgxs.admin.entity.PlgMenu;
import top.plgxs.admin.entity.vo.MenuTree;
import top.plgxs.admin.entity.vo.MenuVo;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.result.ResultInfo;

import java.util.List;

/**
 * @author Strangers。
 * @version 1.0.0
 * @date 18:35 2019/8/10
 */
public interface MenuService {

    /**
     * 分页查询子菜单
     * @param pid
     * @param param
     * @return
     */
    PageInfo<PlgMenu> queryList(Integer pid, PageParam param);

    /**
     * 开关状态
     * @param id
     * @param state
     * @return
     */
    int switchState(Integer id, Integer state);

    /**
     * 保存
     * @param menu
     * @return
     */
    ResultInfo<String> save(MenuVo menu);

    /**
     * 根据主键查询
     * @param id
     * @return
     */
    PlgMenu queryById(Integer id);

    /**
     * 根据主键删除
     * @param id
     * @return
     */
    ResultInfo<String> deleteById(Integer id);

    /**
     * treeview格式数据
     * @return
     */
    List<MenuTree> getTree();

    /**
     * 根据角色id查询权限id
     * @param roleId
     * @return
     */
    List<Integer> getMenuIdsByRoleId(String roleId);

    /**
     * 根据角色id查询treeview树
     * @param roleId
     * @return
     */
    List<MenuTree> getMenuTree(String roleId);

    /**
     * 保存角色权限关系
     * @param roleId
     * @param menuIds
     * @return
     */
    ResultInfo<String> saveRoleMenu(String roleId, String menuIds);
}
