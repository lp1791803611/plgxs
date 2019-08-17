package top.plgxs.admin.dao;

import org.apache.ibatis.annotations.Param;
import top.plgxs.admin.entity.PlgDept;
import top.plgxs.admin.entity.PlgDeptExample;

import java.util.List;

public interface PlgDeptMapper {
    long countByExample(PlgDeptExample example);

    int deleteByExample(PlgDeptExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(PlgDept record);

    int insertSelective(PlgDept record);

    List<PlgDept> selectByExample(PlgDeptExample example);

    PlgDept selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") PlgDept record, @Param("example") PlgDeptExample example);

    int updateByExample(@Param("record") PlgDept record, @Param("example") PlgDeptExample example);

    int updateByPrimaryKeySelective(PlgDept record);

    int updateByPrimaryKey(PlgDept record);

    /**
     * 开关状态
     * @param dept
     * @return
     */
    int switchState(PlgDept dept);

    /**
     * 条件查询
     * @param queryKey
     * @return
     */
    List<PlgDept> selectByParam(@Param("queryKey") String queryKey);
}