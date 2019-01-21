package top.plgxs.common.result;

/**
 * @ClassName: ResultUtil
 * @Description: 返回值工具类
 * @Author: Strangers。
 * @Date: 16:39 2019/1/17
 * @Version: 1.0
 */
public class ResultUtil {
    public ResultUtil(){
    }

    public static ResultInfo getSuccessResult(){
        ResultInfo resultInfo = new ResultInfo();
        resultInfo.setCode(ResultCode.SUCCESS.getCode());
        resultInfo.setMessage(ResultCode.SUCCESS.getMsg());
        resultInfo.setData(null);
        return resultInfo;
    }

    public static ResultInfo getSuccessResult(Object object){
        ResultInfo resultInfo = new ResultInfo();
        resultInfo.setCode(ResultCode.SUCCESS.getCode());
        resultInfo.setMessage(ResultCode.SUCCESS.getMsg());
        resultInfo.setData(object);
        return resultInfo;
    }

    public static ResultInfo getFailResult(ResultCode resultCode){
        return getFailResult(resultCode,(Object)null);
    }

    public static ResultInfo getFailResult(String resultCode,String resultMessage,Object data){
        ResultInfo resultInfo = new ResultInfo();
        resultInfo.setCode(resultCode);
        resultInfo.setMessage(resultMessage);
        resultInfo.setData(data);
        return resultInfo;
    }

    public  static  ResultInfo getFailResult(ResultCode resultCode,Object data){
        ResultInfo resultInfo = new ResultInfo();
        resultInfo.setCode(resultCode.getCode());
        resultInfo.setMessage(resultCode.getMsg());
        resultInfo.setData(data);
        return resultInfo;
    }
}
