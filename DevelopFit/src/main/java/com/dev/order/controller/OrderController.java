package com.dev.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.member.dto.MemberDto;
import com.dev.order.dto.OrderDto;
import com.dev.order.service.OrderService;
import com.dev.util.Paging;

@Controller
public class OrderController {

	private static final Logger log = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderService orderService;
	
	
	@GetMapping(value = "/basketList.do")
	@ResponseBody
	public List<OrderDto> basketList(@RequestParam("memberNumber") int memberNumber) {
		return orderService.selectBasketList(memberNumber);
	}
	
	
	// 장바구니 페이지
	@RequestMapping(value = "/order/basket.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String basket(HttpSession session, Model model) {
	    // Log4j
	    log.info("Welcome OrderController basket! memberNumber: {}", session);
	    
	    try {
	    	MemberDto member = (MemberDto)session.getAttribute("member");
		    System.out.println(member.getMemberNumber());
		    List<OrderDto> basketList = orderService.selectBasketList(member.getMemberNumber()); //장바구니 목록 가져오기
		    
		    for (int i = 0; i < basketList.size(); i++) {
				basketList.get(i).setMovieSummary(basketList.get(i).getMovieSummary().replaceAll("/r/n", "<br>"));
			}
		    
		    model.addAttribute("basketList", basketList);
		    
		    return "order/ShoppingBasket"; // 장바구니jsp
		} catch (Exception e) {
			// TODO: handle exception
			return "redirect:/auth/login.do";
		}
	    
	}
	
	// 장바구니 삭제
	@RequestMapping(value = "/order/basketCtr.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String basketCtr(HttpSession session, @RequestParam List<String> product, Model model) {
	    log.info("Welcome OrderController basketCtr! delete movieNumber: {}", product);
	    
	    try {
	    	for (int i = 0; i < product.size(); i++) {
		    	orderService.deleteBasket(Integer.parseInt(product.get(i))); // 장바구니 삭제
			}
	    	return "redirect:/order/basket.do"; //장바구니
	    } catch (Exception e) {
	    	// TODO: handle exception
	    	return "redirect:/auth/login.do";
	    }
	}
	
	// 장바구니 추가
	@RequestMapping(value = "/order/basketInsertCtr.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String basketInsertCtr(HttpSession session, int movieNumber, Model model) {
	    log.info("Welcome OrderController basketCtr! delete movieNumber: {}", movieNumber);
	    
	    try {
	    	MemberDto member = (MemberDto)session.getAttribute("member");
	    	
		    orderService.insertBasket(member.getMemberNumber(), movieNumber);
		    
	    	return "redirect:/movie/listOne.do?movieNumber=" + movieNumber;
	    } catch (Exception e) {
	    	// TODO: handle exception
	    	return "redirect:/auth/login.do";
	    }
	}
	
	
	// 결제 페이지
	@RequestMapping(value = "/order/payment.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String payment(HttpSession session, @RequestParam List<String> product, Model model) {
	    // Log4j
	    log.info("Welcome OrderController payment Page! {}", product);

	    try {
		    List<OrderDto> productList = new ArrayList<OrderDto>();
		    
	    	for (int i = 0; i < product.size(); i++) {
		    	productList.add(orderService.selectProduct(Integer.parseInt(product.get(i)))); //선택한 영화 가져오기
		    	productList.get(i).setMovieSummary(productList.get(i).getMovieSummary().replaceAll("/r/n", "<br>"));
			}
	    	
		    model.addAttribute("productList", productList);
		    
		    return "order/OrderPayment"; // 결제페이지.jsp
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "redirect:/auth/login.do";
		}
	    
	}
	
	
	// 결제하기
	@RequestMapping(value = "/order/paymentCtr.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String paymentCtr(HttpSession session, @RequestParam List<String> moviePrice, 
			@RequestParam List<String> product, Model model) {
	    // Log4j
	    log.info("Welcome OrderController paymentCtr! moviePrice: {}, productNo: {}", moviePrice, product);
	    
	    try {
	    	MemberDto member = (MemberDto)session.getAttribute("member");
	    	OrderDto orderDto = new OrderDto();
	    	
	    	orderDto.setMemberNumber(member.getMemberNumber());

	    	int totalMoviePrice = 0;
	    	
	    	orderService.insertOrderHistory(orderDto); //주문내역 저장
	    	
	    	for (int i = 0; i < product.size(); i++) {
	    		orderDto.setMovieNumber(Integer.parseInt(product.get(i)));
		    	orderService.insertOrderProduct(orderDto); //주문내역 상품 저장
		    	orderService.deleteBasket(Integer.parseInt(product.get(i))); // 장바구니 삭제
		    	totalMoviePrice += Integer.parseInt(moviePrice.get(i)); //영화 총액
			}
	    	
	    	// 결제 후 잔액
	    	int balance = member.getMemberMoney() - totalMoviePrice;
	    	
	    	//잔액 업데이트
	    	orderService.updateMemberMoney(member.getMemberNumber(), balance);
	    	
	    	//세션 업데이트
	    	member.setMemberMoney(balance);
	    	session.setAttribute("member", member);
	    	
	    	return "redirect:success.do?orderNumber=" + orderDto.getOrderHistoryNumber(); //주문 성공
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "redirect:/auth/login.do";
		}
	    
	}
	
	// 주문 성공 페이지
	@RequestMapping(value = "/order/success.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String success(HttpSession session, int orderNumber, Model model) {
	    // Log4j
	    log.info("Welcome OrderController success Page!");
	    
	    if(session != null) {
		    MemberDto member = (MemberDto)session.getAttribute("member");
		    OrderDto orderDto = new OrderDto();
		    
	    	orderDto.setMemberNumber(member.getMemberNumber());
		    orderDto.setOrderHistoryNumber(orderNumber);
		    
		    List<OrderDto> orderHistory = orderService.selectOrderHistory(orderDto);
		    
		    for (int i = 0; i < orderHistory.size(); i++) {
		    	orderHistory.get(i).setMovieSummary(orderHistory.get(i).getMovieSummary().replaceAll("/r/n", "<br>"));
			}
		    model.addAttribute("orderHistory", orderHistory);
		    
		    return "order/OrderSuccess"; //주문성공.jsp
	    } else {
	    	return "redirect:/auth/login.do";
	    }
	}
	
	
	// 회원 주문 전체 내역
	@RequestMapping(value = "/order/history.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String history(HttpSession session, @RequestParam(defaultValue = "1")int curPage, Model model) {
	    // Log4j
	    log.info("Welcome OrderController history! memberNumber:");
	    
	    try {
		    MemberDto member = (MemberDto)session.getAttribute("member");
			
			int totalCount = orderService.selectOrderHistoryTotalCount(member.getMemberNumber());
			
			Paging orderHistoryPaging = new Paging(totalCount, curPage);
			
			int start = orderHistoryPaging.getPageBegin();
			int end = orderHistoryPaging.getPageEnd();
			
			// 주문번호 리스트
			List<Integer> historyNumber = orderService.selectOrderHistoryNumber(member.getMemberNumber(), start, end);
		    
			// 주문내역 리스트
			List<OrderDto> historyList = new ArrayList<OrderDto>();
		    List<List<OrderDto>> historyList2d = new ArrayList<List<OrderDto>>();
		    
		    for(int i = 0; i < historyNumber.size(); i++) {
		    	historyList = orderService.selectAllOrderHistoryList(member.getMemberNumber(), historyNumber.get(i));
		    	for (int j = 0; j < historyList.size(); j++) {
		    		historyList.get(j).setMovieSummary(historyList.get(j).getMovieSummary().replaceAll("/r/n", "<br>"));
				}
		    	historyList2d.add(historyList);
		    }
		    
		    // 페이징
		    HashMap<String, Object> pagingMap = new HashMap<>();
			pagingMap.put("totalCount", totalCount);
			pagingMap.put("orderHistoryPaging", orderHistoryPaging);
		    
		    model.addAttribute("historyList2d", historyList2d);
		    model.addAttribute("pagingMap", pagingMap);
		    
		    return "order/OrderHistory";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "redirect:/auth/login.do";
		}
	    
	}
	
	
	// 주문 취소 페이지
	@RequestMapping(value = "/order/cancel.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String cancel(HttpSession session, int orderNumber, Model model) {
	    // Log4j
	    log.info("Welcome OrderController cancel! memberNumber: {}");
	    
	    try {
	    	MemberDto member = (MemberDto)session.getAttribute("member");
		    OrderDto orderDto = new OrderDto();
		    
	    	orderDto.setMemberNumber(member.getMemberNumber());
		    orderDto.setOrderHistoryNumber(orderNumber);
		    
		    List<OrderDto> orderHistory = orderService.selectOrderHistory(orderDto);
		    
		    for (int i = 0; i < orderHistory.size(); i++) {
		    	orderHistory.get(i).setMovieSummary(orderHistory.get(i).getMovieSummary().replaceAll("/r/n", "<br>"));
			}
		    model.addAttribute("orderHistory", orderHistory);
		    
		    return "order/OrderCancel";
	    } catch (Exception e) {
			// TODO: handle exception
	    	e.printStackTrace();
	    	return "redirect:/auth/login.do";
		}
	    
	}
	
	
	// 주문 취소하기
	@RequestMapping(value = "/order/cancelCtr.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String cancelCtr(HttpSession session, @RequestParam List<String> movieNumber, int orderHistoryNumber, Model model) {
	    // Log4j
	    log.info("Welcome OrderController cancel! memberNumber: {}");
	    
	    try {
	    	int totalPrice = 0;
	    	for (int i = 0; i < movieNumber.size(); i++) {
	    		totalPrice += orderService.selectMoviePrice(Integer.parseInt(movieNumber.get(i)));
			}
	    	
	    	MemberDto member = (MemberDto)session.getAttribute("member");
		    
		    int userMoney = member.getMemberMoney() + totalPrice;
		    int memberNumber = member.getMemberNumber();
		    
		    // 주문 상태 변경
		    orderService.updateOrderHistoryState(orderHistoryNumber);
		    
		    // 유저 머니 환불완료
		    orderService.updateMemberMoney(memberNumber, userMoney);
		    
		    member.setMemberMoney(userMoney);
		    session.setAttribute("member", member);
		    
		    return "redirect:/order/history.do";
	    } catch (Exception e) {
			// TODO: handle exception
	    	e.printStackTrace();
	    	return "redirect:/auth/login.do";
		}
	    
	}
	
	
	// 머니 충전 페이지
	@RequestMapping(value = "/order/charging.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String Charging(HttpSession session, Model model) {
		log.info("Welcome OrderController charging!");
		try {
			return "order/OrderCharging";
		} catch (Exception e) {
			// TODO: handle exception
			return "redirect:/auth/login.do";
		}
		
	}
	
	// 머니 충전하기
		@RequestMapping(value = "/order/chargingCtr.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String ChargingCtr(HttpSession session, int chargingMoney, Model model) {
			log.info("Welcome OrderController chargingCtr!");
			
			try {
				MemberDto member = (MemberDto)session.getAttribute("member");
				int memberNumber = member.getMemberNumber();
				int memberMoney = member.getMemberMoney();
				
				int userMoney = memberMoney + chargingMoney;
				
				orderService.updateMemberMoney(memberNumber, userMoney);
				
				member.setMemberMoney(userMoney);
				session.setAttribute("member", member);
				
				return "order/ChargingSuccess";
			} catch (Exception e) {
				e.printStackTrace();
				return "redirect:/auth/login.do";
			}
			
		}
		
		
	// 관리자 페이지 전체 주문 내역
	@RequestMapping(value = "/admin/history.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String admin(HttpSession session, @RequestParam(defaultValue = "1") int curPage, Model model) {
		
		int totalCount = orderService.selectOrderHistoryTotalCount(); // 전체 주문 갯수
		
		Paging orderHistoryPaging = new Paging(totalCount, curPage);
		
		int start = orderHistoryPaging.getPageBegin();
		int end = orderHistoryPaging.getPageEnd();
		
		// 주문내역 리스트
		List<Integer> historyNumber = orderService.selectOrderHistoryNumber(start, end);
		
	    List<List<OrderDto>> historyList = new ArrayList<List<OrderDto>>();
	    
	    for(int i = 0; i < historyNumber.size(); i++) {
	    	historyList.add(orderService.selectAllOrderHistoryList(historyNumber.get(i)));
	    }
	    
	    // 페이징
	    HashMap<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("orderHistoryPaging", orderHistoryPaging);
	    
	    model.addAttribute("historyList2d", historyList);
	    model.addAttribute("pagingMap", pagingMap);
		
		return "admin/AdminOrderHistory";
	}
	
}
