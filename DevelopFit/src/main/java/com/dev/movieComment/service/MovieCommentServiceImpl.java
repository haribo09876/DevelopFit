package com.dev.movieComment.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.dev.movieComment.dao.MovieCommentDao;
import com.dev.movieComment.dto.MovieCommentDto;
import com.dev.util.FileUtils;

@Service
public class MovieCommentServiceImpl implements MovieCommentService{
	
	private static final Logger log = LoggerFactory.getLogger(MovieCommentServiceImpl.class);

	@Autowired
	public MovieCommentDao movieCommentDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public int movieCommentSelectTotalCount() {
		// TODO Auto-generated method stub
		return movieCommentDao.movieCommentSelectTotalCount();
	}

	@Override
	public List<MovieCommentDto> movieCommentSelectList(int start, int end) {
		// TODO Auto-generated method stub
		return movieCommentDao.movieCommentSelectList(start, end);
	}

	@Override
	public Map<String, Object> movieCommentSelectOne(int lineReviewNumber) {
		// TODO Auto-generated method stub
				
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		MovieCommentDto movieCommentDto = movieCommentDao.movieCommentSelectOne(lineReviewNumber);
		resultMap.put("movieCommentDto", movieCommentDto);
		
		return resultMap;
	}
	
	@Override
	public void movieCommentInsertOne(MovieCommentDto movieCommentDto) throws Exception {
		// TODO Auto-generated method stub
		movieCommentDao.movieCommentInsertOne(movieCommentDto);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int movieCommentUpdateOne(MovieCommentDto movieCommentDto) throws Exception {
		// TODO Auto-generated method stub
		int resultNum = 0;
		
		try {
			resultNum = movieCommentDao.movieCommentUpdateOne(movieCommentDto);
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return resultNum;
	}
	
	@Override
	public int movieCommentDeleteOne(int lineReviewNumber) {
		// TODO Auto-generated method stub
		return movieCommentDao.movieCommentDeleteOne(lineReviewNumber);
	}
	
}