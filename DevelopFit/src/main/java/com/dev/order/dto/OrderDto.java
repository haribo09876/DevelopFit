package com.dev.order.dto;

import java.util.Date;

public class OrderDto {
	
	int memberNumber;
	String memberId;
	int memberMoney;
	String movieTitle;
	int movieNumber;
	String movieSummary;
	String movieRuntime;
	Date movieReleaseDate;
	String moviePrice;
	String moviePoster;
	int orderHistoryNumber;
	Date orderHistoryTime;
	
	
	public OrderDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public OrderDto(int memberNumber, String memberId, int memberMoney, String movieTitle, int movieNumber,
			String movieSummary, String movieRuntime, Date movieReleaseDate, String moviePrice, String moviePoster,
			int orderHistoryNumber, Date orderHistoryTime) {
		super();
		this.memberNumber = memberNumber;
		this.memberId = memberId;
		this.memberMoney = memberMoney;
		this.movieTitle = movieTitle;
		this.movieNumber = movieNumber;
		this.movieSummary = movieSummary;
		this.movieRuntime = movieRuntime;
		this.movieReleaseDate = movieReleaseDate;
		this.moviePrice = moviePrice;
		this.moviePoster = moviePoster;
		this.orderHistoryNumber = orderHistoryNumber;
		this.orderHistoryTime = orderHistoryTime;
	}


	public int getMemberNumber() {
		return memberNumber;
	}


	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public int getMemberMoney() {
		return memberMoney;
	}


	public void setMemberMoney(int memberMoney) {
		this.memberMoney = memberMoney;
	}


	public String getMovieTitle() {
		return movieTitle;
	}


	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}


	public int getMovieNumber() {
		return movieNumber;
	}


	public void setMovieNumber(int movieNumber) {
		this.movieNumber = movieNumber;
	}


	public String getMovieSummary() {
		return movieSummary;
	}


	public void setMovieSummary(String movieSummary) {
		this.movieSummary = movieSummary;
	}


	public String getMovieRuntime() {
		return movieRuntime;
	}


	public void setMovieRuntime(String movieRuntime) {
		this.movieRuntime = movieRuntime;
	}


	public Date getMovieReleaseDate() {
		return movieReleaseDate;
	}


	public void setMovieReleaseDate(Date movieReleaseDate) {
		this.movieReleaseDate = movieReleaseDate;
	}


	public String getMoviePrice() {
		return moviePrice;
	}


	public void setMoviePrice(String moviePrice) {
		this.moviePrice = moviePrice;
	}


	public String getMoviePoster() {
		return moviePoster;
	}


	public void setMoviePoster(String moviePoster) {
		this.moviePoster = moviePoster;
	}


	public int getOrderHistoryNumber() {
		return orderHistoryNumber;
	}


	public void setOrderHistoryNumber(int orderHistoryNumber) {
		this.orderHistoryNumber = orderHistoryNumber;
	}


	public Date getOrderHistoryTime() {
		return orderHistoryTime;
	}


	public void setOrderHistoryTime(Date orderHistoryTime) {
		this.orderHistoryTime = orderHistoryTime;
	}


	@Override
	public String toString() {
		return "OrderDto [memberNumber=" + memberNumber + ", memberId=" + memberId + ", memberMoney=" + memberMoney
				+ ", movieTitle=" + movieTitle + ", movieNumber=" + movieNumber + ", movieSummary=" + movieSummary
				+ ", movieRuntime=" + movieRuntime + ", movieReleaseDate=" + movieReleaseDate + ", moviePrice="
				+ moviePrice + ", moviePoster=" + moviePoster + ", orderHistoryNumber=" + orderHistoryNumber
				+ ", orderHistoryTime=" + orderHistoryTime + "]";
	}
	
}
