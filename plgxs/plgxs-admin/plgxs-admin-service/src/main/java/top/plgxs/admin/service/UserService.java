package top.plgxs.admin.service;

import com.github.pagehelper.PageInfo;
import top.plgxs.admin.entity.PlgUser;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.result.ResultInfo;

/**
 * @ClassName: UserService
 * @Description: 用户
 * @Author: Strangers。
 * @Date: 15:15 2019/1/17
 * @Version: 1.0
 */
public interface UserService {
    /**
     * @Description: 分页查询
     * @Author: Strangers。
     * @Date: 15:16 2019/1/17
     * @Param: []
     * @return: com.github.pagehelper.PageInfo<top.plgxs.admin.entity.PlgUser>
     **/
    PageInfo<PlgUser> queryList(PageParam param);
    /**
     * @Description: 保存
     * @Author: Strangers。
     * @Date: 16:40 2019/1/17
     * @Param: [user]
     * @return: top.plgxs.common.result.ResultInfo<top.plgxs.admin.entity.PlgUser>
     **/
    ResultInfo<PlgUser> saveUser(PlgUser user);
}
