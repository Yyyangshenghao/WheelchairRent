package com.wheelchair.wym.dao;

import com.wheelchair.wym.entity.Chair;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChairMapper {

    /**
     * 添加轮椅单品
     */
    int addNewChair(Chair chair);


}
