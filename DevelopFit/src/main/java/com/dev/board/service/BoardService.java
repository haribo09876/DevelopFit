package com.dev.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dev.board.dto.BoardDto;

public interface BoardService {
	
	List<BoardDto> boardSelectList(int start, int end);

	void boardInsertOne(BoardDto boardDto);

	Map<String, Object> boardSelectOne(int no);

	int boardUpdateOne(BoardDto boardDto);

	int boardDeleteOne(BoardDto boardDto);

	int boardSelectTotalCount();

	int viewCount(int no);
}
