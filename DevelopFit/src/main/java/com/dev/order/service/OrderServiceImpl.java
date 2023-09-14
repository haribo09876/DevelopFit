package com.dev.order.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.order.dao.OrderDao;
import com.dev.order.dto.OrderDto;

@Service
public class OrderServiceImpl implements OrderService{
	
	private static final Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);
	
	@Autowired
	public OrderDao orderDao;
	
	@Override
	public List<OrderDto> basketList(int no) {
		// TODO Auto-generated method stub
		log.info("Welcome OrderServiceImpl basketList!");
		return orderDao.basketList(no);
	}

	

}
