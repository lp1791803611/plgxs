package top.plgxs.admin.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.plgxs.admin.dao.PlgUserMapper;
import top.plgxs.admin.entity.PlgUser;
import top.plgxs.admin.entity.vo.PlgUserVO;
import top.plgxs.admin.service.UserService;
import top.plgxs.admin.utils.ConvertUtils;
import top.plgxs.common.IDGenerator;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.result.ResultCode;
import top.plgxs.common.result.ResultInfo;
import top.plgxs.common.result.ResultUtil;

import java.util.Date;
import java.util.List;

/**
 * @ClassName: UserServiceImpl
 * @Description: 用户
 * @Author: Strangers。
 * @Date: 15:15 2019/1/17
 * @Version: 1.0
 */
@Service
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
        int result = -1;
        if(user != null){
            // 编辑保存
            if(StringUtils.isNotBlank(user.getId())){
                user.setUpdateTime(new Date());
                result = userMapper.updateByPrimaryKeySelective(user);
            }else{ // 新增保存
                user.setId(IDGenerator.generator());
                user.setRegisterTime(new Date());
                result = userMapper.insertSelective(user);
            }
        }
        if(result > 0){
            return ResultUtil.getSuccessResult(null);
        }
        return ResultUtil.getFailResult(ResultCode.SAVE_ERROR);
    }

    @Override
    public PlgUser queryById(String id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public int deleteUserById(String id) {
        return userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int switchState(String id, Integer state) {
        PlgUser user = new PlgUser();
        user.setId(id);
        user.setStatus(state);
        user.setUpdateTime(new Date());
        return userMapper.switchState(user);
    }

    @Override
    public List<PlgUserVO> queryAll(String queryKey) {
        List<PlgUser> list = userMapper.selectByParam(queryKey);
        return ConvertUtils.convertUserToVO(list);
    }
}
