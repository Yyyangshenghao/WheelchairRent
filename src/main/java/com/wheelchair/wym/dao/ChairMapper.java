package com.wheelchair.wym.dao;

import com.wheelchair.wym.entity.Chair;
import com.wheelchair.wym.entity.Order;
import org.apache.ibatis.annotations.Mapper;

import java.util.Date;

@Mapper
public interface ChairMapper {

    /**
     * 添加轮椅单品
     */
    int addNewChair(Chair chair);

    /**
     * 查询当前hID下可用的轮椅
     */
    Chair findAvailableWheelchairByHID(int hID);

    /**
     * 更新被订单选中的轮椅单品的状态
     */
    int updateOrderedChair(Order order);

    int updateScrappedChair(int cID);

    int updateRepairedChair(int cID, Date date);
}
