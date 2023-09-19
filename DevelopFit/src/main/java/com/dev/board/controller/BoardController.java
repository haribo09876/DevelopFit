package com.dev.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dev.board.dto.BoardDto;
import com.dev.board.service.BoardService;
import com.dev.util.Paging;

@Controller
public class BoardController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/board/list.do",
			method = {RequestMethod.GET, RequestMethod.POST})
	public String boardList(@RequestParam(defaultValue = "1") int curPage, Model model) {
	    // Log4j
	    log.info("Welcome BoardController list!: {}", curPage);

	    int totalCount = boardService.boardSelectTotalCount();
	    
	    Paging boardPaging = new Paging(totalCount, curPage);
	    
	    int start = boardPaging.getPageBegin();
		int end = boardPaging.getPageEnd();
	    
	    // 게시글 리스트를 가져옵니다.
	    List<BoardDto> boardList = boardService.boardSelectList(start, end);
	    
	    HashMap<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("boardPaging", boardPaging);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pagingMap", pagingMap);

	    return "board/BoardListView";
	}
	//게시글 상세 페이지(댓글 포함)
	@RequestMapping(value = "/board/listOne.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardListOne(BoardDto boardDto, 
			@RequestParam(defaultValue = "1") int curPage, Model model, int boardNumber) {
		log.debug("Welcome BoardController boardListOne! - {}" + boardDto.getBoardNumber()
		+ boardNumber);
		
		boardDto.getBoardNumber();
		
		boardService.viewCount(boardNumber);
		
		Map<String, Object> map = boardService.boardSelectOne(boardDto);
		
		map.get("boardDto");
		
		model.addAttribute("boardDto", boardDto);
		
		int totalCount = boardService.boardCommentSelectTotalCount();
	    
	    Paging boardCommentPaging = new Paging(totalCount, curPage);
	    int start = boardCommentPaging.getPageBegin();
		int end = boardCommentPaging.getPageEnd();
	    
	    // 댓글 리스트를 가져옵니다.
	    List<BoardDto> boardCommentList = boardService.boardCommentSelectList(start, end,
	    		boardDto, boardNumber);
	    
	    HashMap<String, Object> commentPagingMap = new HashMap<>();
	    commentPagingMap.put("totalCount", totalCount);
	    commentPagingMap.put("boardCommentPaging", boardCommentPaging);
		
		model.addAttribute("boardCommentList", boardCommentList);
		model.addAttribute("commentPagingMap", commentPagingMap);

		return "board/BoardListOneView";
		
	}
	
	//게시글 수정 화면으로
	@RequestMapping(value = "/board/update.do", method = RequestMethod.POST)
	public String boardUpdate(BoardDto boardDto, Model model) {
		log.info("Welcome boardUpdate!" + boardDto);
		
		Map<String, Object> map = boardService.boardSelectOne(boardDto);
	
		map.get("boardDto");
		
		model.addAttribute("boardDto", boardDto);
		
		return "board/UpdateForm";
	}
	
//	게시글 수정
	@RequestMapping(value = "/board/updateCtr.do", method = RequestMethod.POST)
	public String boardUpdateCtr(BoardDto boardDto, Model model) {
		log.info("Welcome MemberController memberUpdateCtr! memberDto: {}", boardDto);
		
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
	
	
//	댓글 수정
	@RequestMapping(value = "/board/commentUpdateCtr.do", method = RequestMethod.POST)
	public String boardCommentUpdateCtr(BoardDto boardDto, Model model) {
		log.info("Welcome BoardCommentController CommentUpdateCtr! boardCommentDto: {}", 
				boardDto);
		
		int resultNum = 0;
		
		resultNum = boardService.boardCommentUpdateOne(boardDto);
		
		return "common/BoardsuccessPage";
	}
	
//	댓글 추가
	@RequestMapping(value = "/board/commentAddCtr.do", method = RequestMethod.POST)
	public String boardCommentAddCtr(BoardDto boardDto, Model model) {
		log.debug("Welcome BoardCommentController boardCommentAddCtr! " + boardDto);

			boardService.boardCommentInsertOne(boardDto);
		return "redirect:/board/listOne.do";
	}
	
//	
//	댓글 삭제
	@RequestMapping(value = "/board/commentDelete.do", method = RequestMethod.POST)
	public String boardCommentDeleteCtr(BoardDto boardDto, Model model) {
		log.debug("Welcome BoardCommentController boardCommentDelete" + boardDto);
		
		boardService.boardCommentDeleteOne(boardDto);
					
		return "redirect:/board/listOne.do";
	}
	
}