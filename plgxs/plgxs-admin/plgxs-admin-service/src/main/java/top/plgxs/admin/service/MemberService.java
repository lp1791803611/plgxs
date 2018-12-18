package top.plgxs.admin.service;

import top.plgxs.admin.entity.Member;

public interface MemberService {
    Member selectByPrimaryKey(String id);
}
