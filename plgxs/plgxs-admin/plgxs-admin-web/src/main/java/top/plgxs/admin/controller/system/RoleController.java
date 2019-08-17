package top.plgxs.admin.controller.system;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import top.plgxs.admin.entity.PlgRole;
import top.plgxs.admin.entity.PlgUser;
import top.plgxs.admin.service.RoleService;
import top.plgxs.admin.utils.PageUtils;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.page.PageResult;
import top.plgxs.common.result.ResultCode;
import top.plgxs.common.result.ResultInfo;
import top.plgxs.common.result.ResultUtil;

import java.util.List;

/**
 * 角色管理
 * @author Strangers。
 * @version 1.0.0
 * @date 11:07 2019/3/11
 */
@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    /**
     * 跳转角色首页
     * @return
     */
    @RequestMapping("/index")
    public String index(){
        return "/role/index";
    }

    /**
     * 分页列表
     * @param param
     * @return
     */
    @PostMapping("/queryList")
    @ResponseBody
    public PageResult<PlgRole> queryList(@RequestBody PageParam param) {
        PageInfo<PlgRole> pageInfo = roleService.queryList(param);
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
    public ResultInfo<String> switchState(@PathVariable("id") String id, Integer state){
        int result = roleService.switchState(id, state);
        if (result > 0) {
            return ResultUtil.getSuccessResult(null);
        }
        return ResultUtil.getFailResult(ResultCode.SAVE_ERROR);
    }

    /**
     * 保存角色信息
     * @param role
     * @return
     */
    @PostMapping("/saveRole")
    @ResponseBody
    public ResultInfo<PlgRole> saveRole(@RequestBody PlgRole role) {
        return roleService.saveRole(role);
    }

    /**
     * 根据主键查询
     * @param id
     * @return
     */
    @GetMapping("/queryById/{id}")
    @ResponseBody
    public PlgRole queryById(@PathVariable("id") String id){
        return roleService.queryById(id);
    }

    /**
     * 单条删除
     * @param id
     * @return
     */
    @GetMapping("/deleteRoleById/{id}")
    @ResponseBody
    public ResultInfo<String> deleteRoleById(@PathVariable("id") String id){
        return roleService.deleteRoleById(id);
    }

    /**
     * 查询全部有效的角色
     * @return
     */
    @PostMapping("/findAll")
    @ResponseBody
    public ResultInfo<List<PlgRole>> findAll(){
        return roleService.findAll();
    }

}
