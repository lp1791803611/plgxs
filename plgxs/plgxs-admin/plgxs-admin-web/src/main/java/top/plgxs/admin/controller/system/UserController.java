package top.plgxs.admin.controller.system;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.github.pagehelper.PageInfo;

import top.plgxs.admin.entity.PlgRole;
import top.plgxs.admin.entity.PlgUser;
import top.plgxs.admin.entity.vo.PlgUserVO;
import top.plgxs.admin.service.RoleService;
import top.plgxs.admin.service.UserService;
import top.plgxs.admin.utils.PageUtils;
import top.plgxs.common.export.ExportExcel;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.page.PageResult;
import top.plgxs.common.result.ResultCode;
import top.plgxs.common.result.ResultInfo;
import top.plgxs.common.result.ResultUtil;

import java.util.Arrays;
import java.util.List;

/**
 *  用户管理
 * @author lipian
 * @date 2018/12/31 15:37
 * @version 1.0.0
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    /**
     *  默认页面
     * @param request
     * @return java.lang.String
     * @author Strangers。
     * @date 10:53 2019/1/30
     */
    @GetMapping("/index")
    public String index(HttpServletRequest request) {
        return "/user/index";
    }

    /**
     *  分页查询
     * @param param
     * @return PageResult<PlgUser>
     * @author Strangers。
     * @date 10:52 2019/1/30
     */
    @PostMapping("/queryList")
    @ResponseBody
    public PageResult<PlgUser> queryList(@RequestBody PageParam param) {
        PageInfo<PlgUser> pageInfo = userService.queryList(param);
        if (pageInfo != null) {
            return PageUtils.convertResult(pageInfo);
        }
        return null;
    }

    /**
     * 根据主键查询用户信息
     * @param id 主键
     * @return top.plgxs.admin.entity.PlgUser
     * @author Strangers。
     * @date 10:57 2019/1/30
     */
    @GetMapping("/queryById/{id}")
    @ResponseBody
    public PlgUser queryById(@PathVariable("id") String id) {
        return userService.queryById(id);
    }

    /**
     *  保存用户信息
     * @param user
     * @return top.plgxs.common.result.ResultInfo<top.plgxs.admin.entity.PlgUser>
     * @author Strangers。
     * @date 10:39 2019/1/30
     */
    @PostMapping("/saveUser")
    @ResponseBody
    public ResultInfo<PlgUser> saveUser(@RequestBody PlgUser user) {
        return userService.saveUser(user);

    }

    /**
     * 根据主键删除
     * @param id
     * @return
     */
    @GetMapping("/deleteUserById/{id}")
    @ResponseBody
    public ResultInfo<String> deleteUserById(@PathVariable("id") String id) {
        int result = userService.deleteUserById(id);
        if (result > 0) {
            return ResultUtil.getSuccessResult(null);
        }
        return ResultUtil.getFailResult(ResultCode.SAVE_ERROR);
    }

    /**
     * 修改用户状态
     * @param id
     * @param state
     * @return
     */
    @RequestMapping("/{id}/switchState")
    @ResponseBody
    public ResultInfo<String> switchState(@PathVariable("id") String id,Integer state){
        int result = userService.switchState(id, state);
        if (result > 0) {
            return ResultUtil.getSuccessResult(null);
        }
        return ResultUtil.getFailResult(ResultCode.SAVE_ERROR);
    }

    /**
     * 导出excel
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/exportExcel")
    public void exportExcel(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String queryKey = request.getParameter("queryKey");
        List<PlgUserVO> list = userService.queryAll(queryKey);
        String title = "用户列表";
        String[] rowName = {"#","用户名","手机","邮箱","昵称","性别","真实姓名","身份证号","注册时间","登陆次数","最后登录时间","更新时间","状态"};
        String[] methodName = {"getId", "getUsername", "getMobile", "getEmail", "getNickname", "getGender", "getRealname",
                "getIdNumber", "getRegisterTime", "getLoginNumber", "getLastLoginTime", "getUpdateTime", "getStatus"};
        ExportExcel ex = new ExportExcel();
        ex.exportExcel(list,title,rowName,methodName,request,response);
    }

    /**
     * 根据用户id查询角色信息
     * @param id
     * @return
     */
    @PostMapping("/{id}/assignRole")
    @ResponseBody
    public JSONObject assignRole(@PathVariable("id") String id){
        ResultInfo<List<PlgRole>> roleResult = roleService.findAll();
        List<PlgRole> roleList = roleResult.getData();
        List<String> roleIds = userService.findRoleByUserId(id);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("roleList",roleList);
        jsonObject.put("roleIds",roleIds);
        return jsonObject;
    }

    /**
     * 保存用户角色关系
     * @param userId 用户id
     * @param roleIds 角色id数组
     * @return
     */
    @PostMapping("/{id}/saveUserRole")
    @ResponseBody
    public ResultInfo<String> saveUserRole(@PathVariable("id") String userId,@RequestBody JSONArray roleIds){
        return userService.saveUserRole(userId,roleIds);
    }

    /**
     * 根据用户id查询部门id
     * @param id
     * @return
     */
    @PostMapping("/{id}/assignDept")
    @ResponseBody
    public ResultInfo<String> assignDept(@PathVariable("id") String id){
        List<Integer> deptList = userService.findDeptByUserId(id);
        StringBuilder sb = new StringBuilder();
        if(deptList != null && deptList.size()>0){
            for(int i=0,len=deptList.size();i<len;i++){
                if(i == 0){
                    sb.append(String.valueOf(deptList.get(i)));
                }else{
                    sb.append(",").append(String.valueOf(deptList.get(i)));
                }
            }
        }
        return ResultUtil.getSuccessResult(sb.toString());
    }

    /**
     * 保存用户部门信息
     * @return
     */
    @PostMapping("/{id}/saveUserDept")
    @ResponseBody
    public ResultInfo<String> saveUserDept(@PathVariable("id") String userId, @RequestBody String deptIds){
        return userService.saveUserDept(userId,deptIds);
    }
}
