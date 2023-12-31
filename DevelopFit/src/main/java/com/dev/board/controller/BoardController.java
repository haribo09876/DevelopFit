package com.dev.board.controller;

import java.lang.ProcessBuilder.Redirect;
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
import com.dev.board.dto.CommentDto;
import com.dev.board.service.BoardService;
import com.dev.board.service.CommentService;
import com.dev.board.service.SearchService;
import com.dev.member.dto.MemberDto;
import com.dev.util.Paging;

@Controller
public class BoardController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private SearchService searchService;
	
	
	@RequestMapping(value = "/board/list.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardList(@RequestParam(defaultValue = "1") int curPage, Model model
			, HttpSession session) {
	    // Log4j
	    log.info("Welcome BoardController list!: {}", curPage);

	    	int totalCount = boardService.boardSelectTotalCount();
	  	    
	  	    Paging boardPaging = new Paging(totalCount, curPage);
	  	    
	  	    int start = boardPaging.getPageBegin();
	  		int end = boardPaging.getPageEnd();
	  	    
	  	    // 게시글 리스트
	  	    List<BoardDto> boardList = boardService.boardSelectList(start, end);
	  	    
	  	    HashMap<String, Object> pagingMap = new HashMap<>();
	  		pagingMap.put("totalCount", totalCount);
	  		pagingMap.put("boardPaging", boardPaging);
	  		
	  		MemberDto memberDto = (MemberDto)session.getAttribute("member");
	  		
	  		int sessionMemberNumber = memberDto.getMemberNumber();
	  		
	  		// 관리자인 경우 수정 및 삭제 버튼을 표시
	  	    if (sessionMemberNumber == 0) {
	  	        model.addAttribute("canEdit", true);
	  	    } else {
	  	        model.addAttribute("canEdit", false);
	  	    }
	  		
	  		model.addAttribute("boardList", boardList);
	  		model.addAttribute("pagingMap", pagingMap);
	    
	    return "board/BoardListView";
	}
	//게시글 상세 페이지(댓글 포함)
	@RequestMapping(value = "/board/listOne.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardListOne(@RequestParam("boardNumber") int boardNumber, Model model
			,HttpSession session, CommentDto commentDto) {
		log.debug("Welcome BoardController boardListOne! - {}" + boardNumber);
		
		BoardDto boardDto = boardService.boardSelectOne(boardNumber);
		
		boardService.viewCount(boardNumber);
		
		MemberDto memberDto = (MemberDto)session.getAttribute("member");
		
		int sessionMemberNumber = memberDto.getMemberNumber();
		
		
		// 세션의 member넘버와 게시글의 member넘버가 일치하거나 관리자인 경우 수정 및 삭제 버튼을 표시
	    if (sessionMemberNumber == boardDto.getMemberNumber()
	    		|| sessionMemberNumber == 0) {
	        model.addAttribute("canEdit", true);
	    } else {
	        model.addAttribute("canEdit", false);
	    }
		
		model.addAttribute("boardDto", boardDto);
		
	    // 댓글 리스트를 가져옵니다.
	    List<CommentDto> commentList = commentService.commentSelectList(boardNumber);
	    
	    model.addAttribute("commentList", commentList);
	    
		return "board/BoardListOneView";
		
	}
	
	//게시글 수정 화면으로
	@RequestMapping(value = "/board/update.do", method = RequestMethod.POST)
	public String boardUpdate(int boardNumber, Model model) {
		log.info("Welcome boardUpdate!" + boardNumber);
		
		BoardDto boardDto = boardService.boardSelectOne(boardNumber);
		
		model.addAttribute("boardDto", boardDto);
		
		return "board/UpdateForm";
	}
	
//	게시글 수정
	@RequestMapping(value = "/board/updateCtr.do", method = RequestMethod.POST)
	public String boardUpdateCtr(BoardDto boardDto, Model model) {
		log.info("Welcome BoardController boardUpdateCtr! boardDto: {}", boardDto);
		
		int resultNum = 0;
		
		resultNum = boardService.boardUpdateOne(boardDto);
		
		return "common/BoardsuccessPage";
	}
	
	//게시글 추가 페이지로 이동
	@RequestMapping(value = "/board/add.do", method = RequestMethod.POST)
	public String boardAdd(Model model) {
		
		log.debug("Welcome BoardController boardAdd!");
		
		return "board/AddForm";
	}
	
//	게시글 추가
	@RequestMapping(value = "/board/addCtr.do", method = RequestMethod.POST)
	public String boardAdd(BoardDto boardDto, Model model) {
		log.debug("Welcome BoardController boardAdd! " + boardDto);
		
			boardService.boardInsertOne(boardDto);
			return "redirect:/board/list.do";
	}
	
//	
//	게시글 삭제
	@RequestMapping(value = "/board/delete.do", method = RequestMethod.POST)
	public String boardDeleteCtr(BoardDto boardDto, Model model) {
		log.debug("Welcome BoardController boardDelete" + boardDto);
		
		boardService.boardDeleteOne(boardDto);
					
		return "redirect:/board/list.do";
	}
	
	//게시글검색
	  @RequestMapping(value = "/board/searchBoardsCtr.do", method = {RequestMethod.GET, RequestMethod.POST})
	  	public String searchBoards(@RequestParam("keyword") String keyword, Model model) {
		  log.debug("Welcome searchBoards! - {}" + keyword);
		  List<Object> searchBoardsResults = searchService.searchBoards(keyword);

	      model.addAttribute("searchBoardsResults", searchBoardsResults);

	      return "/SearchListView";
	    }
	  
	//영화검색
	  @RequestMapping(value = "/board/searchMoviesCtr.do", 
			  method = {RequestMethod.GET, RequestMethod.POST})
	  	public String searchMovies(@RequestParam("keyword") String keyword, Model model) {
		  log.debug("Welcome searchMovies! - {}" + keyword);
		  List<Object> searchMoviesResults = searchService.searchMovies(keyword);

	      model.addAttribute("searchMoviesResults", searchMoviesResults);

	      return "/SearchListView";
	    }
	
	//전체검색
	  @RequestMapping(value = "/board/searchAllCtr.do", method = {RequestMethod.GET, RequestMethod.POST})
	  	public String searchAll(@RequestParam("keyword") String keyword, Model model) {
		  log.debug("Welcome searchAll! - {}" + keyword);
		  List<Object> searchBoardsResults = searchService.searchBoards(keyword);

	      model.addAttribute("searchBoardsResults", searchBoardsResults);
	      
	      List<Object> searchMoviesResults = searchService.searchMovies(keyword);

	      model.addAttribute("searchMoviesResults", searchMoviesResults);
	      
	      return "/SearchListView";
	    }
	  
	//내 게시물
	  @RequestMapping(value = "/board/myList.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String boardMyList(@RequestParam(defaultValue = "1") int curPage, Model model
				, HttpSession session) {
		    // Log4j
		    log.info("Welcome BoardController mylist!: {}", curPage);

		    MemberDto memberDto = (MemberDto)session.getAttribute("member");
			
			int memberNumber = memberDto.getMemberNumber();
		    
		    int totalCount = boardService.boardSelectMyTotalCount(memberNumber);
		    
		    Paging boardPaging = new Paging(totalCount, curPage);
		    
		    int start = boardPaging.getPageBegin();
			int end = boardPaging.getPageEnd();
		    
		    // 게시글 리스트
		    List<BoardDto> boardList = boardService.boardSelectMyList(start, end, memberNumber);
		    
		    HashMap<String, Object> pagingMap = new HashMap<>();
			pagingMap.put("totalCount", totalCount);
			pagingMap.put("boardPaging", boardPaging);
			
			model.addAttribute("boardList", boardList);
			model.addAttribute("pagingMap", pagingMap);

		    return "board/MyBoardListView";
	  }
	  
	  @RequestMapping(value = "/board/adminList.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String boardAdminList(@RequestParam(defaultValue = "1") int curPage, Model model
				, HttpSession session) {
		    // Log4j
		    log.info("Welcome BoardController list!: {}", curPage);

		    int totalCount = boardService.boardSelectTotalCount();
		    
		    Paging boardPaging = new Paging(totalCount, curPage);
		    
		    int start = boardPaging.getPageBegin();
			int end = boardPaging.getPageEnd();
		    
		    // 게시글 리스트
		    List<BoardDto> boardList = boardService.boardSelectList(start, end);
		    
		    HashMap<String, Object> pagingMap = new HashMap<>();
			pagingMap.put("totalCount", totalCount);
			pagingMap.put("boardPaging", boardPaging);
			
			MemberDto memberDto = (MemberDto)session.getAttribute("member");
			
			int sessionMemberNumber = memberDto.getMemberNumber();
			
			// 관리자인 경우 수정 및 삭제 버튼을 표시
		    if (sessionMemberNumber == 0) {
		        model.addAttribute("canEdit", true);
		    } else {
		        model.addAttribute("canEdit", false);
		    }
			
			model.addAttribute("boardList", boardList);
			model.addAttribute("pagingMap", pagingMap);

		    return "board/BoardListAdminView";
		}
	  
}