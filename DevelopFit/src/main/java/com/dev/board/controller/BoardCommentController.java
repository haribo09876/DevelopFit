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
import com.dev.board.dto.BoardCommentDto;
import com.dev.board.service.BoardCommentService;
import com.dev.util.Paging;

@Controller
public class BoardCommentController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardCommentController.class);
	
	@Autowired
	private BoardCommentService boardCommentService;
	
	@RequestMapping(value = "/board/commentList.do",
			method = {RequestMethod.GET, RequestMethod.POST})
	public String boardCommentList(@RequestParam(defaultValue = "1") int curPage, Model model) {
	    // Log4j
	    log.info("Welcome BoardCommentController list!: {}", curPage);

	    int totalCount = boardCommentService.boardCommentSelectTotalCount();
	    
	    Paging boardCommentPaging = new Paging(totalCount, curPage);
	    
	    int start = boardCommentPaging.getPageBegin();
		int end = boardCommentPaging.getPageEnd();
	    
	    // 댓글 리스트를 가져옵니다.
	    List<BoardCommentDto> boardCommentList = boardCommentService.boardCommentSelectList(start, end);
	    
	    HashMap<String, Object> commentPagingMap = new HashMap<>();
	    commentPagingMap.put("totalCount", totalCount);
	    commentPagingMap.put("boardCommentPaging", boardCommentPaging);
		
		model.addAttribute("boardCommentList", boardCommentList);
		model.addAttribute("commentPagingMap", commentPagingMap);

	    return "board/BoardListOneView";
	}
	
//	//게시글 수정 화면으로
//	@RequestMapping(value = "/board/update.do", method = RequestMethod.POST)
//	public String boardUpdate(int boardNumber, Model model) {
//		log.info("Welcome boardUpdate!" + boardNumber);
//		
//		Map<String, Object> map = boardService.boardSelectOne(boardNumber);
//	
//		BoardDto boardDto = (BoardDto)map.get("boardDto");
//		
//		model.addAttribute("boardDto", boardDto);
//		
//		return "board/UpdateForm";
//	}
	
//	댓글 수정
	@RequestMapping(value = "/board/commentUpdateCtr.do", method = RequestMethod.POST)
	public String boardUpdateCtr(BoardCommentDto boardCommentDto, Model model) {
		log.info("Welcome BoardCommentController CommentUpdateCtr! boardCommentDto: {}", 
				boardCommentDto);
		
		int resultNum = 0;
		
		resultNum = boardCommentService.boardCommentUpdateOne(boardCommentDto);
		
		return "common/BoardsuccessPage";
	}
	
//	댓글 추가
	@RequestMapping(value = "/board/commentAddCtr.do", method = RequestMethod.POST)
	public String boardAdd(BoardCommentDto boardCommentDto, Model model) {
		log.debug("Welcome BoardCommentController boardCommentAdd! " + boardCommentDto);

			boardCommentService.boardCommentInsertOne(boardCommentDto);
		return "redirect:/board/listOne.do";
	}
	
//	
//	게시글 삭제
	@RequestMapping(value = "/board/commentDelete.do", method = RequestMethod.POST)
	public String boardCommentDeleteCtr(BoardCommentDto boardCommentDto, Model model) {
		log.debug("Welcome BoardCommentController boardCommentDelete" + boardCommentDto);
		
		boardCommentService.boardCommentDeleteOne(boardCommentDto);
					
		return "redirect:/board/listOne.do";
	}

}