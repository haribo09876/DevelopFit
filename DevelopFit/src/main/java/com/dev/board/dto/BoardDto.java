package com.dev.board.dto;

import java.util.Date;

public class BoardDto {
	
	private int board_number;
	private String board_title;
	private String board_content;
	private Date board_create_date;
	private int board_hit;
	private int member_number;
	
	public BoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardDto(int board_number, String board_title, String board_content,
			Date board_create_date, int board_hit, int member_number) {
		super();
		this.board_number = board_number;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_create_date = board_create_date;
		this.board_hit = board_hit;
		this.member_number = member_number;
	}

	public int getBoard_number() {
		return board_number;
	}

	public void setBoard_number(int board_number) {
		this.board_number = board_number;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Date getBoard_create_date() {
		return board_create_date;
	}

	public void setBoard_create_date(Date board_create_date) {
		this.board_create_date = board_create_date;
	}

	public int getBoard_hit() {
		return board_hit;
	}

	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}

	public int getMember_number() {
		return member_number;
	}

	public void setMember_number(int member_number) {
		this.member_number = member_number;
	}

	@Override
	public String toString() {
		return "BoardDto [board_number=" + board_number + ", member_id=" + ", board_title=" + board_title
				+ ", board_content=" + board_content + ", board_create_date=" + board_create_date + ", board_hit="
				+ board_hit + ", member_number=" + member_number + "]";
	}
	
	
	
	
	
	
	
}
