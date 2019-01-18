package top.plgxs.admin.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import top.plgxs.admin.dao.PlgUserMapper;
import top.plgxs.admin.entity.PlgUser;
import top.plgxs.admin.service.UserService;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.result.ResultInfo;

import java.util.List;

/**
 * @ClassName: UserServiceImpl
 * @Description: 用户
 * @Author: Strangers。
 * @Date: 15:15 2019/1/17
 * @Version: 1.0
 */
public class UserServiceImpl implements UserService {
    @Autowired
    private PlgUserMapper userMapper;

    @Override
    public PageInfo<PlgUser> queryList(PageParam param) {
        if(param == null){
            return null;
        }
        // 开启分页
        PageHelper.startPage(param.getPage(),param.getPageSize());
        List<PlgUser> list = userMapper.selectByParam(param.getQueryKey());
        PageInfo<PlgUser> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public ResultInfo<PlgUser> saveUser(PlgUser user) {
        return null;
    }
}
