package com.zephon.service.impl;

import com.zephon.mapper.UserMapper;
import com.zephon.pojo.User;
import com.zephon.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.service.impl
 * @date 19-5-27 上午11:09
 * @Copyright ©
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Override
    public int register(User user) {
        return userMapper.insUser(user);
    }

    @Override
    public User login(User user) {
        return userMapper.selByUnamePwd(user);
    }
}
