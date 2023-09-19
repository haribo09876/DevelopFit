package com.dev.board.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.board.dao.BoardCommentDao;
import com.dev.board.dto.BoardCommentDto;

@Service
public class BoardCommentServiceImpl implements BoardCommentService{

	private static final Logger log = LoggerFactory.getLogger(BoardCommentServiceImpl.class);
	
	@Autowired
	public BoardCommentDao boardCommentDao;
	
	@Override
	public List<BoardCommentDto> boardCommentSelectList(int start, int end) {
		// TODO Auto-generated method stub
		log.info("Welcome boardCommentServiceImpl SelectList!");
		return boardCommentDao.boardCommentSelectList(start, end);
	}
	
	@Override
	public void boardCommentInsertOne(BoardCommentDto boardCommentDto){
		boardCommentDao.boardCommentInsertOne(boardCommentDto);
	}

	@Override
	public int boardCommentUpdateOne(BoardCommentDto boardCommentDto){
		// TODO Auto-generated method stub
		int resultNum = 0;
		
		resultNum = boardCommentDao.boardCommentUpdateOne(boardCommentDto);
		
		return resultNum;
	}

	@Override
	public int boardCommentDeleteOne(BoardCommentDto boardCommentDto) {
		// TODO Auto-generated method stub
		return boardCommentDao.boardCommentDeleteOne(boardCommentDto);
	}

	@Override
	public int boardCommentSelectTotalCount() {
		// TODO Auto-generated method stub
		return boardCommentDao.boardCommentSelectTotalCount();
	}
	
}
