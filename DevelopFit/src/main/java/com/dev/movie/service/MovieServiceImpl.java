package com.dev.movie.service;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dev.movie.dao.MovieDao;
import com.dev.movie.dto.MovieDto;
import com.dev.util.FileUtils;

@Service
public class MovieServiceImpl implements MovieService{
	
	private static final Logger log = LoggerFactory.getLogger(MovieServiceImpl.class);

	@Autowired
	public MovieDao movieDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
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
		
//		List<Map<String, Object>> fileList = movieDao.fileSelectList(movieNumber);
//		resultMap.put("fileList", fileList);
		
		return resultMap;
	}
	
	@Override
	public void movieInsertOne(MovieDto movieDto
			, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		// TODO Auto-generated method stub
		movieDao.movieInsertOne(movieDto);
		
//		int parentSeq = movieDto.getMovieNumber();
//		List<Map<String, Object>> list =
//				fileUtils.parseInsertFileInfo(parentSeq, multipartHttpServletRequest);
//			
//		for (int i = 0; i <list.size(); i++) {
//			movieDao.insertFile(list.get(i));
//		}
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int movieUpdateOne(MovieDto movieDto, MultipartHttpServletRequest multipartHttpServletRequest, int fileIdx) throws Exception {
		// TODO Auto-generated method stub
		int resultNum = 0;
		
		try {
			resultNum = movieDao.movieUpdateOne(movieDto);
			
//			int parentSeq = movieDto.getMovieNumber();
//			Map<String, Object> tempFileMap
//				= movieDao.fileSelectStoredFileName(parentSeq);
//			
//			List<Map<String, Object>> list
//				= fileUtils.parseInsertFileInfo(parentSeq, multipartHttpServletRequest);
//
////			오로지 하나만 관리
//			if(list.isEmpty() == false) {
//				if(tempFileMap != null) {
//					movieDao.fileDelete(parentSeq);
//					fileUtils.parseUpdateFileInfo(tempFileMap);
//				}
//				
//				for (Map<String, Object> map : list) {
//					movieDao.insertFile(map);
//				}
//			} else if(fileIdx == -1) {
//				if(tempFileMap != null) {
//					movieDao.fileDelete(parentSeq);
//					fileUtils.parseUpdateFileInfo(tempFileMap);
//				}
//			}
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
	
}