package com.dev.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dev.util.Paging;
import com.dev.member.dto.MemberDto;
import com.dev.member.service.MemberService;
import com.dev.order.dto.OrderDto;

@Controller
public class MemberController {

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	
	
	@GetMapping(value = "/idExist.do")
	@ResponseBody
	public String idExist(@RequestParam("idChk") String idChk) {
		return memberService.idExist(idChk);
	}
	
	@GetMapping(value = "/emailExist.do")
	@ResponseBody
	public String emailExist(@RequestParam("emailChk") String emailChk) {
		return memberService.emailExist(emailChk);
	}
	
	// 로그인 페이지 이동
	@RequestMapping(value = "/auth/login.do", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
		log.info("Welcome MemberController login!");
		
		try {
			return "/auth/LoginForm";
		} catch (Exception e) {
			// TODO: handle exception
			return "redirect:/auth/login.do";
		}
		
	}

	// 로그인 성공페이지
	@RequestMapping(value = "/auth/loginSuccess.do", method = RequestMethod.GET)
	public String loginSuccess(HttpSession session, Model model) {
		log.info("Welcome MemberController loginSuccess!");
		
		try {
			return "/auth/LoginSuccess";
		} catch (Exception e) {
			// TODO: handle exception
			return "redirect:/auth/login.do";
		}
		
	}

	// 로그인 기능 구현
	@RequestMapping(value = "/auth/loginCtr.do", method = RequestMethod.POST)
	public String loginCtr(String memberId, String memberPassword, HttpSession session, Model model) {
		log.info("Welcome MemberController loginCtr!" + memberId + ", " + memberPassword);
		
		try {
			MemberDto memberDto = memberService.memberExist(memberId, memberPassword);

			session.setAttribute("member", memberDto);
			
			return "redirect:/movie/homePage.do";
		} catch (Exception e) {
			// TODO: handle exception
			return "redirect:/auth/login.do";
		}
		
		
		
	}

	// 로그아웃 기능구현
	@RequestMapping(value = "/auth/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		log.info("Welcome MemberController logout!");

		try {
			session.invalidate();

			return "redirect:/auth/login.do";
		} catch (Exception e) {
			// TODO: handle exception
			return "redirect:/auth/login.do";
		}
		
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

		return "redirect:/auth/login.do";
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
	
	//회원수정
		@RequestMapping(value ="/member/updateCtr.do", method = RequestMethod.POST)
		public String memberUpdateCtr(HttpSession session, MemberDto memberDto, String changeMemberPassword, Model model) {
			
			log.info("Welcome MemberController memberUpdateCtr", memberDto);
			
			try {
				memberService.memberUpdateOne(memberDto, changeMemberPassword);
				
				MemberDto member = (MemberDto)session.getAttribute("member");
				member.setMemberPassword(changeMemberPassword);
				
				session.setAttribute("member", member);
				return "redirect:/member/myPage.do";
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return "redirect:/auth/login.do";
			}
		    
		}
		
		@RequestMapping(value ="/member/updateCtr2.do", method = RequestMethod.POST)
		public String memberUpdateCtr2(int no, MemberDto memberDto, Model model) {
			
			log.info("Welcome MemberController memberUpdateCtr2," + no);
			memberDto.setMemberNumber(no);
			try {
				memberService.memberUpdateOne2(memberDto);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		    return "redirect:/member/list.do";
		}
		
		@RequestMapping(value = "/member/listOne.do", method = RequestMethod.GET)
		public String memberListOne(int no, Model model) {
			log.debug("Welcome MemberController memberListOne! - {}", no);
			
			Map<String, Object> map = memberService.memberSelectOne(no);
			
			MemberDto memberDto = (MemberDto)map.get("memberDto");
			memberDto.setMemberNumber(no);
			System.out.println(memberDto.getMemberNumber());
			model.addAttribute("memberDto", memberDto);
			
			return "member/MemberListOneView";
		}
		
//		멤버 리스트 기능
		@RequestMapping(value = "/member/list.do", 
				method = {RequestMethod.GET, RequestMethod.POST})
		public String memberList(@RequestParam(defaultValue = "1") int curPage, Model model) {

			log.info("Welcome MemberController list! : {}", curPage);
			
			int totalCount = memberService.memberSelectTotalCount();
			
			Paging memberPaging = new Paging(totalCount, curPage);
			
			int start = memberPaging.getPageBegin();
			int end = memberPaging.getPageEnd();
			
			List<MemberDto> memberList = memberService.memberSelectList(start, end);
			
			HashMap<String, Object> pagingmap = new HashMap<>();
			pagingmap.put("totalCount", totalCount);
			pagingmap.put("memberPaging", memberPaging);
			
			System.out.println(totalCount);
			System.out.println(memberPaging);
			
			model.addAttribute("memberList", memberList);
			model.addAttribute("pagingMap", pagingmap);
			
			return "member/MemberListView";
		}
		
		//삭제
		@RequestMapping(value ="/member/delete.do", method = RequestMethod.GET)
		public String memberDelete(int no, Model model) {
			
			log.info("Welcome MemberController memberDelete! SUCCESS!" + no);

			memberService.memberDeleteOne(no);
			
		    return "redirect:/member/list.do";
		}
		
		// 관리자 페이지 이동
		@RequestMapping(value = "/admin/admin.do",
				method = {RequestMethod.GET, RequestMethod.POST})
		public String adminPage(@RequestParam(defaultValue = "1") int curPage, Model model) {

			log.debug("Welcome MemberController admin!");
			
			int totalCount = memberService.memberSelectTotalCount();
			
			Paging memberPaging = new Paging(totalCount, curPage);
			
			int start = memberPaging.getPageBegin();
			int end = memberPaging.getPageEnd();
			
			List<MemberDto> memberList = memberService.memberSelectList(start, end);
			
			HashMap<String, Object> pagingmap = new HashMap<>();
			pagingmap.put("totalCount", totalCount);
			pagingmap.put("memberPaging", memberPaging);
			
			System.out.println(totalCount);
			System.out.println(memberPaging);
			
			model.addAttribute("memberList", memberList);
			model.addAttribute("pagingMap", pagingmap);
			
			return "admin/AdminMemberListView";
		}
		
		// 관리자 회원수정 페이지 이동
		@RequestMapping(value = "/admin/adminMemberListOneView.do", method = RequestMethod.GET)
		public String adminMemberListOne(int no, Model model) {
			log.debug("Welcome MemberController adminMemberListOne! - {}", no);
			
			Map<String, Object> map = memberService.memberSelectOne(no);
			
			MemberDto memberDto = (MemberDto)map.get("memberDto");
			memberDto.setMemberNumber(no);
			System.out.println(memberDto.getMemberNumber());
			model.addAttribute("memberDto", memberDto);
			
			return "admin/AdminMemberListOneView";
		}
		//관리자 회원정보 수정
		@RequestMapping(value ="admin/adminUpdateCtr2.do", method = RequestMethod.POST)
		public String adminUpdateCtr2(int no, MemberDto memberDto, Model model) {
			
			log.info("Welcome MemberController adminMemberUpdateCtr2," + no);
			memberDto.setMemberNumber(no);
			try {
				memberService.memberUpdateOne2(memberDto);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		    return "redirect:/admin/admin.do";
		}
		//관리자 회원정보 삭제
		@RequestMapping(value ="/admin/adminDelete.do", method = RequestMethod.GET)
		public String adminDelete(int no, Model model) {
			
			log.info("Welcome MemberController adminmemberDelete! SUCCESS!" + no);

			memberService.memberDeleteOne(no);
			
		    return "redirect:/admin/admin.do";
		}
}