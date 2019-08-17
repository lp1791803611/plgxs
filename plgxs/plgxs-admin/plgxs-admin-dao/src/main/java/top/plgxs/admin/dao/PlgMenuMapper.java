package top.plgxs.admin.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import top.plgxs.admin.entity.PlgMenu;
import top.plgxs.admin.entity.PlgMenuExample;

public interface PlgMenuMapper {
    long countByExample(PlgMenuExample example);

    int deleteByExample(PlgMenuExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(PlgMenu record);

    int insertSelective(PlgMenu record);

    List<PlgMenu> selectByExample(PlgMenuExample example);

    PlgMenu selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") PlgMenu record, @Param("example") PlgMenuExample example);

    int updateByExample(@Param("record") PlgMenu record, @Param("example") PlgMenuExample example);

    int updateByPrimaryKeySelective(PlgMenu record);

    int updateByPrimaryKey(PlgMenu record);

    List<PlgMenu> queryList(PlgMenu menu);
}