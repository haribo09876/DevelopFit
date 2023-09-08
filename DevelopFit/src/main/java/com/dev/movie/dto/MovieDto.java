package com.dev.movie.dto;

import java.util.Date;

public class MovieDto {
	
	private int actor_number;
	private String actor_name;
	
	private int basket_number;
	
	private int cast_member_number;

	private int director_number;
	private String director_name;
	
	private int genre_number;
	private String genre_name;
	
	private int heart_number;
	private String heart_check;
	
	private int line_review_number;
	private String line_review_context;
		
	private int movie_number;
	private String movie_title;
	private String movie_summary;
	private Date movie_release_date;
	private String movie_runtime;
	private int movie_price;
	private String movie_poster;
	private String movie_preview;
	
	private int order_history_number;
	private Date order_history_time;
	
	private int prefer_genre_number;
	private String prefer_genre_first;
	private String prefer_genre_second;
	private String prefer_genre_third;
	
	private int rating_number;
	private int rating_grade;
	
	private int watch_number;
	private String watch_check;
	
	private int member_number;
	private String member_id;
	
	public MovieDto() {
		super();
	}

	public MovieDto(int actor_number, String actor_name, int basket_number, int cast_member_number, int director_number,
			String director_name, int genre_number, String genre_name, int heart_number, String heart_check,
			int line_review_number, String line_review_context, int movie_number, String movie_title,
			String movie_summary, Date movie_release_date, String movie_runtime, int movie_price, String movie_poster,
			String movie_preview, int order_history_number, Date order_history_time, int prefer_genre_number,
			String prefer_genre_first, String prefer_genre_second, String prefer_genre_third, int rating_number,
			int rating_grade, int watch_number, String watch_check, int member_number, String member_id) {
		super();
		this.actor_number = actor_number;
		this.actor_name = actor_name;
		this.basket_number = basket_number;
		this.cast_member_number = cast_member_number;
		this.director_number = director_number;
		this.director_name = director_name;
		this.genre_number = genre_number;
		this.genre_name = genre_name;
		this.heart_number = heart_number;
		this.heart_check = heart_check;
		this.line_review_number = line_review_number;
		this.line_review_context = line_review_context;
		this.movie_number = movie_number;
		this.movie_title = movie_title;
		this.movie_summary = movie_summary;
		this.movie_release_date = movie_release_date;
		this.movie_runtime = movie_runtime;
		this.movie_price = movie_price;
		this.movie_poster = movie_poster;
		this.movie_preview = movie_preview;
		this.order_history_number = order_history_number;
		this.order_history_time = order_history_time;
		this.prefer_genre_number = prefer_genre_number;
		this.prefer_genre_first = prefer_genre_first;
		this.prefer_genre_second = prefer_genre_second;
		this.prefer_genre_third = prefer_genre_third;
		this.rating_number = rating_number;
		this.rating_grade = rating_grade;
		this.watch_number = watch_number;
		this.watch_check = watch_check;
		this.member_number = member_number;
		this.member_id = member_id;
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

	public int getBasket_number() {
		return basket_number;
	}

	public void setBasket_number(int basket_number) {
		this.basket_number = basket_number;
	}

	public int getCast_member_number() {
		return cast_member_number;
	}

	public void setCast_member_number(int cast_member_number) {
		this.cast_member_number = cast_member_number;
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

	public int getGenre_number() {
		return genre_number;
	}

	public void setGenre_number(int genre_number) {
		this.genre_number = genre_number;
	}

	public String getGenre_name() {
		return genre_name;
	}

	public void setGenre_name(String genre_name) {
		this.genre_name = genre_name;
	}

	public int getHeart_number() {
		return heart_number;
	}

	public void setHeart_number(int heart_number) {
		this.heart_number = heart_number;
	}

	public String getHeart_check() {
		return heart_check;
	}

	public void setHeart_check(String heart_check) {
		this.heart_check = heart_check;
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

	public int getPrefer_genre_number() {
		return prefer_genre_number;
	}

	public void setPrefer_genre_number(int prefer_genre_number) {
		this.prefer_genre_number = prefer_genre_number;
	}

	public String getPrefer_genre_first() {
		return prefer_genre_first;
	}

	public void setPrefer_genre_first(String prefer_genre_first) {
		this.prefer_genre_first = prefer_genre_first;
	}

	public String getPrefer_genre_second() {
		return prefer_genre_second;
	}

	public void setPrefer_genre_second(String prefer_genre_second) {
		this.prefer_genre_second = prefer_genre_second;
	}

	public String getPrefer_genre_third() {
		return prefer_genre_third;
	}

	public void setPrefer_genre_third(String prefer_genre_third) {
		this.prefer_genre_third = prefer_genre_third;
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

	public int getWatch_number() {
		return watch_number;
	}

	public void setWatch_number(int watch_number) {
		this.watch_number = watch_number;
	}

	public String getWatch_check() {
		return watch_check;
	}

	public void setWatch_check(String watch_check) {
		this.watch_check = watch_check;
	}

	public int getMember_number() {
		return member_number;
	}

	public void setMember_number(int member_number) {
		this.member_number = member_number;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "MovieDto [actor_number=" + actor_number + ", actor_name=" + actor_name + ", basket_number="
				+ basket_number + ", cast_member_number=" + cast_member_number + ", director_number=" + director_number
				+ ", director_name=" + director_name + ", genre_number=" + genre_number + ", genre_name=" + genre_name
				+ ", heart_number=" + heart_number + ", heart_check=" + heart_check + ", line_review_number="
				+ line_review_number + ", line_review_context=" + line_review_context + ", movie_number=" + movie_number
				+ ", movie_title=" + movie_title + ", movie_summary=" + movie_summary + ", movie_release_date="
				+ movie_release_date + ", movie_runtime=" + movie_runtime + ", movie_price=" + movie_price
				+ ", movie_poster=" + movie_poster + ", movie_preview=" + movie_preview + ", order_history_number="
				+ order_history_number + ", order_history_time=" + order_history_time + ", prefer_genre_number="
				+ prefer_genre_number + ", prefer_genre_first=" + prefer_genre_first + ", prefer_genre_second="
				+ prefer_genre_second + ", prefer_genre_third=" + prefer_genre_third + ", rating_number="
				+ rating_number + ", rating_grade=" + rating_grade + ", watch_number=" + watch_number + ", watch_check="
				+ watch_check + ", member_number=" + member_number + ", member_id=" + member_id + "]";
	}
	
}
