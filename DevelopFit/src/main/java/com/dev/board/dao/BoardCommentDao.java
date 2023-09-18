package com.dev.board.dao;

import java.util.List;

import com.dev.board.dto.BoardCommentDto;

public interface BoardCommentDao {
	
	List<BoardCommentDto> boardCommentSelectList(int start, int end);

	int boardCommentInsertOne(BoardCommentDto boardCommentDto);

	int boardCommentUpdateOne(BoardCommentDto boardCommentDto);

	int boardCommentDeleteOne(BoardCommentDto boardCommentDto);

	int boardCommentSelectTotalCount();
	

}
