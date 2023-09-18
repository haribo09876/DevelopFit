package com.dev.order.service;

import java.util.List;

import com.dev.order.dto.OrderDto;

public interface OrderService {
	
	List<OrderDto> selectBasketList(int memberNumber);
	
	List<OrderDto> selectOrderHistory(int no);
	
	void deleteBasket(int no);
	
}
