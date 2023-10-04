package com.dev.order.service;

import java.util.List;

import com.dev.order.dto.OrderDto;

public interface OrderService {
	
	List<OrderDto> selectBasketList(int memberNumber);
	
	OrderDto selectProduct(int movieNumber);
	
	List<OrderDto> selectAllOrderHistoryList(int memberNumber, int orderHistoryNumber);
	
	int selectOrderHistoryTotalCount(int memberNumber);
	
	List<OrderDto> selectOrderHistory(OrderDto orderDto);
	
	List<Integer> selectOrderHistoryNumber(int memberNumber, int start, int end);
	
	int selectMoviePrice(int movieNumber);

	void deleteBasket(int movieNumber);
	
	void insertOrderHistory(OrderDto orderDto);
	
	void insertOrderProduct(OrderDto orderDto);
	
	void insertBasket(int memberNumber, int movieNumber);
	
	void updateMemberMoney(int memberNumber, int memberMoney);
	
	void updateOrderHistoryState(int orderHistoryNumber);
	
}
