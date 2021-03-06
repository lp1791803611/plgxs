package top.plgxs.admin.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.plgxs.admin.dao.PlgUserDeptMapper;
import top.plgxs.admin.dao.PlgUserMapper;
import top.plgxs.admin.dao.PlgUserRoleMapper;
import top.plgxs.admin.entity.*;
import top.plgxs.admin.entity.vo.PlgUserVO;
import top.plgxs.admin.service.UserService;
import top.plgxs.admin.utils.ConvertUtils;
import top.plgxs.common.IDGenerator;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.result.ResultCode;
import top.plgxs.common.result.ResultInfo;
import top.plgxs.common.result.ResultUtil;

import java.util.ArrayList;
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
    @Autowired
    private PlgUserRoleMapper userRoleMapper;
    @Autowired
    private PlgUserDeptMapper userDeptMapper;

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

    @Override
    public List<String> findRoleByUserId(String id) {
        PlgUserRoleExample example = new PlgUserRoleExample();
        PlgUserRoleExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(id);
        List<PlgUserRoleKey> list = userRoleMapper.selectByExample(example);
        List<String> roles = new ArrayList<>();
        if(list != null && list.size() > 0){
            for(PlgUserRoleKey roleKey:list){
                roles.add(roleKey.getRoleId());
            }
        }
        return  roles;
    }

    @Transactional
    @Override
    public ResultInfo<String> saveUserRole(String userId, JSONArray roleIds) {
        if(StringUtils.isBlank(userId) || roleIds == null || roleIds.size() == 0){
            return ResultUtil.getFailResult(ResultCode.SAVE_ERROR);
        }
        PlgUserRoleExample example = new PlgUserRoleExample();
        PlgUserRoleExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(userId);
        userRoleMapper.deleteByExample(example);
        List<PlgUserRoleKey> list = new ArrayList<>();
        for(int i=0,len=roleIds.size();i<len;i++){
            PlgUserRoleKey userRoleKey = new PlgUserRoleKey();
            userRoleKey.setUserId(userId);
            userRoleKey.setRoleId(String.valueOf(roleIds.get(i)));
            list.add(userRoleKey);
        }
        userRoleMapper.batchInsert(list);
        return ResultUtil.getSuccessResult();
    }

    @Override
    public List<Integer> findDeptByUserId(String id) {
        List<Integer> depts = new ArrayList<>();
        PlgUserDeptExample example = new PlgUserDeptExample();
        PlgUserDeptExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(id);
        List<PlgUserDeptKey> list = userDeptMapper.selectByExample(example);
        if(list != null && list.size() > 0){
            for(PlgUserDeptKey deptKey:list){
                depts.add(deptKey.getDeptId());
            }
        }
        return depts;
    }

    @Override
    public ResultInfo<String> saveUserDept(String userId, String deptIds) {
        if(StringUtils.isBlank(userId) || StringUtils.isBlank(deptIds)){
            return ResultUtil.getFailResult(ResultCode.SAVE_ERROR);
        }
        PlgUserDeptExample example = new PlgUserDeptExample();
        PlgUserDeptExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(userId);
        userDeptMapper.deleteByExample(example);
        List<PlgUserDeptKey> list = new ArrayList<>();
        String[] depts = deptIds.split(",");
        if(depts != null && depts.length>0){
            for(int i=0,len=depts.length;i<len;i++){
                PlgUserDeptKey deptKey = new PlgUserDeptKey();
                deptKey.setUserId(userId);
                deptKey.setDeptId(Integer.parseInt(depts[i]));
                list.add(deptKey);
            }
        }
        userDeptMapper.batchInsert(list);
        return ResultUtil.getSuccessResult();
    }
}
