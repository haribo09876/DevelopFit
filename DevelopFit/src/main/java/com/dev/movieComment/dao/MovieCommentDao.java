package com.dev.movieComment.dao;

import java.util.List;

import com.dev.movieComment.dto.MovieCommentDto;

public interface MovieCommentDao {
	
	List<MovieCommentDto> movieCommentSelectList(int start, int end);

	public int movieCommentInsertOne(MovieCommentDto movieCommentDto);
	public MovieCommentDto movieCommentSelectOne(int lineReviewNumber);
	public int movieCommentUpdateOne(MovieCommentDto movieCommentDto);
	public int movieCommentDeleteOne(int lineReviewNumber);
	
	public int movieCommentSelectTotalCount();
}
