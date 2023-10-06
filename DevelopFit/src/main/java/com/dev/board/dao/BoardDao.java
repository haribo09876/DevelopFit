package com.dev.board.dao;

import java.util.List;

import com.dev.board.dto.BoardDto;

public interface BoardDao {

	List<BoardDto> boardSelectList(int start, int end);

	int boardInsertOne(BoardDto boardDto);

	BoardDto boardSelectOne(int boardNumber);

	int boardUpdateOne(BoardDto boardDto);

	int boardDeleteOne(BoardDto boardDto);

	int boardSelectTotalCount();
	
	int viewCount(int no);
	
	List<BoardDto> searchBoards(String keyword);
	
	List<BoardDto> boardSelectMyList(int start, int end, int memberNumber);

	int boardSelectMyTotalCount(int memberNumber);
}
