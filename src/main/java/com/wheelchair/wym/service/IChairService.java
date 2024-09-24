package com.wheelchair.wym.service;

import com.wheelchair.wym.entity.Chair;
import com.wheelchair.wym.entity.Order;

import java.util.Date;

public interface IChairService {

    /**
     * 添加轮椅信息生成指定数量的轮椅单品
     * @param chair
     * @return
     */
    int addNewChair(Chair chair);

    /**
     * 查询当前hID下可用的轮椅
     */
    Chair findAvailableWheelchairByHID(int hID);

    /**
     * 更新被租赁的轮椅
     * @param order
     * @return
     */
    int updateOrderedChair(Order order);

    int updateScrappedChair(int cID);

    int updateRepairedChair(int cID, Date date);

    int returnChair(int cID);
}
