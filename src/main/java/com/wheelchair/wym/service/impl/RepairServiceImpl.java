package com.wheelchair.wym.service.impl;

import com.wheelchair.wym.dao.RepairMapper;
import com.wheelchair.wym.dao.WheelchairMapper;
import com.wheelchair.wym.entity.Repair;
import com.wheelchair.wym.entity.Wheelchair;
import com.wheelchair.wym.service.IRepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RepairServiceImpl implements IRepairService {

    @Autowired
    private RepairMapper repairMapper;

    @Override
    public int createRepair(Repair repair) {
        return repairMapper.insertRepair(repair);
    }

    @Override
    public Repair getRepairById(Long id) {
        return repairMapper.getRepairById(id);
    }

    @Override
    public List<Repair> getAllRepairs() {
        return repairMapper.getAllRepairs();
    }

    @Override
    public int updateRepair(Repair repair) {
        return repairMapper.updateRepair(repair);
    }

    @Override
    public int deleteRepair(Long id) {
        return repairMapper.deleteRepair(id);
    }
}