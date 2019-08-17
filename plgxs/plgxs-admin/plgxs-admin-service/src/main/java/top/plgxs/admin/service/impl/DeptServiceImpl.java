package top.plgxs.admin.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.tools.javac.util.Convert;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.plgxs.admin.dao.PlgDeptMapper;
import top.plgxs.admin.entity.PlgDept;
import top.plgxs.admin.entity.PlgDeptExample;
import top.plgxs.admin.entity.PlgRole;
import top.plgxs.admin.entity.PlgRoleExample;
import top.plgxs.admin.entity.vo.DeptTreeView;
import top.plgxs.admin.entity.vo.DeptVO;
import top.plgxs.admin.entity.vo.PlgDeptTree;
import top.plgxs.admin.service.DeptService;
import top.plgxs.admin.utils.ConvertUtils;
import top.plgxs.common.IDGenerator;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.result.ResultCode;
import top.plgxs.common.result.ResultInfo;
import top.plgxs.common.result.ResultUtil;

import java.util.*;

/**
 * @author Strangers。
 * @version 1.0.0
 * @date 16:27 2019/3/13
 */
@Service
public class DeptServiceImpl implements DeptService {
    @Autowired
    private PlgDeptMapper deptMapper;

    @Override
    public PlgDept queryById(Integer id) {
        return deptMapper.selectByPrimaryKey(id);
    }

    @Override
    public PageInfo<PlgDept> queryList(PageParam param) {
        if (param == null) {
            return null;
        }
        // 开启分页
        PageHelper.startPage(param.getPage(), param.getPageSize());
        List<PlgDept> list = deptMapper.selectByParam(param.getQueryKey());
        PageInfo<PlgDept> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int switchState(Integer id, Integer state) {
        PlgDept dept = new PlgDept();
        dept.setId(id);
        dept.setStatus(state);
        dept.setUpdateTime(new Date());
        return deptMapper.switchState(dept);
    }

    @Override
    public ResultInfo<PlgDept> saveDept(PlgDept dept) {
        if (dept == null) {
            return ResultUtil.getFailResult(ResultCode.PARAMS_IS_NULL);
        }
        int result = -1;
        if (dept.getId() != null && dept.getId() > 0) {
            dept.setUpdateTime(new Date());
            dept.setUpdatePersonId(null);
            dept.setUpdatePersonName(null);
            dept.setStatus(dept.getStatus() == null ? 0 : dept.getStatus());
            result = deptMapper.updateByPrimaryKeySelective(dept);
        } else {
            dept.setCreateTime(new Date());
            dept.setCreatePersonId(null);
            dept.setCreatePersonName(null);
            dept.setStatus(dept.getStatus() == null ? 0 : dept.getStatus());
            result = deptMapper.insertSelective(dept);
        }
        if (result > 0) {
            return ResultUtil.getSuccessResult();
        }
        return ResultUtil.getFailResult(ResultCode.SAVE_ERROR);
    }

    @Override
    public ResultInfo<String> deleteById(Integer id) {
        if (id == 0) {
            return ResultUtil.getFailResult(ResultCode.PARAMS_IS_NULL);
        }
        int result = deptMapper.deleteByPrimaryKey(id);
        if (result > 0) {
            return ResultUtil.getSuccessResult();
        }
        return ResultUtil.getFailResult(ResultCode.DELETE_ERROR);
    }

    @Override
    public List<PlgDeptTree> findAll() {
        List<PlgDept> list = queryAll();
        return ConvertUtils.convertDeptToTree(list);
    }

    @Override
    public ResultInfo<List<DeptTreeView>> getDeptTreeViewData() {
        // 获取所有有效部门
        List<PlgDept> list = queryAll();
        // 转换
        List<DeptTreeView> treeViews = ConvertUtils.convertDeptToTreeView(list);
        return ResultUtil.getSuccessResult(treeViews);
    }

    public List<PlgDept> queryAll() {
        PlgDeptExample example = new PlgDeptExample();
        PlgDeptExample.Criteria criteria = example.createCriteria();
        criteria.andStatusEqualTo(0);
        List<PlgDept> list = deptMapper.selectByExample(example);
        return list;
    }
}
