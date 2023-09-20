package com.dev.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.member.dto.MemberDto;
import com.dev.order.dto.OrderDto;
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
	    
	    try {
	    	MemberDto memberDto = (MemberDto)session.getAttribute("member");
		    
		    List<OrderDto> basketList = orderService.selectBasketList(memberDto.getMemberNumber());
		    model.addAttribute("basketList", basketList);
	
		    return "order/ShoppingBasket";
		} catch (Exception e) {
			// TODO: handle exception
			return "auth/LoginForm";
		}
//	    if(session != null) {
//		    MemberDto memberDto = (MemberDto)session.getAttribute("member");
//		    
//		    List<OrderDto> basketList = orderService.selectBasketList(memberDto.getMemberNumber());
//		    model.addAttribute("basketList", basketList);
//	
//		    return "order/ShoppingBasket";
//	    } else {
//	    	return "auth/LoginForm";
//	    }
	    
	}
	
	
	// 장바구니 삭제
	@ResponseBody
	@RequestMapping(value = "/order/basketCtr.do", method = RequestMethod.POST)
	public String basketCtr(HttpSession session, @RequestParam(value="product") String product, Model model) {
	    log.info("Welcome OrderController basketCtr! delete movieNumber: {}", product);
	    
	    String[] productArr = product.split(",");
	    
	    if(session != null) {
		    for (int i = 0; i < productArr.length; i++) {
		    	orderService.deleteBasket(Integer.parseInt(productArr[i]));
			}
		    return "redirect:basket.do";
	    } else {
	    	return "auth/LoginForm";
	    }
	}
	
	
	// 주문 성공 페이지
	@RequestMapping(value = "/order/success.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String success(HttpSession session, Model model) {
	    // Log4j
	    log.info("Welcome OrderController success Page!");
	    
	    if(session != null) {
		    MemberDto memberDto = (MemberDto)session.getAttribute("member");
		    
		    model.addAttribute("orderHistory", orderService.selectOrderHistory(memberDto.getMemberNumber()));
		    
		    return "order/OrderSuccess";
	    } else {
	    	return "auth/LoginForm";
	    }
	}
	
	
	// 주문 내역에 저장
	@RequestMapping(value = "/order/successCtr.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String successCtr(HttpSession session, String product, Model model) {
	    // Log4j
	    log.info("Welcome OrderController success! successCtr");
	    
	    
	    String[] productArr = product.split(",");
	    
	    if(session != null) {
		    MemberDto memberDto = (MemberDto)session.getAttribute("member");
		    
		    for (int i = 0; i < productArr.length; i++) {
		    	orderService.deleteBasket(Integer.parseInt(productArr[i])); // 장바구니 삭제
		    	orderService.insertOrderHistory(memberDto.getMemberNumber(), Integer.parseInt(productArr[i])); //주문 내역 저장
			}
		    return "redirect:success.do";
	    } else {
	    	return "auth/LoginForm";
	    }
	}
	
	
	// 주문 취소
	@RequestMapping(value = "/order/cancel.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String cancel(Model model) {
	    // Log4j
	    log.info("Welcome OrderController cancel! memberNumber: {}");
	    
	    
	    return "order/OrderCancel";
	}
}
