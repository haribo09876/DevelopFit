package com.dev.movie.dao;

import java.util.List;
import java.util.Map;

import com.dev.movie.dto.MovieDto;

public interface MovieDao {
	
	public int movieInsertOne(MovieDto movieDto);
	List<MovieDto> movieSelectList(int start, int end);
	public MovieDto movieSelectOne(int movieNumber);
	public int movieUpdateOne(MovieDto movieDto);
	public int movieDeleteOne(int movieNumber);
	public int movieSelectTotalCount();

	public int movieCommentInsertOne(MovieDto movieDto);
	List<MovieDto> movieCommentSelectList(int start, int end);
	List<MovieDto> movieCommentSelectList(int start, int end, int movieNumber);
	public MovieDto movieCommentSelectOne(int lineReviewNumber);
	public int movieCommentUpdateOne(MovieDto movieDto);
	public int movieCommentDeleteOne(int lineReviewNumber);
	public int movieCommentSelectTotalCount();
	public List<MovieDto> searchMovies(String keyword);
	
	public List<MovieDto> castActorList(int movieNumber);
}