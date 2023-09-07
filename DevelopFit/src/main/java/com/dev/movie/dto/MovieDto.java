package com.dev.movie.dto;

import java.util.Date;

public class MovieDto {

	private int movie_number;
	private String movie_title;
	private String movie_summary;
	private Date movie_release_date;
	private String movie_runtime;
	private int movie_price;
	private String movie_poster;
	private String movie_preview;
	
	private int director_number;
	private String director_name;
	
	private int actor_number;
	private String actor_name;
	
	private int rating_number;
	private int rating_grade;
	
	private int line_review_number;
	private String line_review_context;
	private String user_id;
	
	private int order_history_number;
	private Date order_history_time;
	private int user_number;
	
	private int basket_number;

	public MovieDto() {
		super();
	}

	public MovieDto(int movie_number, String movie_title, String movie_summary, Date movie_release_date,
			String movie_runtime, int movie_price, String movie_poster, String movie_preview, int director_number,
			String director_name, int actor_number, String actor_name, int rating_number, int rating_grade,
			int line_review_number, String line_review_context, String user_id, int order_history_number,
			Date order_history_time, int user_number, int basket_number) {
		super();
		this.movie_number = movie_number;
		this.movie_title = movie_title;
		this.movie_summary = movie_summary;
		this.movie_release_date = movie_release_date;
		this.movie_runtime = movie_runtime;
		this.movie_price = movie_price;
		this.movie_poster = movie_poster;
		this.movie_preview = movie_preview;
		this.director_number = director_number;
		this.director_name = director_name;
		this.actor_number = actor_number;
		this.actor_name = actor_name;
		this.rating_number = rating_number;
		this.rating_grade = rating_grade;
		this.line_review_number = line_review_number;
		this.line_review_context = line_review_context;
		this.user_id = user_id;
		this.order_history_number = order_history_number;
		this.order_history_time = order_history_time;
		this.user_number = user_number;
		this.basket_number = basket_number;
	}

	public int getMovie_number() {
		return movie_number;
	}

	public void setMovie_number(int movie_number) {
		this.movie_number = movie_number;
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

	public Date getMovie_release_date() {
		return movie_release_date;
	}

	public void setMovie_release_date(Date movie_release_date) {
		this.movie_release_date = movie_release_date;
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

	public int getDirector_number() {
		return director_number;
	}

	public void setDirector_number(int director_number) {
		this.director_number = director_number;
	}

	public String getDirector_name() {
		return director_name;
	}

	public void setDirector_name(String director_name) {
		this.director_name = director_name;
	}

	public int getActor_number() {
		return actor_number;
	}

	public void setActor_number(int actor_number) {
		this.actor_number = actor_number;
	}

	public String getActor_name() {
		return actor_name;
	}

	public void setActor_name(String actor_name) {
		this.actor_name = actor_name;
	}

	public int getRating_number() {
		return rating_number;
	}

	public void setRating_number(int rating_number) {
		this.rating_number = rating_number;
	}

	public int getRating_grade() {
		return rating_grade;
	}

	public void setRating_grade(int rating_grade) {
		this.rating_grade = rating_grade;
	}

	public int getLine_review_number() {
		return line_review_number;
	}

	public void setLine_review_number(int line_review_number) {
		this.line_review_number = line_review_number;
	}

	public String getLine_review_context() {
		return line_review_context;
	}

	public void setLine_review_context(String line_review_context) {
		this.line_review_context = line_review_context;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getOrder_history_number() {
		return order_history_number;
	}

	public void setOrder_history_number(int order_history_number) {
		this.order_history_number = order_history_number;
	}

	public Date getOrder_history_time() {
		return order_history_time;
	}

	public void setOrder_history_time(Date order_history_time) {
		this.order_history_time = order_history_time;
	}

	public int getUser_number() {
		return user_number;
	}

	public void setUser_number(int user_number) {
		this.user_number = user_number;
	}

	public int getBasket_number() {
		return basket_number;
	}

	public void setBasket_number(int basket_number) {
		this.basket_number = basket_number;
	}

	@Override
	public String toString() {
		return "MovieDto [movie_number=" + movie_number + ", movie_title=" + movie_title + ", movie_summary="
				+ movie_summary + ", movie_release_date=" + movie_release_date + ", movie_runtime=" + movie_runtime
				+ ", movie_price=" + movie_price + ", movie_poster=" + movie_poster + ", movie_preview=" + movie_preview
				+ ", director_number=" + director_number + ", director_name=" + director_name + ", actor_number="
				+ actor_number + ", actor_name=" + actor_name + ", rating_number=" + rating_number + ", rating_grade="
				+ rating_grade + ", line_review_number=" + line_review_number + ", line_review_context="
				+ line_review_context + ", user_id=" + user_id + ", order_history_number=" + order_history_number
				+ ", order_history_time=" + order_history_time + ", user_number=" + user_number + ", basket_number="
				+ basket_number + "]";
	}
	
}
