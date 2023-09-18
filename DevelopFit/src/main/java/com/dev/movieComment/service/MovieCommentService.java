package com.dev.movieComment.service;

import java.util.List;
import java.util.Map;

import com.dev.movieComment.dto.MovieCommentDto;

public interface MovieCommentService {

	public int movieCommentSelectTotalCount();

	List<MovieCommentDto> movieCommentSelectList(int start, int end);

	public Map<String, Object> movieCommentSelectOne(int lineReviewNumber);

	public void movieCommentInsertOne(MovieCommentDto movieCommentDto) throws Exception;

	public int movieCommentUpdateOne(MovieCommentDto movieCommentDto) throws Exception;

	public int movieCommentDeleteOne(int lineReviewNumber);
	
}
