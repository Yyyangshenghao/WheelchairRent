package com.wheelchair.wym.service;

import com.wheelchair.wym.entity.Repair;

import java.util.List;

public interface IRepairService {

    // 创建维修申请
    int createRepair(Repair repair);

    // 根据ID获取维修申请
    Repair getRepairById(Long id);

    // 获取所有维修申请
    List<Repair> getAllRepairs();

    // 更新维修申请
    int updateRepair(Repair repair);

    // 删除维修申请
    int deleteRepair(Long id);
}
