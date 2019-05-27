package com.zephon.service;

import com.zephon.pojo.User;
import org.springframework.stereotype.Service;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.service
 * @date 19-5-27 上午11:09
 * @Copyright ©
 */
public interface UserService {
    int register(User user);
    User login(User user);
}
