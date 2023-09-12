package com.dev.board.controller;

import java.util.HashMap;
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

import com.dev.board.dto.BoardDto;
import com.dev.board.service.BoardService;


@Controller
public class BoardController<Paging> {
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
//	//로그인 세션 정보 모델에 담아 게시판으로 반환
//	@RequestMapping(value = "/board/community.do", method = RequestMethod.GET)
//	public String login(HttpSession session, Model model) {
//		log.info("Welcome boardController Community!");
//		
//		return "board/CommunityForm";
//		
//	}
	
	//게시판 정보(게시번호, 제목, 내용, 글쓴이, 조회수) 담아서 게시판으로 반환
//	@RequestMapping(value = "/board/community.do", method = {RequestMethod.GET, RequestMethod.POST})
//	public String boardList(@RequestParam(defaultValue = "1") int curPage, Model model) {
//	    // Log4j
//	    log.info("Welcome MemberController list!: {}", curPage);
//
//	    int totalCount = boardService.boardSelectTotalCount();
//
//	    Paging boardPaging = new Paging(totalCount, curPage); // 변수 이름 수정
//
//	    int start = boardPaging.getPageBegin(); // 변수 이름 수정
//	    int end = boardPaging.getPageEnd(); // 변수 이름 수정
//
//	    List<BoardDto> boardList = boardService.boardSelectList(start, end);
//
//	    HashMap<String, Object> pagingMap = new HashMap<>();
//	    pagingMap.put("totalCount", totalCount);
//	    pagingMap.put("boardPaging", boardPaging); // 변수 이름 수정
//
//	    model.addAttribute("boardList", boardList);
//	    model.addAttribute("pagingMap", pagingMap);
//
//	    return "board/CommunityForm";
//	}
//	
//	
//	//게시글 추가 페이지로 이동
//	@RequestMapping(value = "/board/add.do", method = RequestMethod.GET)
//	public String boardAdd(Model model) {
//		
//		log.debug("Welcome BoardController boardAdd!");
//		
//		return "board/BoardForm";
//	}
	@RequestMapping(value = "/board/community.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardList(Model model) {
	    // Log4j
	    log.info("Welcome MemberController list!");

	    // 게시글 리스트를 가져옵니다.
	    List<BoardDto> boardList = boardService.boardSelectList(1, 1);

	    model.addAttribute("boardList", boardList);

	    return "board/CommunityForm";
	}
//
////	로그인 버튼 클릭시
//	@RequestMapping(value = "/auth/loginCtr.do", method = RequestMethod.POST)
//	public String loginCtr(String email, String password, HttpSession session, Model model) {
//		log.info("Welcome MemberController loginCtr!" + email + ", " + password);
//
//		MemberDto memberDto = memberService.memberExist(email, password);
//
//		String viewUrl = "";
//		if (memberDto != null) {
//			session.setAttribute("member", memberDto);
//
//			viewUrl = "redirect:/member/list.do";
//		} else {
//			viewUrl = "auth/LoginFail";
//		}
//		return viewUrl;
//	}
//
////	로그아웃
//	@RequestMapping(value = "/auth/logout.do", method = RequestMethod.GET)
//	public String logout(HttpSession session, Model model) {
//		log.info("Welcome MemberController logout");
//
//		session.invalidate();
//
//		return "redirect:/auth/login.do";
//	}
//
//	
//	@RequestMapping(value = "/member/listOne.do", method = RequestMethod.GET)
//	public String memberListOne(int no, Model model) {
//		log.debug("Welcome MemberController memberListOne! - {}", no);
//
//		Map<String, Object> map = memberService.memberSelectOne(no);
//		
//		MemberDto memberDto = (MemberDto)map.get("memberDto");
//		List<Map<String, Object>> fileList
//			= (List<Map<String, Object>>)map.get("fileList");
//		
//		model.addAttribute("memberDto", memberDto);
//		model.addAttribute("fileList", fileList);
//		
//		return "member/MemberListOneView";
//	}
//	
//	
//	멤버 리스트 페이징
//	@RequestMapping(value = "/board/community.do", method = {RequestMethod.GET, RequestMethod.POST})
//	public String boardList(@RequestParam(defaultValue = "1") int curPage, Model model) {
//	    // Log4j
//	    log.info("Welcome MemberController list!: {}", curPage);
//
//	    int totalCount = boardService.boardSelectTotalCount();
//
//	    Paging boardPaging = new Paging(totalCount, curPage); // 변수 이름 수정
//
//	    int start = boardPaging.getPageBegin(); // 변수 이름 수정
//	    int end = boardPaging.getPageEnd(); // 변수 이름 수정
//
//	    List<BoardDto> boardList = boardService.boardSelectList(start, end);
//
//	    HashMap<String, Object> pagingMap = new HashMap<>();
//	    pagingMap.put("totalCount", totalCount);
//	    pagingMap.put("boardPaging", boardPaging); // 변수 이름 수정
//
//	    model.addAttribute("boardList", boardList);
//	    model.addAttribute("pagingMap", pagingMap);
//
//	    return "board/CommunityForm";
//	}
//
	
	
////	일반 .do는 단순 페이지 이동
//	@RequestMapping(value = "/member/add.do", method = RequestMethod.GET)
//	public String memberAdd(Model model) {
//		log.debug("Welcome MemberController memberAdd!");
//
//		return "member/MemberForm";
//	}
//
//	@RequestMapping(value = "/member/addCtr.do", method = RequestMethod.POST)
//	public String memberAdd(MemberDto memberDto, MultipartHttpServletRequest mulRequest
//			, Model model) {
//		log.debug("Welcome MemberController memberAdd! " + memberDto);
//
//		try {
//			memberService.memberInsertOne(memberDto, mulRequest);
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.out.println("오류 처리할 거 있으면 한다");
//			e.printStackTrace();
//		}
//		return "redirect:/member/list.do";
//	}
//
////	회원수정 화면으로
//	@RequestMapping(value = "/member/update.do", method = RequestMethod.GET)
//	public String memberUpdate(int no, Model model) {
//		log.info("Welcome memberUpdate!" + no);
//		
//		Map<String, Object> map = memberService.memberSelectOne(no);
//
//		MemberDto memberDto = (MemberDto)map.get("memberDto");
//		
//		List<Map<String, Object>> fileList
//			= (List<Map<String, Object>>)map.get("fileList");
//		
//		model.addAttribute("memberDto", memberDto);
//		model.addAttribute("fileList", fileList);
//		
//		return "member/MemberUpdateForm";
//	}
//	
////	회원수정
//	@RequestMapping(value = "/member/updateCtr.do", method = RequestMethod.POST)
//	public String memberUpdateCtr(MemberDto memberDto
//		, @RequestParam(value = "fileIdx", defaultValue = "-1") int fileIdx
//		, MultipartHttpServletRequest mulRequest
//		, Model model) {
//		log.info("Welcome MemberController memberUpdateCtr! memberDto: {}\n fileIdx: {}"
//		, memberDto, fileIdx);
//		
//		int resultNum = 0;
//		
//		try {
//			resultNum = memberService.memberUpdateOne(memberDto, mulRequest, fileIdx);
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		
//		return "common/successPage";
//	}
//
//	
////	회원삭제
//	@RequestMapping(value = "/member/delete.do", method = RequestMethod.GET)
//	public String memberDeleteCtr(int no, Model model) {
//		log.debug("Welcome MemberController memberDelete" + no);
//		
//		memberService.memberDeleteOne(no);
//					
//		return "redirect:/member/list.do";
//	}

}