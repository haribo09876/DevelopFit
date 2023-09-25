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
	public List<OrderDto> selectBasketList(int memberNumber) {
		// TODO Auto-generated method stub
		log.info("Welcome OrderServiceImpl selectBasketList!");
		return orderDao.selectBasketList(memberNumber);
	}

	@Override
	public OrderDto selectProduct(int movieNumber) {
		// TODO Auto-generated method stub
		return orderDao.selectProduct(movieNumber);
	}
	
	@Override
	public List<OrderDto> selectOrderHistory(int no) {
		// TODO Auto-generated method stub
		log.info("Welcome OrderServiceImpl selectOrderHistory!");
		return orderDao.selectOrderHistory(no);
	}

	@Override
	public void deleteBasket(int no) {
		orderDao.deleteBasket(no);
		
	}

	@Override
	public void insertOrderHistory(int memberNumber, int movieNumber) {
		// TODO Auto-generated method stub
		orderDao.insertOrderHistory(memberNumber, movieNumber);
	}

}
