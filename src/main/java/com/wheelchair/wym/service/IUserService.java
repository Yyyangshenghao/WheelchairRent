package com.wheelchair.wym.service;


import com.wheelchair.wym.entity.Users;


public interface IUserService {
    /**
     * 用户登录
     */
    Users login(Users user);

    /**
     * 用户注册
     */
    int regist(Users user);

    /**
     * 修改密码
     */
    int updateUserPwd(Users users);

    /**
     * 检查旧密码
     */
    Users checkOldPwd(Users users);
}
