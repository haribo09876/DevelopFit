package com.dev.movie.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.movie.dto.MovieDto;

@Repository
public class MovieDaoImpl implements MovieDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.dev.movie.";
	
	@Override
	public List<MovieDto> movieSelectList(int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		return sqlSession.selectList("com.dev.movie.movieSelectList", map);
	}
	
	@Override
	public int movieInsertOne(MovieDto movieDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("com.dev.movie.movieInsertOne", movieDto);
	}
	
	@Override
	public MovieDto movieSelectOne(int movieNumber) {
		// TODO Auto-generated method stub
		MovieDto movieDto = sqlSession.selectOne("com.dev.movie.movieSelectOne", movieNumber);
		return movieDto;
	}
	
	@Override
	public int movieUpdateOne(MovieDto movieDto) {
		// TODO Auto-generated method stub
		return sqlSession.update("com.dev.movie.movieUpdateOne", movieDto);
	}
	
	@Override
	public int movieDeleteOne(int movieNumber) {
		// TODO Auto-generated method stub
		return sqlSession.delete("com.dev.movie.movieDeleteOne", movieNumber);
	}
	
	@Override
	public int movieSelectTotalCount() {
		// TODO Auto-generated method stub
		return (int)sqlSession.selectOne("com.dev.movie.movieSelectTotalCount");
	}
	
	@Override
	public void insertFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.dev.movie.insertFile", map);		
	}
	
	@Override
	public List<Map<String, Object>> fileSelectList(int movieNumber) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "fileSelectList", movieNumber);
	}
	
	@Override
	public Map<String, Object> fileSelectStoredFileName(int parentSeq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "fileSelectStoredFileName", parentSeq);
	}
	
	@Override
	public int fileDelete(int parentSeq) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "fileDelete", parentSeq);
	}

}
