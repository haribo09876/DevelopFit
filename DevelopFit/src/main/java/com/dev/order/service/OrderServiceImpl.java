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
	public void deleteBasket(int movieNumber) {
		orderDao.deleteBasket(movieNumber);
		
	}

	@Override
	public void insertOrderHistory(int memberNumber) {
		// TODO Auto-generated method stub
		orderDao.insertOrderHistory(memberNumber);
	}
	
	@Override
	public void insertOrderProduct(int movieNumber) {
		// TODO Auto-generated method stub
		orderDao.insertOrderProduct(movieNumber);
	}

	@Override
	public void updateMemberMoney(int memberNumber, int memberMoney) {
		// TODO Auto-generated method stub
		orderDao.updateMemberMoney(memberNumber, memberMoney);
	}

}
