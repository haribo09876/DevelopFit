package com.dev.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dev.board.dto.BoardDto;

public interface BoardService {
	
	List<BoardDto> boardSelectList(int start, int end);

	void boardInsertOne(BoardDto boardDto);

	Map<String, Object> boardSelectOne(BoardDto boardDto);

	int boardUpdateOne(BoardDto boardDto);

	int boardDeleteOne(BoardDto boardDto);

	int boardSelectTotalCount();

	int viewCount(int no);
	
	List<BoardDto> boardCommentSelectList(int start, int end, BoardDto boardDto, int boardNumber);
	
	void boardCommentInsertOne(BoardDto boardDto);

	int boardCommentUpdateOne(BoardDto boardDto);

	int boardCommentDeleteOne(BoardDto boardDto);

	int boardCommentSelectTotalCount();

	

	
}
