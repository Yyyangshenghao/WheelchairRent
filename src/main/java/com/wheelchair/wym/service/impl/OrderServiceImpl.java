package com.wheelchair.wym.service.impl;

import com.wheelchair.wym.dao.OrderMapper;
import com.wheelchair.wym.dao.RepairOrderMapper;
import com.wheelchair.wym.entity.Order;
import com.wheelchair.wym.entity.Page;
import com.wheelchair.wym.entity.RepairOrder;
import com.wheelchair.wym.entity.UserOrder;
import com.wheelchair.wym.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
