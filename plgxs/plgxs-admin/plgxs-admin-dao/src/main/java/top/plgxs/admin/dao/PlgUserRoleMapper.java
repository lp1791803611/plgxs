package top.plgxs.admin.dao;

import top.plgxs.admin.entity.PlgUserRoleKey;

public interface PlgUserRoleMapper {
    int deleteByPrimaryKey(PlgUserRoleKey key);

    int insert(PlgUserRoleKey record);

    int insertSelective(PlgUserRoleKey record);
}