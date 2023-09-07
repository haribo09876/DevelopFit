package com.dev.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dev.member.controller.MemberController;
import com.dev.member.service.MemberService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class MemberController {
	
private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
//	@Autowired
//	private MemberService memberService;
	
	@RequestMapping(value = "/auth/login.do", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
		
		log.info("Welcome MemberController login!");
		
		return "/auth/LoginForm";
	}
	
	@RequestMapping(value = "/member/add.do", method = RequestMethod.GET)
	public String memberAdd(Model model) {
		
		log.debug("Welcome MemberController memberAdd!");
		
		return "member/MemberForm";
	}
	
}
