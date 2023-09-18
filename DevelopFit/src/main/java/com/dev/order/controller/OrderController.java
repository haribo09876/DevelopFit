package com.dev.order.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dev.member.dto.MemberDto;
import com.dev.order.service.OrderService;

@Controller
public class OrderController {

	private static final Logger log = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderService orderService;
	
	// 장바구니 페이지
	@RequestMapping(value = "/order/basket.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String basket(HttpSession session, Model model) {
	    // Log4j
	    log.info("Welcome OrderController basket! memberNumber: {}", session);
	    MemberDto memberDto = (MemberDto)session.getAttribute("memberDto");

	    
//	    if(session != null) {
//		    MemberDto memberDto = (MemberDto)session.getAttribute("memberDto");
//		    int memberNumber = memberDto.getMemberNumber();
//		    List<OrderDto> basketList = orderService.basketList(memberNumber);
//		    model.addAttribute("basketList", orderService.basketList(1));
//	
//		    return "auth/LoginForm";
//	    } else {
//	    	return "order/ShoppingBasket";
//	    }
	    
	    model.addAttribute("basketList", orderService.selectBasketList(1));
	    return "order/ShoppingBasket";
	}
	
	
	// 장바구니 삭제
	@RequestMapping(value = "/order/basketCtr.do", method = RequestMethod.POST)
	public String basketCtr(String product, Model model) {
	    log.info("Welcome OrderController basketCtr! {}");
	    
	    String[] productArr = product.split(",");
	    orderService.deleteBasket(1);
	    orderService.deleteBasket(2);
	    return "redirect:success.do";
	}
	
	
	// 주문 성공
	@RequestMapping(value = "/order/success.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String success(HttpSession session, Model model) {
	    // Log4j
	    log.info("Welcome OrderController success! memberNumber: {}", session);
	    
	    
//	    if(session != null) {
//		    MemberDto memberDto = (MemberDto)session.getAttribute("memberDto");
//		    int memberNumber = memberDto.getMemberNumber();
//		    List<OrderDto> basketList = orderService.basketList(memberNumber);
//		    model.addAttribute("basketList", orderService.basketList(1));
//	
//		    return "auth/LoginForm";
//	    } else {
//	    	return "order/ShoppingBasket";
//	    }
	    
	    model.addAttribute("orderHistory", orderService.selectOrderHistory(1));
	    return "order/OrderSuccess";
	}
	
	
	// 주문 취소
	@RequestMapping(value = "/order/cancel.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String cancel(Model model) {
	    // Log4j
	    log.info("Welcome OrderController cancel! memberNumber: {}");
	    
	    
	    return "order/OrderCancel";
	}
}
