package com.dev.movie.service;

import java.util.List;
import java.util.Map;

import com.dev.movie.dto.MovieDto;

public interface MovieService {

	public void movieInsertOne(MovieDto movieDto) throws Exception;
	List<MovieDto> movieSelectList(int start, int end);
	public Map<String, Object> movieSelectOne(int movieNumber);
	public int movieUpdateOne(MovieDto movieDto) throws Exception;
	public int movieDeleteOne(int movieNumber);
	public int movieSelectTotalCount();
	
	public void movieCommentInsertOne(MovieDto movieDto) throws Exception;
	List<MovieDto> movieCommentSelectList(int start, int end);
	public Map<String, Object> movieCommentSelectOne(int lineReviewNumber);
	public int movieCommentUpdateOne(MovieDto movieDto) throws Exception;
	public int movieCommentDeleteOne(int lineReviewNumber);
	public int movieCommentSelectTotalCount();
}
