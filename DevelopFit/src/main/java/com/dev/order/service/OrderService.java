package com.dev.order.service;

import java.util.List;

import com.dev.order.dto.OrderDto;

public interface OrderService {
	
	List<OrderDto> selectBasketList(int memberNumber); // 장바구니 리스트

	OrderDto selectProduct(int movieNumber); // 장바구니에서 선택한 상품
	
	List<OrderDto> selectAllOrderHistoryList(int memberNumber, int orderHistoryNumber); // 해당 회원의 전체 주문 내역

	List<OrderDto> selectAllOrderHistoryList(int orderHistoryNumber); // 모든 회원의 전체 주문 내역
	
	int selectOrderHistoryTotalCount(int memberNumber); // 회원 주문 내역 갯수

	int selectOrderHistoryTotalCount(); // 모든 회원 주문 내역 갯수
	
	List<OrderDto> selectOrderHistory(OrderDto orderDto); // 주문 내역 정보
	
	List<Integer> selectOrderHistoryNumber(int memberNumber, int start, int end); // 회원 주문 내역 번호 리스트
	
	List<Integer> selectOrderHistoryNumber(int start, int end); // 전체 주문 내역 번호 리스트
	
	int selectMoviePrice(int movieNumber); // 영화 가격
	
	void deleteBasket(int movieNumber); // 장바구니 선택 상품 삭제
	
	void insertOrderHistory(OrderDto orderDto); // 주문 내역 저장
	
	void insertOrderProduct(OrderDto orderDto); // 주문 내역 상품 저장
	
	void insertBasket(int memberNumber, int movieNumber); // 장바구니 저장
	
	void updateMemberMoney(int memberNumber, int memberMoney); // 회원 돈 업데이트
	
	void updateOrderHistoryState(int orderHistoryNumber); // 회원 주문 내역 상태 업데이트
	
}
