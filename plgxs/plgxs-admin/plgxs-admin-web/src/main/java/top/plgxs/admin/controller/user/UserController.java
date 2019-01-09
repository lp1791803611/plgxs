package top.plgxs.admin.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

    /**
     * @description: 默认页面
     * @param: [request]
     * @return: java.lang.String
     * @author: chengpunan
     * @date: 2018/12/31 15:47
     */
    @GetMapping("/index")
    public String index(HttpServletRequest request){
        return "/user/index";
    }
}
