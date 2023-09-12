package com.dev.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dev.member.dto.MemberDto;
import com.dev.member.service.MemberService;

@Controller
public class MemberController {
	
private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/auth/login.do", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
		
		log.info("Welcome MemberController login!");
		
		return "/auth/LoginForm";
	}
	
	@RequestMapping(value="/auth/loginCtr.do", method = RequestMethod.POST)
	   public String loginCtr(String memberId, String memberPassword, 
	         HttpSession session, Model model) {
	      log.info("Welcome MemberController loginCtr!" + memberId +", "+ memberPassword);
	      
	      MemberDto memberDto = memberService.memberExist(memberId, memberPassword);
	      
	      String viewUrl="";
	      
	      if(memberDto != null) {
	         //회원존재하면 세션에담는다
	         session.setAttribute("member", memberDto);
	         System.out.println("hello");
	         viewUrl = "redirect:/member/list.do";
	      }else {
	         viewUrl =  "/auth/LoginFail";
	      }
	      
	      return viewUrl;
	   }
	
	@RequestMapping(value = "/member/add.do", method = RequestMethod.GET)
	public String memberAdd(Model model) {
		
		log.debug("Welcome MemberController memberAdd!");
		
		return "member/MemberForm";
	}
	
}
