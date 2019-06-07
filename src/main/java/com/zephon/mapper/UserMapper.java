package com.zephon.mapper;

import com.zephon.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.mapper
 * @date 19-5-27 上午11:08
 * @Copyright ©
 */
public interface UserMapper {
    /**
     * @Author Zephon
     * @Description 将一个新用户插入到数据库
     * @Date 19-6-3 下午6:15
     * @Param [user]
     * @return int
     **/
    @Insert("insert into store_user values (default,#{uname},#{pwd},#{phone},#{email})")
    int insUser(User user);

    /**
     * @Author Zephon
     * @Description 根据用户名和密码选择user
     * @Date 19-6-3 下午6:16
     * @Param [user]
     * @return com.zephon.pojo.User
     **/
    @Select("select * from store_user where pwd=#{pwd} and  email=#{email}")
    User selByUnamePwd(User user);
}
