package com.wheelchair.wym.service;


import com.wheelchair.wym.entity.*;

import java.util.List;
import java.util.Map;


public interface IAdminService {

    /**
     * 管理员登录
     */
    Admin adminAccess(Admin admin);

    /**
     * 查询所有用户
     */
    List<Users> findAllUser();

    /**
     * 查询所有轮椅信息
     */
    List<Wheelchair> findAllWheelchair(Page page);

    /**
     * 管理员删除轮椅信息
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

    /**
     * 查询用户租赁订单
     */
    List<UserOrder> findAllOrder(Page page);

    /**
     * 查询用户保养/维修订单
     */
    List<RepairOrder> findAllRepairOrder(Page page);

    /**
     * 查询用户的配送订单
     */
    List<DeliveryOrder> findAllDeliveryOrder(Page page);

    int confirmRepairOrder(int id, int status);

    /**
     * 查询用户男女数量
     */
    Map<String, Map<String, Object>> countGender();

    /**
     * 查询各年龄段用户数量
     */
    Map<String, Map<String, Object>> countAgeGroups();

    /**
     * 查询所有轮椅单品信息
     */
    List<Chair> findAllChair(Page p);
}
