package com.wheelchair.wym.dao;

import com.wheelchair.wym.entity.Page;
import com.wheelchair.wym.entity.Wheelchair;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface WheelchairMapper {
    /**
     * 首页信息展示
     */
    List<Wheelchair> findHomeInfo();

    /**
     * 通过id查询房屋详情
     */
    Wheelchair findWheelchairDetailsById(int id);

    /**
     * 添加房源信息
     */
    int addNewWheelchair(Wheelchair wheelchair);

    /**
     * 查询用户发布的房源信息
     */
    List<Wheelchair> findWheelchairByUser(Page page);

    /**
     * 删除用户发布的房源信息
     */
    int deleteUserWheelchair(int hID);

    /**
     * 修改用户发布的房源信息
     */
    int updateWheelchair(Wheelchair wheelchair);

    /**
     * 条件查询
     */
    List<Wheelchair> findWheelchairByLike(String keywords);

    /**
     * 降序查询
     */
    List<Wheelchair> findWheelchairOrderByDesc();

    /**
     * 升序序查询
     */
    List<Wheelchair> findWheelchairOrderByAsc();

    /**
     * 找到最新添加的轮椅品类ID
     */
    int getLastInsertedHID();
}
