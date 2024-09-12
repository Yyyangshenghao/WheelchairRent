package com.wheelchair.wym.service.impl;

import com.wheelchair.wym.dao.OrderMapper;
import com.wheelchair.wym.entity.Order;
import com.wheelchair.wym.entity.Page;
import com.wheelchair.wym.entity.UserOrder;
import com.wheelchair.wym.service.IOrderService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements IOrderService {

	private final OrderMapper mapper;

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

}
