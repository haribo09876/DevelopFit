package com.dev.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.board.dto.BoardDto;
import com.dev.board.service.BoardServiceImpl;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.dev.board";
	
	@Override
	public List<BoardDto> boardSelectList(int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList("com.dev.board.boardSelectList", map);
	}


	@Override
	public int boardInsertOne(BoardDto boardDto) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("com.dev.board.boardInsertOne", boardDto);
	}

	@Override
	public BoardDto boardSelectOne(int boardNumber) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("com.dev.board.boardSelectOne", boardNumber);
	}
	
	@Override
	public int boardUpdateOne(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return sqlSession.update("com.dev.board.boardUpdateOne", boardDto);
	}

	@Override
	public int boardDeleteOne(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return sqlSession.delete("com.dev.board.boardDeleteOne", boardDto);
	}
	
	@Override
	public int boardSelectTotalCount() {
		return (int)sqlSession.selectOne("com.dev.board.boardSelectTotalCount");
	}


	@Override
	public int viewCount(int no) {
		return sqlSession.update("com.dev.board.viewCount", no);
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<BoardDto> searchBoards(String keyword) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("keyword", keyword); // 검색어를 맵에 추가

	    return sqlSession.selectList("com.dev.board.searchBoards", map);
	}
	
	@Override
	public List<BoardDto> boardSelectMyList(int start, int end, int memberNumber) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberNumber", memberNumber);
		
		return sqlSession.selectList("com.dev.board.boardSelectMyList", map);
	}


	@Override
	public int boardSelectMyTotalCount(int memberNumber) {
		// TODO Auto-generated method stub
		return (int)sqlSession.selectOne("com.dev.board.boardSelectMyTotalCount", memberNumber);
	}
	
}
