package com.dev.movie.controlller;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dev.movie.dto.MovieDto;
import com.dev.movie.service.MovieService;
import com.dev.util.Paging;

@Controller
public class MovieController {

	private static final Logger log = LoggerFactory.getLogger(MovieController.class);

	@Autowired
	private MovieService movieService;

//	 영화 목록조희, 리스트, 페이징
	@RequestMapping(value = "/movie/list.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String movieList(@RequestParam(defaultValue = "1") int curPage, Model model) {
//	 Log4j
		log.info("Welcome MovieController list!: {}", curPage);

		int totalCount = movieService.movieSelectTotalCount();
		
		Paging moviePaging = new Paging(totalCount, curPage); 
		
		int start = moviePaging.getPageBegin();
		int end = moviePaging.getPageEnd();
		
		List<MovieDto> movieList = movieService.movieSelectList(start, end);
	
		HashMap<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("memberPaging", moviePaging);
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("pagingMap", pagingMap);
		
		return "movie/MovieListView";
	 }
	
//	 영화 상세, 파일
	 @RequestMapping(value = "/movie/listOne.do", method = RequestMethod.GET)
	 public String movieListOne(int movieNumber, Model model) {
		 log.debug("Welcome MovieController movieListOne! - {}", movieNumber);

		 Map<String, Object> map = movieService.movieSelectOne(movieNumber);
	
		 MovieDto movieDto = (MovieDto)map.get("movieDto");
		 List<Map<String, Object>> fileList = (List<Map<String, Object>>)map.get("fileList");
	
		 model.addAttribute("movieDto", movieDto);
		 model.addAttribute("fileList", fileList);
	
		 return "movie/MovieListOneView";
	 }

//	 영화 등록 화면으로 이동
	 @RequestMapping(value = "/movie/add.do", method = RequestMethod.GET)
	 public String movieAdd(Model model) {
		 log.debug("Welcome MovieController movieAdd!");

		 return "movie/MovieForm";
	 }

//	 영화 등록
	 @RequestMapping(value = "/movie/addCtr.do", method = RequestMethod.POST)
	 public String movieAdd(MovieDto movieDto, MultipartHttpServletRequest multipartHttpServletRequest, Model model) {
		log.debug("Welcome MovieController movieAdd! " + movieDto);

		try {
			movieService.movieInsertOne(movieDto, multipartHttpServletRequest);
		} catch (Exception e) {
		// TODO: handle exception
			System.out.println("오류 처리할 거 있으면 한다");
			e.printStackTrace();
		}
		return "redirect:/movie/list.do";
	 }
	 
//	 영화 수정 화면으로, 파일 추가
	 @RequestMapping(value = "/movie/update.do", method = RequestMethod.GET)
	 public String movieUpdate(int movieNumber, Model model) {
		 log.info("Welcome movieUpdate!" + movieNumber);
	
		 Map<String, Object> map = movieService.movieSelectOne(movieNumber);

		 MovieDto movieDto = (MovieDto)map.get("movieDto");
	
		 List<Map<String, Object>> fileList = (List<Map<String, Object>>)map.get("fileList");
	
		 model.addAttribute("movieDto", movieDto);
		 model.addAttribute("fileList", fileList);
	
		 return "movie/MovieUpdateForm";
	 }

//	 회원수정, 파일 추가
	 @RequestMapping(value = "/movie/updateCtr.do", method = RequestMethod.POST)
	 public String movieUpdateCtr(MovieDto movieDto
	, @RequestParam(value = "fileIdx", defaultValue = "-1") int fileIdx
	, MultipartHttpServletRequest multipartHttpServletRequest, Model model) {
		 log.info("Welcome MovieController movieUpdateCtr! movieDto: {}\n fileIdx: {}", movieDto, fileIdx);
	
		 int resultNum = 0;
	
		 try {
			 resultNum = movieService.movieUpdateOne(movieDto, multipartHttpServletRequest, fileIdx);
		 } catch (Exception e) {
			 // TODO: handle exception
			 e.printStackTrace();
		 }
		 return "common/successPage";
	 }

//	 영화 삭제
	 @RequestMapping(value = "/movie/delete.do", method = RequestMethod.GET)
	public String movieDeleteCtr(int movieNumber, Model model) {
		log.debug("Welcome MovieController movieDelete" + movieNumber);

		movieService.movieDeleteOne(movieNumber);

		return "redirect:/movie/list.do";
	}

}