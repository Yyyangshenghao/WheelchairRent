package com.wheelchair.wym.dao;

import com.wheelchair.wym.entity.*;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface AdminMapper {

    // 管理员登录
    Admin adminAccess(Admin admin);

    // 查询所有用户
    List<Users> findAllUser(@Param("page") Page page, @Param("uName") String uName, @Param("uPhoneNumber") String uPhoneNumber);

    // 查询所有轮椅信息
    List<Wheelchair> findAllWheelchair(Page page);

    // 管理员删除轮椅信息
    int deleteWheelchair(int hID);

    // 通过id查询用户
    Users findUserById(int uID);

    // 管理员更新普通用户信息
    int updateUser(Users users);

    // 管理员删除用户
    int deleteUser(int uID);

    // 检查修改密码原密码
    Admin checkAdminPwd(Admin admin);

    // 修改管理员密码
    int updateAdminPwd(Admin admin);

    // 查询所有订单
    List<UserOrder> findOrderByCondition(@Param("uPhone") String uPhone, @Param("chairNo") String chairNo, @Param("orderStatus") Integer orderStatus, @Param("page") Page page);

    // 查询所有维修订单
    List<RepairOrder> findAllRepairOrder(@Param("page") Page page, @Param("phone") String phone, @Param("type") String type, @Param("orderStatus") Integer orderStatus, @Param("timeSort") String timeSort);

    // 查询所有配送订单
    List<DeliveryOrder> findAllDeliveryOrder(@Param("page") Page page, @Param("phone") String phone, @Param("type") Integer type, @Param("orderStatus") Integer orderStatus, @Param("timeSort") String timeSort);

    // 确认维修订单
    int confirmRepairOrder(int id, int status);

    // 查询用户男女数量
    @MapKey("u_gender") // 将结果映射为以性别为键的Map
    Map<String, Map<String, Object>> countGender();

    // 查询不同年龄段的用户数量
    @MapKey("age_group") // 将结果映射为以年龄段为键的Map
    Map<String, Map<String, Object>> countAgeGroups();

    List<Chair> findAllChair(@Param("p") Page p,  @Param("chairNo") String chairNo,  @Param("status") Integer status);

    int getChairCount(@Param("chairNo") String chairNo,  @Param("status") Integer status);

    int getUserCount(@Param("uName") String uName, @Param("uPhoneNumber") String uPhoneNumber);

    int getWheelchairCount();

    int getOrderCountByCondition(@Param("uPhone") String uPhone, @Param("chairNo") String chairNo, @Param("orderStatus") Integer orderStatus);

    int getDeliveryOrderCount(@Param("phone") String phone, @Param("type") Integer type, @Param("orderStatus") Integer orderStatus);

    int getRepairOrderCount(@Param("phone") String phone, @Param("type") String type, @Param("orderStatus") Integer orderStatus);
}
