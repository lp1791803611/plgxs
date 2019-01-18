package top.plgxs.common;

import org.apache.commons.lang3.StringUtils;

import java.util.UUID;

/**
 * @ClassName: IDGenerator
 * @Description: 32位UUID生成类
 * @Author: Strangers。
 * @Date: 16:13 2019/1/17
 * @Version: 1.0
 */
public class IDGenerator {
    public static String generator(){
        return StringUtils.replace(UUID.randomUUID().toString(), "-", "");
    }
}
