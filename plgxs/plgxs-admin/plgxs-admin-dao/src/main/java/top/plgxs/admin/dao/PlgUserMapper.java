package top.plgxs.admin.dao;

import org.apache.ibatis.annotations.Param;
import top.plgxs.admin.entity.PlgUser;

import java.util.List;

public interface PlgUserMapper {
    int deleteByPrimaryKey(String id);

    int insert(PlgUser record);

    int insertSelective(PlgUser record);

    PlgUser selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PlgUser record);

    int updateByPrimaryKey(PlgUser record);

    List<PlgUser> selectByParam(@Param("key") String key);
}