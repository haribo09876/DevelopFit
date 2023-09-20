package com.dev.board.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dev.board.dao.CommentDao;
import com.dev.board.dto.CommentDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CommentServiceImpl implements CommentService{

	private static final Logger log = LoggerFactory.getLogger(CommentServiceImpl.class);
	
	@Autowired
	public CommentDao commentDao;
	
	@Override
	public List<CommentDto> commentSelectList(int boardNumber) {
		// TODO Auto-generated method stub
		log.info("Welcome CommentServiceImpl SelectList!");
		return commentDao.commentSelectList(boardNumber);
	}
	
	@Override
	public void commentInsertOne(CommentDto commentDto){
		commentDao.commentInsertOne(commentDto);
	}

	@Override
	public int commentUpdateOne(CommentDto commentDto){
		// TODO Auto-generated method stub
		int resultNum = 0;
		
		resultNum = commentDao.commentUpdateOne(commentDto);
		
		return resultNum;
	}

	@Override
	public int commentDeleteOne(CommentDto commentDto) {
		// TODO Auto-generated method stub
		return commentDao.commentDeleteOne(commentDto);
	}

	@Override
	public int commentSelectTotalCount() {
		// TODO Auto-generated method stub
		return commentDao.commentSelectTotalCount();
	}

	
}
