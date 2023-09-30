package com.dev.order.dao;

import java.util.List;

import com.dev.order.dto.OrderDto;

public interface OrderDao {

	List<OrderDto> selectBasketList(int memberNumber);

	OrderDto selectProduct(int movieNumber);
	
	List<OrderDto> selectAllOrderHistoryList(int memberNumber, int orderHistoryNumber);
	
	List<OrderDto> selectOrderHistory(OrderDto orderDto);
	
	List<Integer> selectOrderHistoryNumber(int memberNumber);
	
	int selectMoviePrice(int movieNumber);
	
	void deleteBasket(int movieNumber);
	
	void insertOrderHistory(OrderDto orderDto);
	
	void insertOrderProduct(OrderDto orderDto);
	
	void updateMemberMoney(int memberNumber, int memberMoney);
}
