package top.plgxs.admin.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.github.pagehelper.PageInfo;

import top.plgxs.admin.entity.PlgUser;
import top.plgxs.admin.service.UserService;
import top.plgxs.admin.utils.PageUtils;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.page.PageResult;
import top.plgxs.common.result.ResultInfo;

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
}
