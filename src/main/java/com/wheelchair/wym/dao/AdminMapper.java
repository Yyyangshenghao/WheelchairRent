package com.wheelchair.wym.dao;

import com.wheelchair.wym.entity.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface AdminMapper {
    /**
     * 管理员登录
     */
    Admin adminAccess(Admin admin);

    /**
     * 查询所有用户
     */
    List<Users> findAllUser();

    /**
     * 查询所有房源信息
     */
    List<Wheelchair> findAllWheelchair(Page page);

    /**
     * 管理员删除房源信息
     */
    int deleteWheelchair(int hID);

    /**
     * 通过id查询用户
     */
    Users findUserById(int uID);

    /**
     * 管理员更新普通用户信息
     */
    int updateUser(Users users);

    /**
     * 管理员删除用户
     */
    int deleteUser(int uID);

    /**
     * 检查修改密码原密码
     */
    Admin checkAdminPwd(Admin admin);

    /**
     * 修改管理员密码
     */
    int updateAdminPwd(Admin admin);

    List<UserOrder> findAllOrder(Page page);

    List<RepairOrder> findAllRepairOrder(Page page);

    List<DeliveryOrder> findAllDeliveryOrder(Page page);
}
