package top.plgxs.admin.service;

import com.github.pagehelper.PageInfo;
import top.plgxs.admin.entity.PlgRole;
import top.plgxs.admin.entity.PlgUser;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.result.ResultInfo;

import java.util.List;

/**
 * 角色service
 * @author Strangers。
 * @version 1.0.0
 * @date 11:10 2019/3/11
 */
public interface RoleService {

    /**
     * 分页查询
     * @param param
     * @return
     */
    PageInfo<PlgRole> queryList(PageParam param);

    /**
     * 状态开关
     * @param id
     * @param state
     * @return
     */
    int switchState(String id, Integer state);

    /**
     * 保存角色
     * @param role
     * @return
     */
    ResultInfo<PlgRole> saveRole(PlgRole role);

    /**
     * 根据主键查询role
     * @param id
     * @return
     */
    PlgRole queryById(String id);

    /**
     * 单条删除
     * @param id
     * @return
     */
    ResultInfo<String> deleteRoleById(String id);

    /**
     * 查询全部有效角色
     * @return
     */
    ResultInfo<List<PlgRole>> findAll();

}
