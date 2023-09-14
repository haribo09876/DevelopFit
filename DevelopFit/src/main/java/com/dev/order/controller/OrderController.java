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

import com.dev.member.dto.MemberDto;
import com.dev.order.dto.OrderDto;
import com.dev.order.service.OrderService;

@Controller
public class OrderController {

	private static final Logger log = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/order/basket.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String basket(HttpSession session, Model model) {
	    // Log4j
	    log.info("Welcome OrderController basket! memberNumber: {}", session);
	    
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
	    
	    model.addAttribute("basketList", orderService.basketList(1));
	    return "order/ShoppingBasket";
	}
	
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
	    
//	    model.addAttribute("basketList", orderService.basketList(1));
	    return "order/OrderSuccess";
	}
	
	@RequestMapping(value = "/order/cancel.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String cancel(Model model) {
	    // Log4j
	    log.info("Welcome OrderController cancel! memberNumber: {}");


	    return "order/OrderCancel";
	}
}
