package com.dev.order.service;

import java.util.List;

import com.dev.order.dto.OrderDto;

public interface OrderService {
	
	List<OrderDto> selectBasketList(int memberNumber);
	
	void deleteBasket(int no);

	List<OrderDto> selectOrderHistory(int no);
	
	void insertOrderHistory(int memberNumber, int movieNumber);
	
}
