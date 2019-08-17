package top.plgxs.admin.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.plgxs.admin.dao.PlgRoleMapper;
import top.plgxs.admin.dao.PlgUserMapper;
import top.plgxs.admin.entity.PlgRole;
import top.plgxs.admin.entity.PlgRoleExample;
import top.plgxs.admin.entity.PlgUser;
import top.plgxs.admin.service.RoleService;
import top.plgxs.common.IDGenerator;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.result.ResultCode;
import top.plgxs.common.result.ResultInfo;
import top.plgxs.common.result.ResultUtil;

import java.util.Date;
import java.util.List;

/**
 * 角色Impl
 * @author Strangers。
 * @version 1.0.0
 * @date 11:10 2019/3/11
 */
@Service
public class RoleServiceImpl implements RoleService{
    @Autowired
    private PlgUserMapper userMapper;
    @Autowired
    private PlgRoleMapper roleMapper;


    @Override
    public PageInfo<PlgRole> queryList(PageParam param) {
        if(param == null){
            return null;
        }
        PlgRoleExample example = new PlgRoleExample();
        if(StringUtils.isNotBlank(param.getQueryKey())){
            String queryKey = "%" + param.getQueryKey() + "%";
            PlgRoleExample.Criteria criteria = example.createCriteria();
            criteria.andRoleNameLike(queryKey);
            criteria.andStatusEqualTo(0);
            PlgRoleExample.Criteria criteria2 = example.createCriteria();
            criteria2.andRoleCodeLike(queryKey);
            criteria2.andStatusEqualTo(0);
            example.or(criteria2);
        }
        example.setOrderByClause("priority asc");
        // 开启分页
        PageHelper.startPage(param.getPage(),param.getPageSize());
        List<PlgRole> list = roleMapper.selectByExample(example);
        PageInfo<PlgRole> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int switchState(String id, Integer state) {
        PlgRole role = new PlgRole();
        role.setId(id);
        role.setStatus(state);
        role.setUpdateTime(new Date());
        return roleMapper.switchState(role);
    }

    @Override
    public ResultInfo<PlgRole> saveRole(PlgRole role) {
        if(role == null){
            return ResultUtil.getFailResult(ResultCode.PARAMS_IS_NULL);
        }
        int result = -1;
        if(StringUtils.isBlank(role.getId())){
            role.setId(IDGenerator.generator());
            role.setCreateTime(new Date());
            role.setCreatePersonId(null);
            role.setCreatePersonName(null);
            result = roleMapper.insertSelective(role);
        }else{
            role.setUpdateTime(new Date());
            role.setUpdatePersonId(null);
            role.setUpdatePersonName(null);
            result = roleMapper.updateByPrimaryKeySelective(role);
        }
        if(result > 0){
            return ResultUtil.getSuccessResult();
        }
        return ResultUtil.getFailResult(ResultCode.SAVE_ERROR);
    }

    @Override
    public PlgRole queryById(String id) {
        return roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public ResultInfo<String> deleteRoleById(String id) {
        if(StringUtils.isBlank(id)){
            return ResultUtil.getFailResult(ResultCode.PARAMS_IS_NULL);
        }
        int result = roleMapper.deleteByPrimaryKey(id);
        if(result > 0){
            return ResultUtil.getSuccessResult();
        }
        return ResultUtil.getFailResult(ResultCode.DELETE_ERROR);
    }

    @Override
    public ResultInfo<List<PlgRole>> findAll() {
        PlgRoleExample example = new PlgRoleExample();
        PlgRoleExample.Criteria criteria = example.createCriteria();
        criteria.andStatusEqualTo(0);
        example.setOrderByClause("priority asc");
        List<PlgRole> list = roleMapper.selectByExample(example);
        return ResultUtil.getSuccessResult(list);
    }
}
