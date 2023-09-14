package com.dev.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dev.member.dto.MemberDto;
import com.dev.member.service.MemberService;

@Controller
public class MemberController {

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	// 로그인 페이지 이동
	@RequestMapping(value = "/auth/login.do", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {

		log.info("Welcome MemberController login!");

		return "/auth/LoginForm";
	}

	// 로그인 성공페이지
	@RequestMapping(value = "/auth/loginSuccess.do", method = RequestMethod.GET)
	public String loginSuccess(HttpSession session, Model model) {

		log.info("Welcome MemberController loginSuccess!");

		return "/auth/LoginSuccess";
	}

	// 로그인 기능 구현
	@RequestMapping(value = "/auth/loginCtr.do", method = RequestMethod.POST)
	public String loginCtr(String memberId, String memberPassword, HttpSession session, Model model) {
		log.info("Welcome MemberController loginCtr!" + memberId + ", " + memberPassword);

		MemberDto memberDto = memberService.memberExist(memberId, memberPassword);

		String viewUrl = "";

		if (memberDto != null) {
			// 회원존재하면 세션에담는다
			session.setAttribute("member", memberDto);
			viewUrl = "redirect:/auth/login.do";

			if (memberDto.getMemberId().equals("kj1109") && memberDto.getMemberPassword().equals("1109kj")) {
				viewUrl = "redirect:/admin/admin.do";
			} else {
				viewUrl = "redirect:/auth/login.do";
			}

		} else {
			viewUrl = "/auth/LoginFail";
		}
		return viewUrl;
	}

	// 로그아웃 기능구현
	@RequestMapping(value = "/auth/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {

		log.info("Welcome MemberController logout!");

		session.invalidate();

		return "redirect:/auth/login.do";
	}

	// 관리자 페이지 이동
	@RequestMapping(value = "/admin/admin.do", method = RequestMethod.GET)
	public String adminPage(Model model) {

		log.debug("Welcome MemberController admin!");

		return "admin/admin";
	}

	// 회원가입 페이지 이동
	@RequestMapping(value = "/member/add.do", method = RequestMethod.GET)
	public String memberAdd(Model model) {

		log.debug("Welcome MemberController memberAdd!");

		return "member/MemberForm";
	}

	// 회원가입 기능 구현
	@RequestMapping(value = "/member/addCtr.do", method = RequestMethod.POST)
	public String memberAdd(MemberDto memberDto, Model model) {
		log.debug("Welcome MemberController memberAddCtr!" + memberDto);
		try {
			memberService.memberInsertOne(memberDto);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("오류 처리할 거 있으면 한다");
			e.printStackTrace();
		}

		return "/auth/LoginForm";
	}

	// 아이디찾기 페이지 이동
	@RequestMapping(value = "/member/findId.do", method = RequestMethod.GET)
	public String findId(Model model) {

		log.debug("Welcome MemberController findId!");

		return "member/findId";
	}

	// 아이디찾기 기능구현
	@RequestMapping(value = "/member/findIdCtr.do", method = RequestMethod.POST)
	public String findIdCtr(String memberEmail, String memberPhoneNumber, HttpSession session, Model model) {
		log.info("Welcome MemberController loginCtr!" + memberEmail + ", " + memberPhoneNumber);

		MemberDto memberDto = memberService.findId(memberEmail, memberPhoneNumber);

		String viewUrl = "";

		if (memberDto != null) {
			// 회원존재하면 세션에담는다
			session.setAttribute("member", memberDto);
			viewUrl = "/member/findIdSuccess";
		} else {
			viewUrl = "/member/findIdFail";
		}
		return viewUrl;
	}

	// 비밀번호찾기 페이지 이동
	@RequestMapping(value = "/member/findPw.do", method = RequestMethod.GET)
	public String findPw(Model model) {

		log.debug("Welcome MemberController findPw!");

		return "member/findPw";
	}

	// 비밀번호찾기 기능구현
	@RequestMapping(value = "/member/findPwCtr.do", method = RequestMethod.POST)
	public String findPwCtr(String memberId, String memberEmail, HttpSession session, Model model) {
		log.info("Welcome MemberController loginCtr!" + memberId + ", " + memberEmail);

		MemberDto memberDto = memberService.findPw(memberId, memberEmail);

		String viewUrl = "";

		if (memberDto != null) {
			// 회원존재하면 세션에담는다
			session.setAttribute("member", memberDto);
			viewUrl = "/member/findPwSuccess";
		} else {
			viewUrl = "/member/findPwFail";
		}
		return viewUrl;
	}

	// 마이페이지 페이지 이동
	@RequestMapping(value = "/member/myPage.do", method = RequestMethod.GET)
	public String myPage(Model model) {

		log.debug("Welcome MemberController myPage!");

		return "member/myPage";
	}

}
