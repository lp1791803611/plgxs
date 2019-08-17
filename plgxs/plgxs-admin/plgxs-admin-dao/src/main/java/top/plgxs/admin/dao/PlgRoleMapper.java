package top.plgxs.admin.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import top.plgxs.admin.entity.PlgRole;
import top.plgxs.admin.entity.PlgRoleExample;

public interface PlgRoleMapper {
    long countByExample(PlgRoleExample example);

    int deleteByExample(PlgRoleExample example);

    int deleteByPrimaryKey(String id);

    int insert(PlgRole record);

    int insertSelective(PlgRole record);

    List<PlgRole> selectByExample(PlgRoleExample example);

    PlgRole selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") PlgRole record, @Param("example") PlgRoleExample example);

    int updateByExample(@Param("record") PlgRole record, @Param("example") PlgRoleExample example);

    int updateByPrimaryKeySelective(PlgRole record);

    int updateByPrimaryKey(PlgRole record);

    /**
     * 条件查询
     * @param queryKey
     * @return
     */
    List<PlgRole> selectByParam(@Param("queryKey") String queryKey);

    /**
     * 状态开关
     * @param role
     * @return
     */
    int switchState(PlgRole role);
}