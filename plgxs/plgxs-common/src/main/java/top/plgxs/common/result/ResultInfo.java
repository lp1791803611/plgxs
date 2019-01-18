package top.plgxs.common.result;

import java.io.Serializable;

/**
 * @ClassName: ResultInfo
 * @Description: 返回值工具类
 * @Author: Strangers。
 * @Date: 16:30 2019/1/17
 * @Version: 1.0
 */
public class ResultInfo<T> implements Serializable{

    private static final long serialVersionUID = -2256083658091632139L;

    private boolean success; // 操作成功标记，true=成功，false=失败
    private T data; // 操作结果
    private String message; // 操作消息
    private String code; // 操作结果代码

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
