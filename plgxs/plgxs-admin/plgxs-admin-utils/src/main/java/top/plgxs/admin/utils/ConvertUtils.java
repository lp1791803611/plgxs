package top.plgxs.admin.utils;

import top.plgxs.admin.entity.PlgUser;
import top.plgxs.admin.entity.vo.PlgUserVO;

import java.util.ArrayList;
import java.util.List;

/**
 * 转换类
 */
public class ConvertUtils {

    public static List<PlgUserVO> convertUserToVO(List<PlgUser> users){
        List<PlgUserVO> list = new ArrayList<>();
        if(users == null || users.size() == 0){
            return list;
        }
        for(int i=0,len=users.size();i<len;i++){
            PlgUserVO vo = new PlgUserVO(users.get(i));
            list.add(vo);
        }
        return list;
    }
}
