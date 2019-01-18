package top.plgxs.common.page;

/**
 * @ClassName: PageParam
 * @Description: 分页接收工具类
 * @Author: Strangers。
 * @Date: 15:39 2019/1/17
 * @Version: 1.0
 */
public class PageParam {
    private int page; // 当前页
    private int pageSize; // 页条数
    private String orderKey; // 排序
    private String queryKey; // 查询

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getOrderKey() {
        return orderKey;
    }

    public void setOrderKey(String orderKey) {
        this.orderKey = orderKey;
    }

    public String getQueryKey() {
        return queryKey;
    }

    public void setQueryKey(String queryKey) {
        this.queryKey = queryKey;
    }
}
