package top.plgxs.admin.dao;

import top.plgxs.admin.entity.PlgUserOpen;

public interface PlgUserOpenMapper {
    int deleteByPrimaryKey(String openId);

    int insert(PlgUserOpen record);

    int insertSelective(PlgUserOpen record);

    PlgUserOpen selectByPrimaryKey(String openId);

    int updateByPrimaryKeySelective(PlgUserOpen record);

    int updateByPrimaryKey(PlgUserOpen record);
}