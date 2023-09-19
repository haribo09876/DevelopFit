package com.dev.movieComment.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.movieComment.dto.MovieCommentDto;

@Repository
public class MovieCommentDaoImpl implements MovieCommentDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.dev.movieComment";
	
	@Override
	public List<MovieCommentDto> movieCommentSelectList(int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		return sqlSession.selectList("com.dev.movieComment.movieCommentSelectList", map);
	}
	
	@Override
	public int movieCommentInsertOne(MovieCommentDto movieCommentDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("com.dev.movieComment.movieCommentInsertOne", movieCommentDto);
	}
	
	@Override
	public MovieCommentDto movieCommentSelectOne(int lineReviewNumber) {
		// TODO Auto-generated method stub
		MovieCommentDto movieCommentDto = sqlSession.selectOne("com.dev.movieComment.movieCommentSelectOne", lineReviewNumber);
		return movieCommentDto;
	}
	
	@Override
	public int movieCommentUpdateOne(MovieCommentDto movieCommentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update("com.dev.movieComment.movieCommentUpdateOne", movieCommentDto);
	}
	
	@Override
	public int movieCommentDeleteOne(int lineReviewNumber) {
		// TODO Auto-generated method stub
		return sqlSession.delete("com.dev.movieComment.movieCommentDeleteOne", lineReviewNumber);
	}
	
	@Override
	public int movieCommentSelectTotalCount() {
		// TODO Auto-generated method stub
		return (int)sqlSession.selectOne("com.dev.movieComment.movieCommentSelectTotalCount");
	}

}