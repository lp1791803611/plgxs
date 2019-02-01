package top.plgxs.admin.utils;

import java.io.Serializable;

import com.github.pagehelper.PageInfo;

import top.plgxs.common.page.PageResult;

/**
 * Page工具类
 * @author Strangers。
 * @date 11:14 2019/1/29
 * @version 1.0.0
 */
public class PageUtils<T> implements Serializable {
    private static final long serialVersionUID = 7626279297774200047L;

    /**
     * 将PageInfo转换为PageResult
     * @param pageInfo
     * @return top.plgxs.common.page.PageResult<T>
     * @author Strangers。
     * @date 10:46 2019/1/30
     */
    public static <T> PageResult<T> convertResult(PageInfo<T> pageInfo) {
        if (pageInfo != null) {
            return new PageResult<T>(pageInfo.getPageNum(), pageInfo.getPageSize(),
                pageInfo.getTotal(), pageInfo.getList());
        }
        return null;
    }
}
