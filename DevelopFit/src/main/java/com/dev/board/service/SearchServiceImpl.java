package com.dev.board.service;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;

import com.dev.board.dao.BoardDao;
import com.dev.board.dto.BoardDto;
import com.dev.movie.dao.MovieDao;
import com.dev.movie.dto.MovieDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;


@Service
public class SearchServiceImpl implements SearchService{

	private static final Logger log = LoggerFactory.getLogger(SearchServiceImpl.class);
	
	@Autowired
    private MovieDao movieDao;

	@Autowired
	private BoardDao boardDao;
	
	
	public List<Object> searchMovies(String keyword) {
        List<Object> searchMoviesResults = new ArrayList<>();
        
        // 무비 다오의 메서드를 호출하여 무비 데이터 검색
        List<MovieDto> movieResults = movieDao.searchMovies(keyword);
        searchMoviesResults.addAll(movieResults);

        return searchMoviesResults;
    }
	
	public List<Object> searchBoards(String keyword) {
        List<Object> searchBoardsResults = new ArrayList<>();
        
        // 보드 다오의 메서드를 호출하여 보드 데이터 검색
        List<BoardDto> boardResults = boardDao.searchBoards(keyword);
        searchBoardsResults.addAll(boardResults);
        
        return searchBoardsResults;
    }
        
        
	
}
