package top.plgxs.admin.controller.user;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import top.plgxs.admin.entity.PlgUser;
import top.plgxs.admin.service.UserService;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.page.PageResult;
import top.plgxs.common.result.ResultInfo;

import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName: UserController
 * @Description: 用户管理模块
 * @Author: lipian
 * @Date: 2018/12/31 15:37
 * @Version: 1.0
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * @Description: 默认页面
     * @Author: Strangers。
     * @Date: 16:40 2019/1/14
     * @Param: [request]
     * @return: java.lang.String
     **/
    @GetMapping("/index")
    public String index(HttpServletRequest request){
        return "/user/index";
    }

    /**
     * @Description: 分页查询
     * @Author: Strangers。
     * @Date: 16:06 2019/1/17
     * @Param: [param]
     * @return: top.plgxs.common.page.PageResult<top.plgxs.admin.entity.PlgUser>
     **/
    @PostMapping("/queryList")
    public PageResult<PlgUser> queryList(@RequestBody PageParam param){
        PageInfo<PlgUser> pageInfo = userService.queryList(param);
        if(pageInfo != null){
            return new PageResult<>(pageInfo.getList(),pageInfo.getTotal());
        }
        return null;
    }

    @PostMapping("/saveUser")
    public ResultInfo<PlgUser> saveUser(@RequestBody PlgUser user){
        return userService.saveUser(user);
    }
}
