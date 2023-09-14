package com.dev.board.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dev.board.dao.BoardDao;
import com.dev.board.dto.BoardDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService{

	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	public BoardDao boardDao;
	
	@Override
	public List<BoardDto> boardSelectList(int start, int end) {
		// TODO Auto-generated method stub
		log.info("Welcome boardServiceImpl SelectList!");
		return boardDao.boardSelectList(start, end);
	}
//이거 헷갈린다.. 인서트 에러나면 이거때문일 확률 높음
	@Override
	public void boardInsertOne(BoardDto boardDto
		, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception{
		// TODO Auto-generated method stub
		boardDao.boardInsertOne(boardDto);
	}

	@Override
	public Map<String, Object> boardSelectOne(int no) {
		// TODO Auto-generated method stub
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		BoardDto boardDto = boardDao.boardSelectOne(no);
		resultMap.put("boardDto", boardDto);
		
		return resultMap;
	}

	@Override
	public int boardUpdateOne(BoardDto boardDto){
		// TODO Auto-generated method stub
		int resultNum = 0;
		
		resultNum = boardDao.boardUpdateOne(boardDto);
		
		return resultNum;
	}

	@Override
	public int boardDeleteOne(int no) {
		// TODO Auto-generated method stub
		return boardDao.boardDeleteOne(no);
	}

	@Override
	public int boardSelectTotalCount() {
		// TODO Auto-generated method stub
		return boardDao.boardSelectTotalCount();
	}
	@Override
	public List<BoardDto> boardSearchList(String searchKeyword, int start, int end) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int viewCount(int no) {
		// TODO Auto-generated method stub
		return boardDao.viewCount(no);
	}
}
