package top.plgxs.admin.controller.system;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import top.plgxs.admin.entity.PlgMenu;
import top.plgxs.admin.entity.vo.MenuTree;
import top.plgxs.admin.entity.vo.MenuVo;
import top.plgxs.admin.service.MenuService;
import top.plgxs.admin.utils.PageUtils;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.page.PageResult;
import top.plgxs.common.result.ResultCode;
import top.plgxs.common.result.ResultInfo;
import top.plgxs.common.result.ResultUtil;

import java.util.List;

/**
 * 菜单管理
 * @author Strangers。
 * @version 1.0.0
 * @date 18:04 2019/8/10
 */
@RequestMapping("/menu")
@Controller
public class MenuController {
    @Autowired
    private MenuService menuService;
    /**
     * 跳转菜单首页
     * @return
     */
    @RequestMapping("/index")
    public String index(Model model){
        return "/menu/index";
    }

    /**
     * 分页查询菜单
     * @param pid 父菜单
     * @param param 分页组件
     * @return
     */
    @PostMapping("/{pid}/queryList")
    @ResponseBody
    public PageResult<PlgMenu> queryList(@PathVariable("pid") Integer pid, @RequestBody PageParam param){
        PageInfo<PlgMenu> pageInfo = menuService.queryList(pid,param);
        if (pageInfo != null) {
            return PageUtils.convertResult(pageInfo);
        }
        return null;
    }

    /**
     * 状态开关
     * @param id
     * @param state
     * @return
     */
    @RequestMapping("/{id}/switchState")
    @ResponseBody
    public ResultInfo<String> switchState(@PathVariable("id") Integer id, Integer state){
        int result = menuService.switchState(id, state);
        if (result > 0) {
            return ResultUtil.getSuccessResult(null);
        }
        return ResultUtil.getFailResult(ResultCode.SAVE_ERROR);
    }

    /**
     * 保存部门信息
     * @param menu
     * @return
     */
    @PostMapping("/saveMenu")
    @ResponseBody
    public ResultInfo<String> saveMenu(@RequestBody MenuVo menu) {
        return menuService.save(menu);
    }

    /**
     * 根据主键查询
     * @param id
     * @return
     */
    @GetMapping("/queryById/{id}")
    @ResponseBody
    public PlgMenu queryById(@PathVariable("id") Integer id){
        return menuService.queryById(id);
    }

    /**
     * 单条删除
     * @param id
     * @return
     */
    @GetMapping("/deleteById/{id}")
    @ResponseBody
    public ResultInfo<String> deleteById(@PathVariable("id") Integer id){
        return menuService.deleteById(id);
    }


    /**
     * 获取bootstrap treeview格式的数据
     * @return
     */
    @PostMapping("/getTree")
    @ResponseBody
    public List<MenuTree> getTree(){
        return menuService.getTree();
    }

    /**
     * 获取bootstrap treeview格式的数据
     * 回显已选中的菜单
     * @return
     */
    @PostMapping("/{roleId}/getMenuTree")
    @ResponseBody
    public ResultInfo<List<MenuTree>> getMenuTree(@PathVariable("roleId") String roleId){
        List<MenuTree> menuTrees = menuService.getMenuTree(roleId);
        return ResultUtil.getSuccessResult(menuTrees);
    }

    /**
     * 保存角色权限关系
     * @param roleId
     * @return
     */
    @PostMapping("/{roleId}/saveRoleMenu")
    @ResponseBody
    public ResultInfo<String> saveRoleMenu(@PathVariable("roleId") String roleId, @RequestBody String menuIds){
        try {
            return menuService.saveRoleMenu(roleId, menuIds);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.getFailResult(ResultCode.SYSTEM_INNER_ERROR);
        }
    }
}
