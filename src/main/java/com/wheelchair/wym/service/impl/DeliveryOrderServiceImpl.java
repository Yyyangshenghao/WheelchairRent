package com.wheelchair.wym.service.impl;

import com.wheelchair.wym.dao.DeliveryOrderMapper;
import com.wheelchair.wym.entity.DeliveryOrder;
import com.wheelchair.wym.service.IDeliveryOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeliveryOrderServiceImpl implements IDeliveryOrderService {

    @Autowired
    private DeliveryOrderMapper deliveryOrderMapper;

    @Override
    public int createDeliveryOrder(DeliveryOrder deliveryOrder) {
        return deliveryOrderMapper.insertDeliveryOrder(deliveryOrder);
    }

    @Override
    public DeliveryOrder getDeliveryOrderById(Long id) {
        return deliveryOrderMapper.getDeliveryOrderById(id);
    }

    @Override
    public List<DeliveryOrder> getAllDeliveryOrders() {
        return deliveryOrderMapper.getAllDeliveryOrders();
    }

    @Override
    public int updateDeliveryOrder(DeliveryOrder deliveryOrder) {
        return deliveryOrderMapper.updateDeliveryOrder(deliveryOrder);
    }


    @Override
    public int deleteDeliveryOrder(int id) {
        return deliveryOrderMapper.deleteDeliveryOrder(id);
    }

    @Override
    public boolean updateOrderStatus(Long id, Integer status) {
        return deliveryOrderMapper.updateOrderStatus(id, status) > 0;
    }
}
