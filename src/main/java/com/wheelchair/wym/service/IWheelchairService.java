package com.wheelchair.wym.service;

import com.wheelchair.wym.entity.Page;
import com.wheelchair.wym.entity.Wheelchair;

import java.util.List;


public interface IWheelchairService {
    /**
     * 首页信息展示
     */
    List<Wheelchair> findHomeInfo();

    /**
     * 通过id查询轮椅详情
     */
    Wheelchair findWheelchairDetailsById(int id);

    /**
     * 添加轮椅信息
     */
    int addNewWheelchair(Wheelchair wheelchair);

    List<Wheelchair> findWheelchairByUser(Page page);

    /**
     * 删除用户发布的轮椅信息
     */
    int deleteUserWheelchair(int hID);

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
     * 升序查询
     */
    List<Wheelchair> findWheelchairOrderByAsc();
}
