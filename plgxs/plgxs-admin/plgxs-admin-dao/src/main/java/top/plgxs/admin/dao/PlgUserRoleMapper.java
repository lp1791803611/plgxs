package top.plgxs.admin.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import top.plgxs.admin.entity.PlgUserRoleExample;
import top.plgxs.admin.entity.PlgUserRoleKey;

public interface PlgUserRoleMapper {
    long countByExample(PlgUserRoleExample example);

    int deleteByExample(PlgUserRoleExample example);

    int deleteByPrimaryKey(PlgUserRoleKey key);

    int insert(PlgUserRoleKey record);

    int insertSelective(PlgUserRoleKey record);

    List<PlgUserRoleKey> selectByExample(PlgUserRoleExample example);

    int updateByExampleSelective(@Param("record") PlgUserRoleKey record, @Param("example") PlgUserRoleExample example);

    int updateByExample(@Param("record") PlgUserRoleKey record, @Param("example") PlgUserRoleExample example);

    void batchInsert(List<PlgUserRoleKey> list);
}