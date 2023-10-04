package com.dev.order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.order.dto.OrderDto;

@Repository
public class OrderDaoImpl implements OrderDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<OrderDto> selectBasketList(int memberNumber) {
		
		return sqlSession.selectList("com.dev.order.selectBasketList", memberNumber);
	}
	
	@Override
	public OrderDto selectProduct(int movieNumber) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.dev.order.selectProduct", movieNumber);
	}
	
	@Override
	public List<OrderDto> selectAllOrderHistoryList(int memberNumber, int orderHistoryNumber) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNumber", memberNumber);
		map.put("orderHistoryNumber", orderHistoryNumber);
		
		return sqlSession.selectList("com.dev.order.selectAllOrderHistoryList", map);
	}
	
	@Override
	public int selectOrderHistoryTotalCount(int memberNumber) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.dev.order.selectOrderHistoryTotalCount", memberNumber);
	}
	
	@Override
	public List<OrderDto> selectOrderHistory(OrderDto orderDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.dev.order.selectOrderHistory", orderDto);
	}
	
	@Override
	public List<Integer> selectOrderHistoryNumber(int memberNumber, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNumber", memberNumber);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("com.dev.order.selectOrderHistoryNumber", map);
	}
	
	@Override
	public int selectMoviePrice(int movieNumber) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.dev.order.selectMoviePrice", movieNumber);
	}
	
	@Override
	public void deleteBasket(int movieNumber) {
		// TODO Auto-generated method stub
		sqlSession.delete("com.dev.order.deleteBasket", movieNumber);
	}

	@Override
	public void insertOrderHistory(OrderDto orderDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.dev.order.insertOrderHistory", orderDto);
	}
	
	@Override
	public void insertOrderProduct(OrderDto orderDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.dev.order.insertOrderProduct", orderDto);
	}
	
	@Override
	public void insertBasket(int memberNumber, int movieNumber) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNumber", memberNumber);
		map.put("movieNumber", movieNumber);
		sqlSession.insert("com.dev.order.insertBasket", map);
	}
	
	@Override
	public void updateMemberMoney(int memberNumber, int memberMoney) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNumber", memberNumber);
		map.put("memberMoney", memberMoney);
		
		sqlSession.update("com.dev.order.updateMemberMoney", map);
	}

	@Override
	public void updateOrderHistoryState(int orderHistoryNumber) {
		// TODO Auto-generated method stub
		
		sqlSession.update("com.dev.order.updateOrderHistoryState", orderHistoryNumber);
	}


}
