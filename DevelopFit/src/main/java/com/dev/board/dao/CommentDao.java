package com.dev.board.dao;

import java.util.List;

import com.dev.board.dto.CommentDto;

public interface CommentDao {
	
	List<CommentDto> commentSelectList(int boardNumber);

	int commentInsertOne(CommentDto commentDto);

	int commentUpdateOne(CommentDto commentDto);

	int commentDeleteOne(CommentDto commentDto);

	int commentSelectTotalCount();

}
