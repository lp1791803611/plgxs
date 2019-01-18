package top.plgxs.common.page;

import java.io.Serializable;
import java.util.List;
/**
 * @ClassName: PageResult
 * @Description: 分页返回工具类
 * @Author: Strangers。
 * @Date: 15:39 2019/1/17
 * @Version: 1.0
 */
public class PageResult<T> implements Serializable{
    private static final long serialVersionUID = -3051720531650653100L;

    private long page;//当前页
    private long pageSize;//条数
    private long total;//总条数
	private List<T> rows;

    public PageResult() {
        super();
    }

    public PageResult(List<T> rows, long total) {
        this.rows = rows;
        this.total = total;
    }

    public long getPage() {
        return page;
    }

    public void setPage(long page) {
        this.page = page;
    }

    public long getPageSize() {
        return pageSize;
    }

    public void setPageSize(long pageSize) {
        this.pageSize = pageSize;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }
}
