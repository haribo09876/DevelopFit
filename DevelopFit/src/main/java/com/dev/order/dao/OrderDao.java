package com.dev.order.dao;

import java.util.List;

import com.dev.order.dto.OrderDto;

public interface OrderDao {

	List<OrderDto> selectBasketList(int no);

	List<OrderDto> selectOrderHistory(int no);
	
}
