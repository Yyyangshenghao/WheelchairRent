package com.wheelchair.wym.dao;

import com.wheelchair.wym.entity.Order;
import com.wheelchair.wym.entity.Page;
import com.wheelchair.wym.entity.Repair;
import com.wheelchair.wym.entity.UserOrder;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RepairMapper {

    // 插入维修申请
    int insertRepair(Repair repair);

    // 根据ID查询维修申请
    Repair getRepairById(Long id);

    // 查询所有维修申请
    List<Repair> getAllRepairs();

    // 更新维修申请
    int updateRepair(Repair repair);

    // 删除维修申请
    int deleteRepair(Long id);
}
