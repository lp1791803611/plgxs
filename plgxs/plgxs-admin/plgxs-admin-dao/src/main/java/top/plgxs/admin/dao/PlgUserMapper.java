package top.plgxs.admin.dao;

import org.apache.ibatis.annotations.Param;
import top.plgxs.admin.entity.PlgUser;
import top.plgxs.admin.entity.vo.PlgUserVO;

import java.util.List;

public interface PlgUserMapper {
    /**
     * @Description: 根据主键删除
     * @Author: Strangers。
     * @Date: 17:42 2019/1/21
     * @Param: [id]
     * @return: int
     **/
    int deleteByPrimaryKey(String id);

    /**
     * @Description: 插入
     * @Author: Strangers。
     * @Date: 17:41 2019/1/21
     * @Param: [record]
     * @return: int
     **/
    int insert(PlgUser record);

    /**
     * @Description: 选择性插入
     * @Author: Strangers。
     * @Date: 17:39 2019/1/21
     * @Param: [record]
     * @return: int
     **/
    int insertSelective(PlgUser record);

    /**
     * @Description: 根据主键进行查询
     * @Author: Strangers。
     * @Date: 17:39 2019/1/21
     * @Param: [id]
     * @return: top.plgxs.admin.entity.PlgUser
     **/
    PlgUser selectByPrimaryKey(String id);

    /**
     * @Description: 选择性更新
     * @Author: Strangers。
     * @Date: 17:42 2019/1/21
     * @Param: [record]
     * @return: int
     **/
    int updateByPrimaryKeySelective(PlgUser record);

    /**
     * @Description: 更新
     * @Author: Strangers。
     * @Date: 17:43 2019/1/21
     * @Param: [record]
     * @return: int
     **/
    int updateByPrimaryKey(PlgUser record);

    /**
     * @Description: 根据条件进行查询
     * @Author: Strangers。
     * @Date: 17:24 2019/1/21
     * @Param: [key]
     * @return: java.util.List<top.plgxs.admin.entity.PlgUser>
     **/
    List<PlgUser> selectByParam(@Param("key") String key);

    /**
     * 修改状态
     * @param user
     * @return
     */
    int switchState(PlgUser user);
}