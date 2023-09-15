package com.dev.board.dao;

import java.util.List;

import com.dev.board.dto.BoardDto;

public interface BoardDao {

	List<BoardDto> boardSelectList(int start, int end);

	int boardInsertOne(BoardDto boardDto);

	BoardDto boardSelectOne(int no);

	int boardUpdateOne(BoardDto boardDto);

	int boardDeleteOne(BoardDto boardDto);

	int boardSelectTotalCount();
	
	int viewCount(int no);

}
