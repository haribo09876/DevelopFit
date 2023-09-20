package com.dev.board.service;

import java.util.List;
import java.util.Map;


import com.dev.board.dto.CommentDto;

public interface CommentService {
	
	List<CommentDto> commentSelectList(int boardNumber);
	
	void commentInsertOne(CommentDto commentDto);

	int commentUpdateOne(CommentDto commentDto);

	int commentDeleteOne(CommentDto commentDto);

	int commentSelectTotalCount();

	

	
}
