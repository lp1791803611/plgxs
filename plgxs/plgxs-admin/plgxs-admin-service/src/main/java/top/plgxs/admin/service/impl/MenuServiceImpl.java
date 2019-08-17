package top.plgxs.admin.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.plgxs.admin.dao.PlgMenuMapper;
import top.plgxs.admin.dao.PlgRoleMenuMapper;
import top.plgxs.admin.entity.PlgMenu;
import top.plgxs.admin.entity.PlgMenuExample;
import top.plgxs.admin.entity.PlgRoleMenuExample;
import top.plgxs.admin.entity.PlgRoleMenuKey;
import top.plgxs.admin.entity.vo.MenuTree;
import top.plgxs.admin.entity.vo.MenuVo;
import top.plgxs.admin.service.MenuService;
import top.plgxs.admin.utils.ConvertUtils;
import top.plgxs.common.TimeUtil;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.result.ResultCode;
import top.plgxs.common.result.ResultInfo;
import top.plgxs.common.result.ResultUtil;

import java.util.*;

/**
 * @author Strangers。
 * @version 1.0.0
 * @date 18:35 2019/8/10
 */
@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private PlgMenuMapper menuMapper;
    @Autowired
    private PlgRoleMenuMapper roleMenuMapper;

    @Override
    public PageInfo<PlgMenu> queryList(Integer pid, PageParam param) {
        if(param == null){
            return null;
        }
        // 判断该菜单是否为根菜单
        boolean isRoot = isRootMenu(pid);
        PlgMenu menu = new PlgMenu();
        menu.setParentId(pid);
        menu.setMenuName(param.getQueryKey());
        List<PlgMenu> list = null;
        // 开启分页
        PageHelper.startPage(param.getPage(),param.getPageSize());
        if(isRoot){
            menu.setType("1");
            list = menuMapper.queryList(menu);
        }else{
            menu.setType("0");
            list = menuMapper.queryList(menu);
        }
        PageInfo<PlgMenu> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 根据id判断是否为根节点，true-是，false-否
     * @param pid
     * @return
     */
    private boolean isRootMenu(Integer pid){
        PlgMenuExample example = new PlgMenuExample();
        PlgMenuExample.Criteria criteria = example.createCriteria();
        criteria.andTypeEqualTo("0");
        criteria.andParentIdEqualTo(pid);
        List<PlgMenu> list = menuMapper.selectByExample(example);
        if(list != null && list.size() > 0){
            return false;
        }else{
            return true;
        }
    }

    @Override
    public int switchState(Integer id, Integer state) {
        PlgMenu record = new PlgMenu();
        record.setId(id);
        record.setStatus(state);
        return menuMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public ResultInfo<String> save(MenuVo menuVo) {
        if(menuVo == null){
            return null;
        }
        int result = -1;
        PlgMenu menu = ConvertUtils.convertMenuToVo(menuVo);
        if(menu.getId() != null && menu.getId() > 0){
            result = menuMapper.updateByPrimaryKeySelective(menu);
        }else {
            menu.setCreateTime(new Date());
            result = menuMapper.insert(menu);
        }
        if(result > 0){
            return ResultUtil.getSuccessResult(null);
        }
        return ResultUtil.getFailResult(ResultCode.SAVE_ERROR);
    }

    @Override
    public PlgMenu queryById(Integer id) {
        return menuMapper.selectByPrimaryKey(id);
    }

    @Override
    public ResultInfo<String> deleteById(Integer id) {
        int result = menuMapper.deleteByPrimaryKey(id);
        if(result > 0){
            return ResultUtil.getSuccessResult(null);
        }
        return ResultUtil.getFailResult(ResultCode.SAVE_ERROR);
    }

    @Override
    public List<MenuTree> getTree() {
        List<MenuTree> trees = new ArrayList<>();
        //  查询所有可用的菜单
        PlgMenuExample example = new PlgMenuExample();
        PlgMenuExample.Criteria criteria = example.createCriteria();
        criteria.andTypeEqualTo("0");
        criteria.andStatusEqualTo(0);
        example.setOrderByClause("order_number ASC");
        List<PlgMenu> menuList = menuMapper.selectByExample(example);
        // 将菜单列表转为treeview格式
        List<MenuTree> treeList = ConvertUtils.convertMenuToTreeView(menuList);
        if(treeList != null && treeList.size() > 0){
            Map<Integer,MenuTree> map = new HashMap<>();
            // 将所有菜单放入map中，组合父子关系时需要用到
            for(MenuTree tree : treeList){
                map.put(tree.getId(),tree);
            }
            // 组合父子关系
            for(int i=0,len=treeList.size();i<len;i++){
                // 把所有菜单都当作子菜单
                MenuTree child = treeList.get(i);
                // 如果子菜单的pid为0,则就是根目录，否则一定有父菜单
                if(child.getPid() == 0){
                    trees.add(child);
                }else{
                    // 父菜单
                    MenuTree parent = map.get(child.getPid());
                    // 组合父子关系
                    parent.getNodes().add(child);
                }
            }
        }
        return trees;
    }

    @Override
    public List<Integer> getMenuIdsByRoleId(String roleId) {
        if(StringUtils.isBlank(roleId)){
            return null;
        }
        List<Integer> list = new ArrayList<>();
        PlgRoleMenuExample example = new PlgRoleMenuExample();
        PlgRoleMenuExample.Criteria criteria = example.createCriteria();
        criteria.andRoleIdEqualTo(roleId);
        List<PlgRoleMenuKey> roleMenuKeys = roleMenuMapper.selectByExample(example);
        if(roleMenuKeys != null && roleMenuKeys.size() > 0){
            for(PlgRoleMenuKey key : roleMenuKeys){
                list.add(key.getMenuId());
            }
        }
        return list;
    }

    @Override
    public List<MenuTree> getMenuTree(String roleId) {
        // 查询角色已存在的权限id，并放入map中
        Map<Integer,Object> menuRoleMap = new HashMap<>();
        if(StringUtils.isNotBlank(roleId)){
            PlgRoleMenuExample example = new PlgRoleMenuExample();
            PlgRoleMenuExample.Criteria criteria = example.createCriteria();
            criteria.andRoleIdEqualTo(roleId);
            List<PlgRoleMenuKey> roleMenuKeys = roleMenuMapper.selectByExample(example);
            if(roleMenuKeys != null && roleMenuKeys.size() > 0){
                for(PlgRoleMenuKey key : roleMenuKeys){
                    menuRoleMap.put(key.getMenuId(),null);
                }
            }
        }

        List<MenuTree> trees = new ArrayList<>();
        //  查询所有可用的菜单
        PlgMenuExample example = new PlgMenuExample();
        PlgMenuExample.Criteria criteria = example.createCriteria();
        criteria.andTypeEqualTo("0");
        criteria.andStatusEqualTo(0);
        example.setOrderByClause("order_number ASC");
        List<PlgMenu> menuList = menuMapper.selectByExample(example);
        // 将菜单列表转为treeview格式
        List<MenuTree> treeList = ConvertUtils.convertMenuToTreeView(menuList);
        if(treeList != null && treeList.size() > 0){
            Map<Integer,MenuTree> map = new HashMap<>();
            // 将所有菜单放入map中，组合父子关系时需要用到
            for(MenuTree tree : treeList){
                if(menuRoleMap.containsKey(tree.getId())){
                    tree.getState().put("checked",true);
                }else{
                    tree.getState().put("checked",false);
                }
                map.put(tree.getId(),tree);
            }
            // 组合父子关系
            for(int i=0,len=treeList.size();i<len;i++){
                // 把所有菜单都当作子菜单
                MenuTree child = treeList.get(i);
                // 如果子菜单的pid为0,则就是根目录，否则一定有父菜单
                if(child.getPid() == 0){
                    trees.add(child);
                }else{
                    // 父菜单
                    MenuTree parent = map.get(child.getPid());
                    // 组合父子关系
                    parent.getNodes().add(child);
                }
            }
        }
        return trees;
    }

    @Transactional
    @Override
    public ResultInfo<String> saveRoleMenu(String roleId, String menuIds) {
        if(StringUtils.isBlank(roleId) || StringUtils.isBlank(menuIds)){
            return ResultUtil.getFailResult(ResultCode.SAVE_ERROR);
        }
        List<PlgRoleMenuKey> keyList = new ArrayList<>();
        String[] arr = menuIds.split(",");
        if(arr != null && arr.length > 0){
            for(int i=0,len=arr.length;i<len;i++){
                Integer menuId = Integer.parseInt(arr[i]);
                PlgRoleMenuKey key = new PlgRoleMenuKey();
                key.setMenuId(menuId);
                key.setRoleId(roleId);
                keyList.add(key);
            }
        }
        // 先删除角色权限关系，再重新插入关系
        roleMenuMapper.deleteByRoleId(roleId);
        roleMenuMapper.batchInsert(keyList);
        return ResultUtil.getSuccessResult();
    }
}
