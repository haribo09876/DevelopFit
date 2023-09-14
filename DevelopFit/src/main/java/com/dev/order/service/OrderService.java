package com.dev.order.service;

import java.util.List;

import com.dev.order.dto.OrderDto;

public interface OrderService {
	
	List<OrderDto> basketList(int no);
	
}
