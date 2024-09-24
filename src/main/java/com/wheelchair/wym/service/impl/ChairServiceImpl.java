package com.wheelchair.wym.service.impl;

import com.wheelchair.wym.dao.ChairMapper;
import com.wheelchair.wym.entity.Chair;
import com.wheelchair.wym.entity.Order;
import com.wheelchair.wym.service.IChairService;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class ChairServiceImpl implements IChairService {

    public final ChairMapper mapper;

    public ChairServiceImpl(ChairMapper mapper) {this.mapper = mapper;}

    @Override
    public int addNewChair(Chair chair) {
        return mapper.addNewChair(chair);
    }

    @Override
    public Chair findAvailableWheelchairByHID(int hID) {
        return mapper.findAvailableWheelchairByHID(hID);
    }

    @Override
    public int updateOrderedChair(Order order) {
        return mapper.updateOrderedChair(order);
    }

    @Override
    public int updateScrappedChair(int cID) {
        return mapper.updateScrappedChair(cID);
    }

    @Override
    public int updateRepairedChair(int cID, Date date) {
        return mapper.updateRepairedChair(cID, date);
    }
}
