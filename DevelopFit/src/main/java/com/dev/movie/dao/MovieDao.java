package com.dev.movie.dao;

import java.util.List;
import java.util.Map;

import com.dev.movie.dto.MovieDto;

public interface MovieDao {
	
	List<MovieDto> movieSelectList(int start, int end);

	public int movieInsertOne(MovieDto movieDto);
	public MovieDto movieSelectOne(int movieNumber);
	public int movieUpdateOne(MovieDto movieDto);
	public int movieDeleteOne(int movieNumber);
	
	public int movieSelectTotalCount();
}
