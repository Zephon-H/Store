package com.zephon.service.impl;

import com.zephon.mapper.BackUsersMapper;
import com.zephon.pojo.BackUser;
import com.zephon.pojo.User;
import com.zephon.service.BackUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.service.backstage.impl
 * @date 19-6-3 下午5:28
 * @Copyright ©
 */
@Service
public class BackUsersServiceImpl implements BackUserService {
    @Resource
    BackUsersMapper backUsersMapper;
    @Override
    public BackUser login(BackUser user) {
        return backUsersMapper.selUserByUnamePwd(user);
    }

    @Override
    public List<User> getAllUser() {
        return backUsersMapper.selAllUser();
    }
}
