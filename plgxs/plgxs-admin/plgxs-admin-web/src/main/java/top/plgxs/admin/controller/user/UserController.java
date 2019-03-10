package top.plgxs.admin.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.github.pagehelper.PageInfo;

import top.plgxs.admin.entity.PlgUser;
import top.plgxs.admin.entity.vo.PlgUserVO;
import top.plgxs.admin.service.UserService;
import top.plgxs.admin.utils.PageUtils;
import top.plgxs.common.export.ExportExcel;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.page.PageResult;
import top.plgxs.common.result.ResultCode;
import top.plgxs.common.result.ResultInfo;
import top.plgxs.common.result.ResultUtil;

import java.util.List;

/**
 *  用户管理模块
 * @author lipian
 * @date 2018/12/31 15:37
 * @version 1.0.0
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

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
}
