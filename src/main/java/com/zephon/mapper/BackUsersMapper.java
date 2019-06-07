package com.zephon.mapper;

import com.zephon.pojo.BackUser;
import com.zephon.pojo.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.mapper.backstage
 * @Description 后台用户mapper层
 * @date 19-6-3 下午5:25
 * @Copyright ©
 */
public interface BackUsersMapper {
    /**
     * 根据用户名和密码选择用户
     * @param user
     * @return
     */
    @Select("select * from back_user where uname=#{uname} and  pwd=#{pwd}")
    BackUser selUserByUnamePwd(BackUser user);
    @Select("select * from store_user")
    List<User> selAllUser();
}
