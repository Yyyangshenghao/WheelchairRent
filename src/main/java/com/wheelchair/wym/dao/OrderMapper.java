package com.wheelchair.wym.dao;

import java.util.List;


import com.wheelchair.wym.entity.Order;
import com.wheelchair.wym.entity.Page;
import com.wheelchair.wym.entity.UserOrder;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
public interface OrderMapper {
	/**
	 *   添加房屋订单
	 * @param order
	 * @return
	 */
	 public int addOrder(Order order);
	 /**
	  * 查询所有订单信息
	  * @return
	  */
	 public List<UserOrder> findAllOrder(Page page);
	 /**
	  * 查询所有订单数
	  * @return
	  */
	 public int getOrderCount(int uID);
	 /**
	  * 删除用户订单
	  * @param oID
	  * @return
	  */
	 public int deleteOrder(int oID);
	 
}
