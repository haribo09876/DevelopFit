package com.dev.order.dao;

import java.util.List;

import com.dev.order.dto.OrderDto;

public interface OrderDao {

	List<OrderDto> selectBasketList(int memberNumber);

	OrderDto selectProduct(int movieNumber);
	
	List<OrderDto> selectOrderHistory(int no);
	
	void deleteBasket(int no);
	
	void insertOrderHistory(int memberNumber, int movieNumber);
}
