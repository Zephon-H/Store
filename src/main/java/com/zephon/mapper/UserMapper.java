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
    @Insert("insert into store_user values (default,#{uname},#{pwd},#{phone},#{email})")
    int insUser(User user);

    @Select("select * from store_user where pwd=#{pwd} and  email=#{email}")
    User selByUnamePwd(User user);
}
