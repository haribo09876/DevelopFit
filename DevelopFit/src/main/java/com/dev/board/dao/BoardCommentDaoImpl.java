package com.dev.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.board.dto.BoardCommentDto;
import com.dev.board.service.BoardCommentServiceImpl;

@Repository
public class BoardCommentDaoImpl implements BoardCommentDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.dev.boardComment";
	
	@Override
	public List<BoardCommentDto> boardCommentSelectList(int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList("com.dev.boardComment.boardCommentSelectList", map);
	}

	@Override
	public int boardCommentInsertOne(BoardCommentDto boardCommentDto) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("com.dev.boardComment.boardCommentInsertOne", boardCommentDto);
	}
	
	@Override
	public int boardCommentUpdateOne(BoardCommentDto boardCommentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update("com.dev.boardComment.boardCommentUpdateOne", boardCommentDto);
	}

	@Override
	public int boardCommentDeleteOne(BoardCommentDto boardCommentDto) {
		// TODO Auto-generated method stub
		return sqlSession.delete("com.dev.boardComment.boardCommentDeleteOne", boardCommentDto);
	}

	@Override
	public int boardCommentSelectTotalCount() {
		return (int)sqlSession.selectOne("com.dev.board.boardCommentSelectTotalCount");
	}
	

	
}
