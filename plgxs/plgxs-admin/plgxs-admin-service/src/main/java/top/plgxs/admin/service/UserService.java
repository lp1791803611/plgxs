package top.plgxs.admin.service;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;

import top.plgxs.admin.entity.PlgUser;
import top.plgxs.admin.entity.vo.PlgUserVO;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.result.ResultInfo;

import java.util.List;

/**
 * 用户
 * 
 * @author Strangers。
 * @date 15:15 2019/1/17
 * @version 1.0
 */
public interface UserService {
    /**
     * 分页查询
     * @param param 
     * @return
     */
    PageInfo<PlgUser> queryList(PageParam param);

    /**
     * 保存
     * @param user 用户信息
     * @author Stranger
     * @date 16:59 2019/1/29
     * @return ResultInfo<PlgUser>
     */
    ResultInfo<PlgUser> saveUser(PlgUser user);

    /**
     * 根据主键进行查询
     * @param id 主键
     * @author Stranger
     * @date 16:53 2019/1/29
     * @return top.plgxs.admin.entity.PlgUser
     */
    PlgUser queryById(String id);

    /**
     * 根据主键删除
     * @param id 主键
     * @return
     */
    int deleteUserById(String id);

    /**
     * 修改用户状态
     * @param id 主键
     * @param state 状态
     * @return
     */
    int switchState(String id, Integer state);

    /**
     * 根据条件查询出所有的用户
     * @param queryKey
     * @return
     */
    List<PlgUserVO> queryAll(String queryKey);

    /**
     * 根据userId查询角色id
     * @param id
     * @return
     */
    List<String> findRoleByUserId(String id);

    /**
     * 保存用户角色关系
     * @param userId
     * @param roleIds
     * @return
     */
    ResultInfo<String> saveUserRole(String userId, JSONArray roleIds);

    /**
     * 根据userId查询部门id
     * @param id
     * @return
     */
    List<Integer> findDeptByUserId(String id);

    /**
     * 保存用户部门信息
     * @param userId
     * @param deptIds
     * @return
     */
    ResultInfo<String> saveUserDept(String userId, String deptIds);
}
