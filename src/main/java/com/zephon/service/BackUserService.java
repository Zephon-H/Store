package com.zephon.service;

import com.zephon.pojo.BackUser;
import com.zephon.pojo.User;

import java.util.List;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.service.backstage
 * @date 19-6-3 下午5:27
 * @Copyright ©
 */
public interface BackUserService {
    /**
     * @Author Zephon
     * @Description 后台用户登录
     * @Date 19-6-3 下午6:16
     * @Param [user]
     * @return com.zephon.pojo.BackUser
     **/
    BackUser login(BackUser user);

    List<User> getAllUser();
}
