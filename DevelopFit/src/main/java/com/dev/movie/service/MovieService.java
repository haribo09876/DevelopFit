package com.dev.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dev.movie.dto.MovieDto;

public interface MovieService {

	public int movieSelectTotalCount();

	List<MovieDto> movieSelectList(int start, int end);

	public Map<String, Object> movieSelectOne(int movieNumber);

	public void movieInsertOne(MovieDto movieDto, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception;

	public int movieUpdateOne(MovieDto movieDto, MultipartHttpServletRequest multipartHttpServletRequest, int fileIdx) throws Exception;

	public int movieDeleteOne(int movieNumber);
	
}
