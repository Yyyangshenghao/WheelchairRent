package com.wheelchair.wym.service.impl;

import com.wheelchair.wym.dao.ChairMapper;
import com.wheelchair.wym.entity.Chair;
import com.wheelchair.wym.service.IChairService;
import org.springframework.stereotype.Service;

@Service
public class ChairServiceImpl implements IChairService {

    public final ChairMapper mapper;

    public ChairServiceImpl(ChairMapper mapper) {this.mapper = mapper;}

    @Override
    public int addNewChair(Chair chair) {
        return mapper.addNewChair(chair);
    }
}
