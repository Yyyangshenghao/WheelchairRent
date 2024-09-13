package com.wheelchair.wym.service;

import com.wheelchair.wym.entity.Chair;

public interface IChairService {

    /**
     * 添加轮椅信息生成指定数量的轮椅单品
     * @param chair
     * @return
     */
    int addNewChair(Chair chair);
}
