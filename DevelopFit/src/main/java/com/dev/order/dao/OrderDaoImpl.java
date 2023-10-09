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
	
	// 장바구니 리스트
	@Override
	public List<OrderDto> selectBasketList(int memberNumber) {
		
		return sqlSession.selectList("com.dev.order.selectBasketList", memberNumber);
	}
	
	// 장바구니에서 선택한 상품
	@Override
	public OrderDto selectProduct(int movieNumber) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.dev.order.selectProduct", movieNumber);
	}
	
	// 해당 회원의 전체 주문 내역
	@Override
	public List<OrderDto> selectAllOrderHistoryList(int memberNumber, int orderHistoryNumber) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNumber", memberNumber);
		map.put("orderHistoryNumber", orderHistoryNumber);
		
		return sqlSession.selectList("com.dev.order.selectAllOrderHistoryList", map);
	}
	
	// 모든 회원의 전체 주문 내역
	@Override
	public List<OrderDto> selectAllOrderHistoryList(int orderHistoryNumber) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderHistoryNumber", orderHistoryNumber);
		
		return sqlSession.selectList("com.dev.order.selectAllOrderHistoryList", map);
	}
	
	// 회원 주문 내역 갯수
	@Override
	public int selectOrderHistoryTotalCount(int memberNumber) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.dev.order.selectOrderHistoryTotalCount", memberNumber);
	}
	
	// 모든 회원 주문 내역 갯수
	@Override
	public int selectOrderHistoryTotalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.dev.order.selectOrderHistoryTotalCount");
	}
	
	// 주문 내역 정보
	@Override
	public List<OrderDto> selectOrderHistory(OrderDto orderDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.dev.order.selectOrderHistory", orderDto);
	}
	
	// 회원 주문 내역 번호 리스트
	@Override
	public List<Integer> selectOrderHistoryNumber(int memberNumber, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNumber", memberNumber);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("com.dev.order.selectOrderHistoryNumber", map);
	}
	
	// 전체 주문 내역 번호 리스트
		@Override
		public List<Integer> selectOrderHistoryNumber(int start, int end) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			return sqlSession.selectList("com.dev.order.selectOrderHistoryNumber", map);
		}
	
	// 영화 가격
	@Override
	public int selectMoviePrice(int movieNumber) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.dev.order.selectMoviePrice", movieNumber);
	}
	
	// 장바구니 선택 상품 삭제
	@Override
	public void deleteBasket(int movieNumber) {
		// TODO Auto-generated method stub
		sqlSession.delete("com.dev.order.deleteBasket", movieNumber);
	}

	// 주문 내역 저장
	@Override
	public void insertOrderHistory(OrderDto orderDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.dev.order.insertOrderHistory", orderDto);
	}
	
	// 주문 내역 상품 저장
	@Override
	public void insertOrderProduct(OrderDto orderDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.dev.order.insertOrderProduct", orderDto);
	}
	
	// 장바구니 저장
	@Override
	public void insertBasket(int memberNumber, int movieNumber) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNumber", memberNumber);
		map.put("movieNumber", movieNumber);
		sqlSession.insert("com.dev.order.insertBasket", map);
	}
	
	// 회원 돈 업데이트
	@Override
	public void updateMemberMoney(int memberNumber, int memberMoney) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNumber", memberNumber);
		map.put("memberMoney", memberMoney);
		
		sqlSession.update("com.dev.order.updateMemberMoney", map);
	}

	// 회원 주문 내역 상태 업데이트
	@Override
	public void updateOrderHistoryState(int orderHistoryNumber) {
		// TODO Auto-generated method stub
		
		sqlSession.update("com.dev.order.updateOrderHistoryState", orderHistoryNumber);
	}


}
