package top.plgxs.admin.controller.system;

import com.github.pagehelper.PageInfo;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import top.plgxs.admin.entity.PlgDept;
import top.plgxs.admin.entity.vo.DeptTreeView;
import top.plgxs.admin.entity.vo.DeptVO;
import top.plgxs.admin.entity.vo.PlgDeptTree;
import top.plgxs.admin.service.DeptService;
import top.plgxs.admin.utils.PageUtils;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.page.PageResult;
import top.plgxs.common.result.ResultCode;
import top.plgxs.common.result.ResultInfo;
import top.plgxs.common.result.ResultUtil;

import java.util.List;

/**
 * 部门管理
 * @author Strangers。
 * @version 1.0.0
 * @date 15:57 2019/3/13
 */
@Controller
@RequestMapping("/dept")
public class DepartmentController {
    @Autowired
    private DeptService deptService;

    /**
     * 跳转部门首页
     * @return
     */
    @RequestMapping("/index")
    public String index(){
        return "/dept/index";
    }

    /**
     * 获取部门列表
     * @return
     */
    @PostMapping("/deptTree")
    @ResponseBody
    public List<PlgDeptTree> queryTree(){
        List<PlgDeptTree> list = deptService.findAll();
        return list;
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
        int result = deptService.switchState(id, state);
        if (result > 0) {
            return ResultUtil.getSuccessResult(null);
        }
        return ResultUtil.getFailResult(ResultCode.SAVE_ERROR);
    }

    /**
     * 保存部门信息
     * @param dept
     * @return
     */
    @PostMapping("/saveDept")
    @ResponseBody
    public ResultInfo<PlgDept> saveDept(@RequestBody PlgDept dept) {
        return deptService.saveDept(dept);
    }

    /**
     * 根据主键查询
     * @param id
     * @return
     */
    @GetMapping("/queryById/{id}")
    @ResponseBody
    public PlgDept queryById(@PathVariable("id") Integer id){
        return deptService.queryById(id);
    }

    /**
     * 单条删除
     * @param id
     * @return
     */
    @GetMapping("/deleteDeptById/{id}")
    @ResponseBody
    public ResultInfo<String> deleteDeptById(@PathVariable("id") Integer id){
        return deptService.deleteById(id);
    }


    /**
     * 获取ztree格式的数据
     * @return
     */
    @PostMapping("/getDeptTreeViewData")
    @ResponseBody
    public ResultInfo<List<DeptTreeView>> getDeptTreeViewData(){
        return deptService.getDeptTreeViewData();
    }
}
