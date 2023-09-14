package com.dev.order.dto;

import java.util.Date;

public class OrderDto {
	
	int memberNumber;
	int orderHistoryNumber;
	String memberId;
	String movieTitle;
	String moviePrice;
	String moviePoster;
	Date orderHistoryTime;
	
	
	
	public OrderDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public OrderDto(int memberNumber, int orderHistoryNumber, String memberId, String movieTitle, String moviePrice,
			String moviePoster, Date orderHistoryTime) {
		super();
		this.memberNumber = memberNumber;
		this.orderHistoryNumber = orderHistoryNumber;
		this.memberId = memberId;
		this.movieTitle = movieTitle;
		this.moviePrice = moviePrice;
		this.moviePoster = moviePoster;
		this.orderHistoryTime = orderHistoryTime;
	}

	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	public int getOrderHistoryNumber() {
		return orderHistoryNumber;
	}
	public void setOrderHistoryNumber(int orderHistoryNumber) {
		this.orderHistoryNumber = orderHistoryNumber;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
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
	public Date getOrderHistoryTime() {
		return orderHistoryTime;
	}
	public void setOrderHistoryTime(Date orderHistoryTime) {
		this.orderHistoryTime = orderHistoryTime;
	}
	
	
	
}
