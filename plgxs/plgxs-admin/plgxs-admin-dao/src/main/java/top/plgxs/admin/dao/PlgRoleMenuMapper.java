package top.plgxs.admin.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import top.plgxs.admin.entity.PlgRoleMenuExample;
import top.plgxs.admin.entity.PlgRoleMenuKey;

public interface PlgRoleMenuMapper {
    long countByExample(PlgRoleMenuExample example);

    int deleteByExample(PlgRoleMenuExample example);

    int deleteByPrimaryKey(PlgRoleMenuKey key);

    int insert(PlgRoleMenuKey record);

    int insertSelective(PlgRoleMenuKey record);

    List<PlgRoleMenuKey> selectByExample(PlgRoleMenuExample example);

    int updateByExampleSelective(@Param("record") PlgRoleMenuKey record, @Param("example") PlgRoleMenuExample example);

    int updateByExample(@Param("record") PlgRoleMenuKey record, @Param("example") PlgRoleMenuExample example);

    int deleteByRoleId(@Param("roleId") String roleId);

    void batchInsert(List<PlgRoleMenuKey> keyList);
}