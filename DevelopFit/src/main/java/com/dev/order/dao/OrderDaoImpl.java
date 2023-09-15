package com.dev.order.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.order.dto.OrderDto;

@Repository
public class OrderDaoImpl implements OrderDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<OrderDto> selectBasketList(int no) {
		
		return sqlSession.selectList("com.dev.order.selectBasketList", no);
	}

	@Override
	public List<OrderDto> selectOrderHistory(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.dev.order.selectOrderHistory", no);
	}

}
