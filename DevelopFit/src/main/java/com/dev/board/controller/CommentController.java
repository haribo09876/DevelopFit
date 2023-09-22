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
import com.dev.board.dto.CommentDto;
import com.dev.board.service.BoardService;
import com.dev.board.service.CommentService;
import com.dev.util.Paging;

@Controller
public class CommentController {
	
	private static final Logger log = LoggerFactory.getLogger(CommentController.class);
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CommentService commentService;
	
	
//	댓글 수정
	@RequestMapping(value = "/board/commentUpdateCtr.do", method = RequestMethod.POST)
	public String commentUpdateCtr(CommentDto commentDto, Model model) {
		log.info("Welcome CommentController CommentUpdateCtr! CommentDto: {}", 
				commentDto);
		
		int resultNum = 0;
		
		resultNum = commentService.commentUpdateOne(commentDto);
		
		return "common/CommentsuccessPage";
	}
	
//	댓글 추가
	@RequestMapping(value = "/board/commentAddCtr.do", method = RequestMethod.POST)
	public String commentAddCtr(CommentDto commentDto, Model model) {
		log.debug("Welcome CommentController CommentAddCtr! " + commentDto);

		commentService.commentInsertOne(commentDto);
		
		int boardNumber = commentDto.getBoardNumber();
		
		return "redirect:/board/listOne.do?boardNumber=" + boardNumber;
	}
	
//	
//	댓글 삭제
	@RequestMapping(value = "/board/commentDeleteCtr.do", method = RequestMethod.POST)
	public String commentDeleteCtr(CommentDto commentDto, Model model, 
			BoardDto boardDto) {
		log.debug("Welcome CommentController CommentDelete" + commentDto);
		
		commentService.commentDeleteOne(commentDto);
		
		int boardNumber = commentDto.getBoardNumber();
		
		return "forward:/board/listOne.do?boardNumber=" + boardNumber;
	}
	//CommentDeleteCommentDto [boardNumber=0, memberId=null, memberNumber=0, commentNumber=113,
//	commentContent=null, commentCreateDate=null] jsp에서 코맨트 넘버만 오고 보드넘버 안오는 듯
	//멤버도 제대로 오는지 ss계정으로 해보자
}