package com.dev.order.controller;

import java.util.ArrayList;
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
		    
		    List<OrderDto> basketList = orderService.selectBasketList(memberDto.getMemberNumber()); //장바구니 목록 가져오기
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
	
	
	// 결제 페이지
	@RequestMapping(value = "/order/payment.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String payment(HttpSession session, @RequestParam List<String> product, Model model) {
	    // Log4j
	    log.info("Welcome OrderController payment Page! {}", product);

	    try {
		    List<OrderDto> productList = new ArrayList<OrderDto>();
		    
	    	for (int i = 0; i < product.size(); i++) {
		    	productList.add(orderService.selectProduct(Integer.parseInt(product.get(i)))); //선택한 영화 가져오기
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
	    	MemberDto memberDto = (MemberDto)session.getAttribute("member");
	    	int totalMoviePrice = 0;
	    	
	    	orderService.insertOrderHistory(memberDto.getMemberNumber()); //주문내역 저장
	    	
	    	for (int i = 0; i < product.size(); i++) {
		    	orderService.insertOrderProduct(Integer.parseInt(product.get(i))); //주문내역 상품 저장
		    	orderService.deleteBasket(Integer.parseInt(product.get(i))); // 장바구니 삭제
		    	totalMoviePrice += Integer.parseInt(moviePrice.get(i)); //영화 총액
			}
	    	
	    	// 결제 후 잔액
	    	int balance = memberDto.getMemberMoney() - totalMoviePrice;
	    	
	    	//잔액 업데이트
	    	orderService.updateMemberMoney(memberDto.getMemberNumber(), balance);
	    	
	    	//세션 업데이트
	    	memberDto.setMemberMoney(balance);
	    	session.setAttribute("member", memberDto);
	    	
	    	return "redirect:success.do"; //주문 성공
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "redirect:/auth/login.do";
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
		    
		    return "order/OrderSuccess"; //주문성공.jsp
	    } else {
	    	return "redirect:/auth/login.do";
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
