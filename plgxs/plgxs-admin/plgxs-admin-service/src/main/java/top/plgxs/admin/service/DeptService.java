package top.plgxs.admin.service;

import com.github.pagehelper.PageInfo;
import top.plgxs.admin.entity.PlgDept;
import top.plgxs.admin.entity.vo.DeptTreeView;
import top.plgxs.admin.entity.vo.DeptVO;
import top.plgxs.admin.entity.vo.PlgDeptTree;
import top.plgxs.common.page.PageParam;
import top.plgxs.common.result.ResultInfo;

import java.util.List;

/**
 * @author Strangers。
 * @version 1.0.0
 * @date 16:26 2019/3/13
 */
public interface DeptService {
    /**
     * 根据主键查询
     * @param id
     * @return
     */
    PlgDept queryById(Integer id);

    /**
     * 分页查询
     * @param param
     * @return
     */
    PageInfo<PlgDept> queryList(PageParam param);

    /**
     * 开关状态
     * @param id
     * @param state
     * @return
     */
    int switchState(Integer id, Integer state);

    /**
     * 保存
     * @param dept
     * @return
     */
    ResultInfo<PlgDept> saveDept(PlgDept dept);

    /**
     * 删除
     * @param id
     * @return
     */
    ResultInfo<String> deleteById(Integer id);

    /**
     * 获取格式为treegrid的部门列表树
     * @return
     */
    List<PlgDeptTree> findAll();

    /**
     * 获取treeview格式的数据
     * @return
     */
    ResultInfo<List<DeptTreeView>> getDeptTreeViewData();
}
