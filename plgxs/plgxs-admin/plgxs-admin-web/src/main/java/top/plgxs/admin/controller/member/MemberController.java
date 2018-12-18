package top.plgxs.admin.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.plgxs.admin.entity.Member;
import top.plgxs.admin.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/test")
    public String test(){
        return "/member/memberList";
    }

    @GetMapping("findOne")
    @ResponseBody
    public Member findOne(){
        return memberService.selectByPrimaryKey("1");
    }
}
