package com.dev.order.service;

import java.util.List;

import com.dev.order.dto.OrderDto;

public interface OrderService {
	
	List<OrderDto> selectBasketList(int memberNumber);
	
	OrderDto selectProduct(int movieNumber);
	
	List<OrderDto> selectOrderHistory(int no);

	void deleteBasket(int movieNumber);
	
	void insertOrderHistory(int memberNumber);
	
	void insertOrderProduct(int movieNumber);
	
	void updateMemberMoney(int memberNumber, int memberMoney);
}
