package top.plgxs.admin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.plgxs.admin.dao.MemberMapper;
import top.plgxs.admin.entity.Member;
import top.plgxs.admin.service.MemberService;

import javax.annotation.Resource;

@Service
public class MemberServiceImpl implements MemberService{
    @Autowired
    private MemberMapper memberMapper;

    @Override
    public Member selectByPrimaryKey(String id){
        return memberMapper.selectByPrimaryKey(id);
    }
}
