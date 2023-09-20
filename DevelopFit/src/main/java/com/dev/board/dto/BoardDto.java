package com.dev.board.dto;

import java.util.Date;

public class BoardDto {
	
	private int boardNumber;
	private String boardTitle;
	private String boardContent;
	private Date boardCreateDate;
	private int boardHit;
	private String memberId;
	private int memberNumber;
//	private int commentNumber;
//	private String commentContent;
//	private Date commentCreateDate;
	
	public BoardDto() {
		super();
	}

	public BoardDto(int boardNumber, String boardTitle, String boardContent, Date boardCreateDate, int boardHit,
			String memberId, int memberNumber, int commentNumber, String commentContent, Date commentCreateDate) {
		super();
		this.boardNumber = boardNumber;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCreateDate = boardCreateDate;
		this.boardHit = boardHit;
		this.memberId = memberId;
		this.memberNumber = memberNumber;
	}

	public int getBoardNumber() {
		return boardNumber;
	}

	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardCreateDate() {
		return boardCreateDate;
	}

	public void setBoardCreateDate(Date boardCreateDate) {
		this.boardCreateDate = boardCreateDate;
	}

	public int getBoardHit() {
		return boardHit;
	}

	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}


	@Override
	public String toString() {
		return "BoardDto [boardNumber=" + boardNumber + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardCreateDate=" + boardCreateDate + ", boardHit=" + boardHit + ", memberId=" + memberId
				+ ", memberNumber=" + memberNumber + ", commentNumber=" + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
