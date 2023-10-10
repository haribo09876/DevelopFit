package com.dev.movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dev.movie.dto.MovieDto;
import com.dev.movie.service.MovieService;
import com.dev.util.Paging;

@Controller
public class MovieController {

	private static final Logger log = LoggerFactory.getLogger(MovieController.class);

	@Autowired
	private MovieService movieService;

//	 홈 페이지
	@RequestMapping(value = "/movie/homePage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String homePage(@RequestParam(defaultValue = "1") int curPage, Model model) {
		log.info("Welcome MovieController list!: {}", curPage);

		int totalCount = movieService.movieSelectTotalCount();
		
		Paging moviePaging = new Paging(totalCount, curPage); 
		
		int start = moviePaging.getPageBegin();
		int end = moviePaging.getPageEnd();
		
		List<MovieDto> movieList = movieService.movieSelectList(start, end);

		HashMap<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("moviePaging", moviePaging);
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("pagingMap", pagingMap);
		
		return "movie/HomePage";
	 }
	
//	 영화 정보 추가 페이지로 이동
	 @RequestMapping(value = "/movie/add.do", method = RequestMethod.GET)
	 public String movieAdd(Model model) {
		 log.debug("Welcome MovieController movieAdd!");

		 return "movie/MovieForm";
	 }

//	 영화 정보 추가 (C)
	 @RequestMapping(value = "/movie/addCtr.do", method = RequestMethod.POST)
	 public String movieAdd(MovieDto movieDto, Model model) {
		log.debug("Welcome MovieController movieAdd! " + movieDto);

		try {
			movieService.movieInsertOne(movieDto);
		} catch (Exception e) {
		// TODO: handle exception
			System.out.println("오류 처리할 거 있으면 한다");
			e.printStackTrace();
		}
		return "redirect:/movie/list.do";
	 }	
	
//	 영화 정보 리스트 (R)
	@RequestMapping(value = "/movie/list.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String movieList(@RequestParam(defaultValue = "1") int curPage, Model model) {
		log.info("Welcome MovieController list!: {}", curPage);

		int totalCount = movieService.movieSelectTotalCount();
		
		Paging moviePaging = new Paging(totalCount, curPage); 
		
		int start = moviePaging.getPageBegin();
		int end = moviePaging.getPageEnd();
		
		List<MovieDto> movieList = movieService.movieSelectList(start, end);

		HashMap<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("moviePaging", moviePaging);
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("pagingMap", pagingMap);
		
		return "movie/MovieListView";
	 }
	
//	 관리자 페이지 영화 정보 리스트 (R)
	@RequestMapping(value = "/movie/adminList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String movieAdminList(@RequestParam(defaultValue = "1") int curPage, Model model) {
		log.info("Welcome MovieController list!: {}", curPage);

		int totalCount = movieService.movieSelectTotalCount();
		
		Paging moviePaging = new Paging(totalCount, curPage); 
		
		int start = moviePaging.getPageBegin();
		int end = moviePaging.getPageEnd();
		
		List<MovieDto> movieList = movieService.movieSelectList(start, end);

		HashMap<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("moviePaging", moviePaging);
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("pagingMap", pagingMap);
		
		return "movie/MovieAdminListView";
	 }
	
//	 영화 정보 상세 (R)
	 @RequestMapping(value = "/movie/listOne.do", method = RequestMethod.GET)
	 public String movieListOne(HttpSession session, int movieNumber, Model model) {
		 log.debug("Welcome MovieController movieListOne! - {}", movieNumber);

		 Map<String, Object> map = movieService.movieSelectOne(movieNumber);
		 
		 MovieDto movieDto = (MovieDto)map.get("movieDto");
		 MovieDto actorList = (MovieDto)movieService.castActorList(movieNumber);
		 
		 movieDto.setMovieSummary(movieDto.getMovieSummary().replaceAll("/r/n", "<br>"));
		 List<MovieDto> movieCommentList = (List<MovieDto>) map.get("movieCommentList");
		 
		 model.addAttribute("movieDto", movieDto);
		 model.addAttribute("movieCommentList", movieCommentList);
		 model.addAttribute("actorList", actorList);
	
		 return "movie/MovieListOneView";
	 }
	 
//	 영화 정보 수정 페이지로 이동
	 @RequestMapping(value = "/movie/update.do", method = RequestMethod.GET)
	 public String movieUpdate(int movieNumber, Model model) {
		 log.info("Welcome movieUpdate!" + movieNumber);
	
		 Map<String, Object> map = movieService.movieSelectOne(movieNumber);

		 MovieDto movieDto = (MovieDto)map.get("movieDto");
	
		 model.addAttribute("movieDto", movieDto);
	
		 return "movie/MovieUpdateForm";
	 }	
	 
//	 영화 정보 수정 (U)
	 @RequestMapping(value = "/movie/updateCtr.do", method = RequestMethod.POST)
	 public String movieUpdateCtr(MovieDto movieDto, Model model) {
		 log.info("Welcome MovieController movieUpdateCtr! movieDto: {}\n fileIdx: {}", movieDto);
	
		 int resultNum = 0;
	
		 try {
			 resultNum = movieService.movieUpdateOne(movieDto);
		 } catch (Exception e) {
			 // TODO: handle exception
			 e.printStackTrace();
		 }
		 return "redirect:/movie/list.do";
	 }

//	 영화 정보 삭제 (D)
	 @RequestMapping(value = "/movie/delete.do", method = RequestMethod.GET)
	public String movieDeleteCtr(int movieNumber, Model model) {
		log.debug("Welcome MovieController movieDelete" + movieNumber);

		movieService.movieDeleteOne(movieNumber);

		return "redirect:/movie/list.do";
	}


//	 한줄평 추가 페이지로 이동
	 @RequestMapping(value = "/movie/commentAdd.do", method = RequestMethod.GET)
	 public String movieCommentAdd(MovieDto movieDto, Model model) {
		 log.debug("Welcome MovieController movieCommentAdd!");

		 model.addAttribute("movieDto", movieDto);
		 
		 return "movie/MovieCommentForm";
	 }
	 
//	 한줄평 추가 (C)
	 @RequestMapping(value = "/movie/commentAddCtr.do", method = RequestMethod.POST)
	 public String movieCommentAddCtr(MovieDto movieDto, Model model) {
		log.debug("Welcome MovieController movieCommentAdd! " + movieDto);

		try {
			movieService.movieCommentInsertOne(movieDto);
		} catch (Exception e) {
		// TODO: handle exception
			System.out.println("오류 처리할 거 있으면 한다");
			e.printStackTrace();
		}
		return "redirect:/movie/listOne.do?movieNumber=" + movieDto.getMovieNumber();
	 }

//	 한줄평 리스트 (R)
	@RequestMapping(value = "/movie/commentList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String movieCommentList(@RequestParam(defaultValue = "1") int curPage, Model model) {
		log.info("Welcome MovieController list!: {}", curPage);

		int totalCount = movieService.movieCommentSelectTotalCount();
		
		Paging moviePaging = new Paging(totalCount, curPage); 
		
		int start = moviePaging.getPageBegin();
		int end = moviePaging.getPageEnd();
		
		List<MovieDto> movieCommentList = movieService.movieCommentSelectList(start, end);

		HashMap<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("moviePaging", moviePaging);
		
		model.addAttribute("movieCommentList", movieCommentList);
		model.addAttribute("pagingMap", pagingMap);
		
		return "movie/MovieCommentListView";
	 }
	
//	 한줄평 상세 (R)
	 @RequestMapping(value = "/movie/commentListOne.do", method = RequestMethod.GET)
	 public String movieCommentListOne(int lineReviewNumber, Model model) {
		 log.debug("Welcome MovieController movieCommentListOne! - {}", lineReviewNumber);

		 Map<String, Object> map = movieService.movieCommentSelectOne(lineReviewNumber);

		 MovieDto movieDto = (MovieDto)map.get("movieDto");

		 model.addAttribute("movieDto", movieDto);

		 return "movie/MovieCommentListOneView";
	 }

//	 한줄평 수정 페이지로 이동
	 @RequestMapping(value = "/movie/commentUpdate.do", method = RequestMethod.GET)
	 public String movieCommentUpdate(int lineReviewNumber, Model model) {
		 log.info("Welcome movieCommentUpdate!" + lineReviewNumber);
	
		 Map<String, Object> map = movieService.movieCommentSelectOne(lineReviewNumber);

		 MovieDto movieDto = (MovieDto)map.get("movieDto");
	
		 model.addAttribute("movieDto", movieDto);
	
		 return "movie/MovieCommentUpdateForm";
	 }

//	 한줄평 수정 (U)
	 @RequestMapping(value = "/movie/commentUpdateCtr.do", method = RequestMethod.POST)
	 public String movieCommentUpdateCtr(MovieDto movieDto, Model model) {
		 log.info("Welcome MovieController movieCommentUpdateCtr! movieDto: {}\n fileIdx: {}", movieDto);
	
		 int resultNum = 0;
	
		 try {
			 resultNum = movieService.movieCommentUpdateOne(movieDto);
		 } catch (Exception e) {
			 // TODO: handle exception
			 e.printStackTrace();
		 }
		 return "redirect:/movie/listOne.do?movieNumber=" + movieDto.getMovieNumber();
	 }	 

//	 한줄평 삭제 (D)
	 @RequestMapping(value = "/movie/commentDelete.do", method = RequestMethod.GET)
	public String movieCommentDeleteCtr(int lineReviewNumber, Model model) {
		log.debug("Welcome MovieController movieCommentDelete" + lineReviewNumber);

		movieService.movieCommentDeleteOne(lineReviewNumber);

		return "redirect:/movie/commentList.do";
	}
}