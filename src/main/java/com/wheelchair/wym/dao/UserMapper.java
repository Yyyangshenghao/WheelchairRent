package com.wheelchair.wym.dao;


import com.wheelchair.wym.entity.Users;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
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
