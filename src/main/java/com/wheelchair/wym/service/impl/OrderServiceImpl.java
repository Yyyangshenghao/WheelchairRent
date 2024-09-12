package com.wheelchair.wym.service.impl;

import java.util.List;

import com.wheelchair.wym.dao.OrderMapper;
import com.wheelchair.wym.entity.Order;
import com.wheelchair.wym.entity.Page;
import com.wheelchair.wym.entity.UserOrder;
import com.wheelchair.wym.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements IOrderService {

	@Autowired
	private OrderMapper mapper;
	
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
