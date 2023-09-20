package com.dev.board.dao;

import java.util.List;

import com.dev.board.dto.BoardDto;

public interface BoardDao {

	List<BoardDto> boardSelectList(int start, int end);

	int boardInsertOne(BoardDto boardDto);

	BoardDto boardSelectOne(BoardDto boardDto);

	int boardUpdateOne(BoardDto boardDto);

	int boardDeleteOne(BoardDto boardDto);

	int boardSelectTotalCount();
	
	int viewCount(int no);
	
	List<BoardDto> boardCommentSelectList(int start, int end, BoardDto boardDto, int boardNumber);

	int boardCommentInsertOne(BoardDto boardDto);

	int boardCommentUpdateOne(BoardDto boardDto);

	int boardCommentDeleteOne(BoardDto boardDto);

	int boardCommentSelectTotalCount();

}
