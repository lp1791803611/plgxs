package top.plgxs.admin.dao;

import top.plgxs.admin.entity.PlgRole;

public interface PlgRoleMapper {
    int deleteByPrimaryKey(String id);

    int insert(PlgRole record);

    int insertSelective(PlgRole record);

    PlgRole selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PlgRole record);

    int updateByPrimaryKey(PlgRole record);
}