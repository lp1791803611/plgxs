package top.plgxs.admin.controller.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 登录
 * @author Strangers。
 * @version 1.0.0
 * @date 15:33 2019/1/31
 */
@Controller
@RequestMapping("")
public class LoginController {

    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        return "/index";
    }
}
