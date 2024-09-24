package com.wheelchair.wym.dao;

import com.wheelchair.wym.entity.RepairOrder;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RepairOrderMapper {
    int insertRepairOrder(RepairOrder repairOrder);
    int deleteRepairOrder(int id);
    int deleteRepairOrderByoID(int oID);

    boolean updateRepairOrderStatus(int id, int orderStatus);

    boolean updateRepairOrderStatusByrID(int rID, Integer rStatus);
}
