package com.wheelchair.wym.dao;

import com.wheelchair.wym.entity.DeliveryOrder;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface DeliveryOrderMapper {

    // 插入配送订单
    int insertDeliveryOrder(DeliveryOrder deliveryOrder);

    // 根据ID删除配送订单
    int deleteDeliveryOrder(int id);

    // 根据ID获取配送订单
    DeliveryOrder getDeliveryOrderById(Long id);

    // 获取所有配送订单
    List<DeliveryOrder> getAllDeliveryOrders();

    // 更新配送订单
    int updateDeliveryOrder(DeliveryOrder deliveryOrder);

    // 更新订单状态
    int updateOrderStatus(Long id, Integer status);
}
