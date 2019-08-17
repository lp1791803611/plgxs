package top.plgxs.admin.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import top.plgxs.admin.entity.PlgUserDeptExample;
import top.plgxs.admin.entity.PlgUserDeptKey;

public interface PlgUserDeptMapper {
    long countByExample(PlgUserDeptExample example);

    int deleteByExample(PlgUserDeptExample example);

    int deleteByPrimaryKey(PlgUserDeptKey key);

    int insert(PlgUserDeptKey record);

    int insertSelective(PlgUserDeptKey record);

    List<PlgUserDeptKey> selectByExample(PlgUserDeptExample example);

    int updateByExampleSelective(@Param("record") PlgUserDeptKey record, @Param("example") PlgUserDeptExample example);

    int updateByExample(@Param("record") PlgUserDeptKey record, @Param("example") PlgUserDeptExample example);

    void batchInsert(List<PlgUserDeptKey> list);
}