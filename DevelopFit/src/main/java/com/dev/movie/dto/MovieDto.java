package com.dev.movie.dto;

import java.util.Date;

public class MovieDto {

	private int movie_no;
	private String movie_title;
	private String movie_summary;
	private Date movie_reldate;
	private String movie_runtime;
	private int movie_price;
	private String movie_poster;
	private String movie_preview;
	
	private int director_no;
	private String director_name;
	
	private int cast_no;
	
	private int actor_no;
	private String actor_name;
	
	private int rating_no;
	private int rating_grade;
	
	private int review_no;
	private String review_context;
	private String review_id;
	
	private int user_no;

	public MovieDto() {
		super();
	}

	public MovieDto(int movie_no, String movie_title, String movie_summary, Date movie_reldate, String movie_runtime,
			int movie_price, String movie_poster, String movie_preview, int director_no, String director_name,
			int cast_no, int actor_no, String actor_name, int rating_no, int rating_grade, int review_no,
			String review_context, String review_id, int user_no) {
		super();
		this.movie_no = movie_no;
		this.movie_title = movie_title;
		this.movie_summary = movie_summary;
		this.movie_reldate = movie_reldate;
		this.movie_runtime = movie_runtime;
		this.movie_price = movie_price;
		this.movie_poster = movie_poster;
		this.movie_preview = movie_preview;
		this.director_no = director_no;
		this.director_name = director_name;
		this.cast_no = cast_no;
		this.actor_no = actor_no;
		this.actor_name = actor_name;
		this.rating_no = rating_no;
		this.rating_grade = rating_grade;
		this.review_no = review_no;
		this.review_context = review_context;
		this.review_id = review_id;
		this.user_no = user_no;
	}

	public int getMovie_no() {
		return movie_no;
	}

	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}

	public String getMovie_title() {
		return movie_title;
	}

	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}

	public String getMovie_summary() {
		return movie_summary;
	}

	public void setMovie_summary(String movie_summary) {
		this.movie_summary = movie_summary;
	}

	public Date getMovie_reldate() {
		return movie_reldate;
	}

	public void setMovie_reldate(Date movie_reldate) {
		this.movie_reldate = movie_reldate;
	}

	public String getMovie_runtime() {
		return movie_runtime;
	}

	public void setMovie_runtime(String movie_runtime) {
		this.movie_runtime = movie_runtime;
	}

	public int getMovie_price() {
		return movie_price;
	}

	public void setMovie_price(int movie_price) {
		this.movie_price = movie_price;
	}

	public String getMovie_poster() {
		return movie_poster;
	}

	public void setMovie_poster(String movie_poster) {
		this.movie_poster = movie_poster;
	}

	public String getMovie_preview() {
		return movie_preview;
	}

	public void setMovie_preview(String movie_preview) {
		this.movie_preview = movie_preview;
	}

	public int getDirector_no() {
		return director_no;
	}

	public void setDirector_no(int director_no) {
		this.director_no = director_no;
	}

	public String getDirector_name() {
		return director_name;
	}

	public void setDirector_name(String director_name) {
		this.director_name = director_name;
	}

	public int getCast_no() {
		return cast_no;
	}

	public void setCast_no(int cast_no) {
		this.cast_no = cast_no;
	}

	public int getActor_no() {
		return actor_no;
	}

	public void setActor_no(int actor_no) {
		this.actor_no = actor_no;
	}

	public String getActor_name() {
		return actor_name;
	}

	public void setActor_name(String actor_name) {
		this.actor_name = actor_name;
	}

	public int getRating_no() {
		return rating_no;
	}

	public void setRating_no(int rating_no) {
		this.rating_no = rating_no;
	}

	public int getRating_grade() {
		return rating_grade;
	}

	public void setRating_grade(int rating_grade) {
		this.rating_grade = rating_grade;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getReview_context() {
		return review_context;
	}

	public void setReview_context(String review_context) {
		this.review_context = review_context;
	}

	public String getReview_id() {
		return review_id;
	}

	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	@Override
	public String toString() {
		return "MovieDto [movie_no=" + movie_no + ", movie_title=" + movie_title + ", movie_summary=" + movie_summary
				+ ", movie_reldate=" + movie_reldate + ", movie_runtime=" + movie_runtime + ", movie_price="
				+ movie_price + ", movie_poster=" + movie_poster + ", movie_preview=" + movie_preview + ", director_no="
				+ director_no + ", director_name=" + director_name + ", cast_no=" + cast_no + ", actor_no=" + actor_no
				+ ", actor_name=" + actor_name + ", rating_no=" + rating_no + ", rating_grade=" + rating_grade
				+ ", review_no=" + review_no + ", review_context=" + review_context + ", review_id=" + review_id
				+ ", user_no=" + user_no + "]";
	}

}
