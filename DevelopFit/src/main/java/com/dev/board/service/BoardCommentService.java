package com.dev.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dev.board.dto.BoardCommentDto;
import com.dev.board.dto.BoardDto;

public interface BoardCommentService {
	
	List<BoardCommentDto> boardCommentSelectList(int start, int end);

	void boardCommentInsertOne(BoardCommentDto boardCommentDto);

	int boardCommentUpdateOne(BoardCommentDto boardCommentDto);

	int boardCommentDeleteOne(BoardCommentDto boardCommentDto);

	int boardCommentSelectTotalCount();

}
