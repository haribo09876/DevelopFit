package com.dev.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dev.board.dto.BoardDto;

public interface BoardService {
	
	List<BoardDto> boardSelectList(int start, int end);

	void boardInsertOne(BoardDto boardDto, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception;

	Map<String, Object> boardSelectOne(int no);

	int memberUpdateOne(BoardDto boardDto, MultipartHttpServletRequest multipartHttpServletRequest, int fileIdx)
			throws Exception;

	int boardDeleteOne(int no);

	int boardSelectTotalCount();
	
}
