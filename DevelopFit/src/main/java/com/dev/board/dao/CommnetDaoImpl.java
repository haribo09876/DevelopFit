package com.dev.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.board.dto.CommentDto;
import com.dev.board.service.CommentServiceImpl;

@Repository
public class CommnetDaoImpl implements CommentDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.dev.comment";
	
	@Override
	public List<CommentDto> commentSelectList(int boardNumber) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNumber", boardNumber);
		
		return sqlSession.selectList("com.dev.comment.commentSelectList", map);
	}

	@Override
	public int commentInsertOne(CommentDto commentDto) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("com.dev.comment.commentInsertOne", commentDto);
	}
	
	@Override
	public int commentUpdateOne(CommentDto commentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update("com.dev.comment.commentUpdateOne", commentDto);
	}

	@Override
	public int commentDeleteOne(CommentDto commentDto) {
		// TODO Auto-generated method stub
		return sqlSession.delete("com.dev.comment.commentDeleteOne", commentDto);
	}

	@Override
	public int commentSelectTotalCount() {
		return (int)sqlSession.selectOne("com.dev.comment.commentSelectTotalCount");
	}
	
}
