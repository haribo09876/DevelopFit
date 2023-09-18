package com.dev.movieComment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dev.movieComment.dto.MovieCommentDto;
import com.dev.movieComment.service.MovieCommentService;
import com.dev.util.Paging;

@Controller
public class MovieCommentController {

	private static final Logger log = LoggerFactory.getLogger(MovieCommentController.class);

	@Autowired
	private MovieCommentService movieCommentService;

//	 영화 한줄평 리스트
	@RequestMapping(value = "/movieComment/list.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String movieCommentList(@RequestParam(defaultValue = "1") int curPage, Model model) {
//	 Log4j
		log.info("Welcome MovieCommentController list!: {}", curPage);

		int totalCount = movieCommentService.movieCommentSelectTotalCount();
		
		Paging movieCommentPaging = new Paging(totalCount, curPage); 
		
		int start = movieCommentPaging.getPageBegin();
		int end = movieCommentPaging.getPageEnd();
		
		List<MovieCommentDto> movieCommentList = movieCommentService.movieCommentSelectList(start, end);

		HashMap<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("movieCommentPaging", movieCommentPaging);
		
		model.addAttribute("movieCommentList", movieCommentList);
		model.addAttribute("pagingMap", pagingMap);
		
		return "movie/MovieCommentListView";
	 }
	
//	 영화 한줄평 상세
	 @RequestMapping(value = "/movieComment/listOne.do", method = RequestMethod.GET)
	 public String movieCommentListOne(int lineReviewNumber, Model model) {
		 log.debug("Welcome MovieCommentController movieCommentListOne! - {}", lineReviewNumber);

		 Map<String, Object> map = movieCommentService.movieCommentSelectOne(lineReviewNumber);
	
		 MovieCommentDto movieCommentDto = (MovieCommentDto)map.get("movieCommentDto");
	
		 model.addAttribute("movieCommentDto", movieCommentDto);
	
		 return "movie/MovieCommentListOneView";
	 }

//	 영화 한줄평 등록 페이지 이동
	 @RequestMapping(value = "/movieComment/add.do", method = RequestMethod.GET)
	 public String movieCommentAdd(Model model) {
		 log.debug("Welcome MovieCommentController movieCommentAdd!");

		 return "movie/MovieCommentForm";
	 }

//	 영화 한줄평 등록
	 @RequestMapping(value = "/movieComment/addCtr.do", method = RequestMethod.POST)
	 public String movieCommentAdd(MovieCommentDto movieCommentDto, Model model) {
		log.debug("Welcome MovieCommentController movieCommentAdd! " + movieCommentDto);

		try {
			movieCommentService.movieCommentInsertOne(movieCommentDto);
		} catch (Exception e) {
		// TODO: handle exception
			System.out.println("오류 처리할 거 있으면 한다");
			e.printStackTrace();
		}
		return "redirect:/movieComment/list.do";
	 }
	 
//	 영화 한줄평 수정 페이지 이동
	 @RequestMapping(value = "/movieComment/update.do", method = RequestMethod.GET)
	 public String movieCommentUpdate(int lineReviewNumber, Model model) {
		 log.info("Welcome movieCommentUpdate!" + lineReviewNumber);
	
		 Map<String, Object> map = movieCommentService.movieCommentSelectOne(lineReviewNumber);

		 MovieCommentDto movieCommentDto = (MovieCommentDto)map.get("movieCommentDto");
	
		 model.addAttribute("movieCommentDto", movieCommentDto);
	
		 return "movie/MovieCommentUpdateForm";
	 }
	
	 
//	 영화 한줄평 수정
	 @RequestMapping(value = "/movieComment/updateCtr.do", method = RequestMethod.POST)
	 public String movieCommentUpdateCtr(MovieCommentDto movieCommentDto, Model model) {
		 log.info("Welcome MovieCommentController movieCommentUpdateCtr! movieCommentDto: {}\n fileIdx: {}", movieCommentDto);
	
		 int resultNum = 0;
	
		 try {
			 resultNum = movieCommentService.movieCommentUpdateOne(movieCommentDto);
		 } catch (Exception e) {
			 // TODO: handle exception
			 e.printStackTrace();
		 }
		 return "redirect:/movieComment/list.do";
	 }

//	 영화 한줄평 삭제
	 @RequestMapping(value = "/movieComment/delete.do", method = RequestMethod.GET)
	public String movieCommentDeleteCtr(int lineReviewNumber, Model model) {
		log.debug("Welcome MovieCommentController movieCommentDelete" + lineReviewNumber);

		movieCommentService.movieCommentDeleteOne(lineReviewNumber);

		return "redirect:/movieComment/list.do";
	}

}