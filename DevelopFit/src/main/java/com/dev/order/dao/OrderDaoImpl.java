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
	public List<OrderDto> selectOrderHistory(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.dev.order.selectOrderHistory", no);
	}

	@Override
	public void deleteBasket(int no) {
		// TODO Auto-generated method stub
		sqlSession.delete("com.dev.order.deleteBasket", no);
	}

	@Override
	public void insertOrderHistory(int memberNumber, int movieNumber) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNumber", memberNumber);
		map.put("movieNumber", movieNumber);
		
		sqlSession.insert("com.dev.order.insertOrderHistory", map);
	}

}
