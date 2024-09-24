package com.wheelchair.wym.service.impl;

import com.wheelchair.wym.dao.OrderMapper;
import com.wheelchair.wym.dao.RepairOrderMapper;
import com.wheelchair.wym.entity.*;
import com.wheelchair.wym.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements IOrderService {

    private final OrderMapper mapper;

    @Autowired
    private RepairOrderMapper repairOrderMapper;

    public OrderServiceImpl(OrderMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public int addOrder(Order order) {
        return mapper.addOrder(order);
    }

    @Override
    public int addDeliveryOrder(DeliveryOrder deliveryOrder) {
        return mapper.addDeliverOrder(deliveryOrder);
    }

    @Override
    public List<UserOrder> findAllOrder(Page page) {
        return mapper.findAllOrder(page);
    }

    @Override
    public int getOrderCount(int uID) {
        return mapper.getOrderCount(uID);
    }

    @Override
    public int deleteOrder(int oID) {
        return mapper.deleteOrder(oID);
    }

    @Override
    public String applyRepairOrder(RepairOrder repairOrder) {
        try {
            // 确保 repairOrder 的 orderStatus 是整数类型
            if (repairOrder.getOrderStatus() == null) {
                repairOrder.setOrderStatus(0); // 默认状态，替换为实际的默认值
            }
            int result = repairOrderMapper.insertRepairOrder(repairOrder);
            if (result > 0) {
                return "OK";
            } else {
                return "FAIL";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "ERROR";
        }
    }

    @Override
    public int deleteRepairOrder(int id) {
        return repairOrderMapper.deleteRepairOrder(id);
    }

    @Override
    public boolean updateOrderStatus(int oID, int orderStatus) {
        return mapper.updateOrderStatus(oID, orderStatus);
    }

    @Override
    public int findAnOrder(int uID, int cID) {
        return mapper.findAnOrder(uID,cID);
    }

    @Override
    public int findChairByoID(int oID) {
        return mapper.findChairByoID(oID);
    }

    @Override
    public int deleteRepairOrderByoID(int oID) {
        return repairOrderMapper.deleteRepairOrderByoID(oID);
    }

    @Override
    public boolean updateRepairOrderStatus(int rID, Integer rStatus) {
        return repairOrderMapper.updateRepairOrderStatusByrID(rID, rStatus);
    }

    @Override
    public int findStatusByoID(int oID) {
        return mapper.findStatusByoID(oID);
    }

    @Override
    public int findUserByoID(int oID) {
        return mapper.findUserByoID(oID);
    }

    @Override
    public int updateEndDate(int oID, Date date) {
        return mapper.updateEndDate(oID, date);
    }
}
