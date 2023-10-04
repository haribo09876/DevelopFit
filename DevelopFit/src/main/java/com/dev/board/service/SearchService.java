package com.dev.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dev.board.dto.BoardDto;

public interface SearchService {

	List<Object> searchMovies(String keyword);
	List<Object> searchBoards(String keyword);
	 
}
