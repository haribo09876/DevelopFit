package com.dev.order.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
	private int orderCount = 1;
	private String saveDate = "";
	
	@Autowired
	public OrderDao orderDao;
	
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	
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
	public List<OrderDto> selectAllOrderHistoryList(int memberNumber, int orderHistoryNumber) {
		// TODO Auto-generated method stub
		log.info("Welcome OrderServiceImpl selectOrderHistory!");
		return orderDao.selectAllOrderHistoryList(memberNumber, orderHistoryNumber);
	}
	
	@Override
	public int selectOrderHistoryTotalCount(int memberNumber) {
		// TODO Auto-generated method stub
		return orderDao.selectOrderHistoryTotalCount(memberNumber);
	}
	
	@Override
	public List<OrderDto> selectOrderHistory(OrderDto orderDto) {
		// TODO Auto-generated method stub
		return orderDao.selectOrderHistory(orderDto);
	}
	
	@Override
	public List<Integer> selectOrderHistoryNumber(int memberNumber, int start, int end) {
		return orderDao.selectOrderHistoryNumber(memberNumber, start, end);
	}
	
	@Override
	public int selectMoviePrice(int movieNumber) {
		// TODO Auto-generated method stub
		return orderDao.selectMoviePrice(movieNumber);
	}
	
	@Override
	public void deleteBasket(int movieNumber) {
		orderDao.deleteBasket(movieNumber);
	}

	@Override
	public void insertOrderHistory(OrderDto orderDto) {
		// TODO Auto-generated method stub
		LocalDate now = LocalDate.now(); //현재날짜
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd"); //포맷형식
		
		if(!saveDate.equals(now.format(formatter))) {
			saveDate = now.format(formatter);
			orderCount = 1;
			orderDto.setOrderHistoryNumber(Integer.parseInt(saveDate + String.format("%03d", orderCount++)));
		} else {
			orderDto.setOrderHistoryNumber(Integer.parseInt(saveDate + String.format("%03d", orderCount++)));
		}
		
		orderDao.insertOrderHistory(orderDto);
	}
	
	@Override
	public void insertOrderProduct(OrderDto orderDto) {
		// TODO Auto-generated method stub
		orderDao.insertOrderProduct(orderDto);
	}
	
	@Override
	public void insertBasket(int memberNumber, int movieNumber) {
		// TODO Auto-generated method stub
		orderDao.insertBasket(memberNumber, movieNumber);
	}
	
	@Override
	public void updateMemberMoney(int memberNumber, int memberMoney) {
		// TODO Auto-generated method stub
		orderDao.updateMemberMoney(memberNumber, memberMoney);
	}

	@Override
	public void updateOrderHistoryState(int orderHistoryNumber) {
		// TODO Auto-generated method stub
		
		orderDao.updateOrderHistoryState(orderHistoryNumber);
	}

}
