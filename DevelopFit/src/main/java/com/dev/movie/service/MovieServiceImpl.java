package com.dev.movie.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.dev.movie.dao.MovieDao;
import com.dev.movie.dto.MovieDto;

@Service
public class MovieServiceImpl implements MovieService{
	
	private static final Logger log = LoggerFactory.getLogger(MovieServiceImpl.class);

	@Autowired
	public MovieDao movieDao;
	
	@Override
	public int movieSelectTotalCount() {
		// TODO Auto-generated method stub
		return movieDao.movieSelectTotalCount();
	}

	@Override
	public List<MovieDto> movieSelectList(int start, int end) {
		// TODO Auto-generated method stub
		return movieDao.movieSelectList(start, end);
	}

	@Override
	public Map<String, Object> movieSelectOne(int movieNumber) {
		// TODO Auto-generated method stub
				
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		MovieDto movieDto = movieDao.movieSelectOne(movieNumber);
		resultMap.put("movieDto", movieDto);
		
		return resultMap;
	}
	
	@Override
	public void movieInsertOne(MovieDto movieDto) throws Exception {
		// TODO Auto-generated method stub
		movieDao.movieInsertOne(movieDto);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int movieUpdateOne(MovieDto movieDto) throws Exception {
		// TODO Auto-generated method stub
		int resultNum = 0;
		
		try {
			resultNum = movieDao.movieUpdateOne(movieDto);
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return resultNum;
	}
	
	@Override
	public int movieDeleteOne(int movieNumber) {
		// TODO Auto-generated method stub
		return movieDao.movieDeleteOne(movieNumber);
	}

	
	@Override
	public int movieCommentSelectTotalCount() {
		// TODO Auto-generated method stub
		return movieDao.movieCommentSelectTotalCount();
	}

	@Override
	public List<MovieDto> movieCommentSelectList(int start, int end) {
		// TODO Auto-generated method stub
		return movieDao.movieCommentSelectList(start, end);
	}

	@Override
	public Map<String, Object> movieCommentSelectOne(int movieNumber) {
		// TODO Auto-generated method stub
				
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		MovieDto movieDto = movieDao.movieSelectOne(movieNumber);
		resultMap.put("movieDto", movieDto);
		
		return resultMap;
	}
	
	@Override
	public void movieCommentInsertOne(MovieDto movieDto) throws Exception {
		// TODO Auto-generated method stub
		movieDao.movieCommentInsertOne(movieDto);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int movieCommentUpdateOne(MovieDto movieDto) throws Exception {
		// TODO Auto-generated method stub
		int resultNum = 0;
		
		try {
			resultNum = movieDao.movieCommentUpdateOne(movieDto);
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return resultNum;
	}
	
	@Override
	public int movieCommentDeleteOne(int movieNumber) {
		// TODO Auto-generated method stub
		return movieDao.movieCommentDeleteOne(movieNumber);
	}
	
	
	
}