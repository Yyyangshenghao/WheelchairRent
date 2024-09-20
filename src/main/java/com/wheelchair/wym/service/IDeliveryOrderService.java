package com.wheelchair.wym.service;

import com.wheelchair.wym.entity.DeliveryOrder;

import java.util.List;

public interface IDeliveryOrderService {

    // 创建配送订单
    int createDeliveryOrder(DeliveryOrder deliveryOrder);

    // 根据ID获取配送订单
    DeliveryOrder getDeliveryOrderById(Long id);

    // 获取所有配送订单
    List<DeliveryOrder> getAllDeliveryOrders();

    // 更新配送订单
    int updateDeliveryOrder(DeliveryOrder deliveryOrder);

    // 删除配送订单
    int deleteDeliveryOrder(int id);

    // 确认配送订单
    boolean updateOrderStatus(Long id, Integer status);
}
