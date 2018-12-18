package top.plgxs.admin.dao;

import top.plgxs.admin.entity.Member;

public interface MemberMapper {
    int deleteByPrimaryKey(String id);

    int insert(Member record);

    int insertSelective(Member record);

    Member selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Member record);

    int updateByPrimaryKey(Member record);
}