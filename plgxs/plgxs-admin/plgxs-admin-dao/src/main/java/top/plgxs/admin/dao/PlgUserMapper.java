package top.plgxs.admin.dao;

import top.plgxs.admin.entity.PlgUser;

public interface PlgUserMapper {
    int deleteByPrimaryKey(String id);

    int insert(PlgUser record);

    int insertSelective(PlgUser record);

    PlgUser selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PlgUser record);

    int updateByPrimaryKey(PlgUser record);
}