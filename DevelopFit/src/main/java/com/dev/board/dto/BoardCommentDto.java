package com.dev.board.dto;

import java.util.Date;

public class BoardCommentDto {
	
	private int commentNumber;
	private String commentContent;
	private Date commentCreateDate;
	private int boardNumber;
	private String memberId;
	private int memberNumber;
	
	public BoardCommentDto() {
		super();
	}

	public BoardCommentDto(int commentNumber, String commentContent, Date commentCreateDate, int boardNumber,
			String memberId, int memberNumber) {
		super();
		this.commentNumber = commentNumber;
		this.commentContent = commentContent;
		this.commentCreateDate = commentCreateDate;
		this.boardNumber = boardNumber;
		this.memberId = memberId;
		this.memberNumber = memberNumber;
	}

	public int getCommentNumber() {
		return commentNumber;
	}

	public void setCommentNumber(int commentNumber) {
		this.commentNumber = commentNumber;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Date getCommentCreateDate() {
		return commentCreateDate;
	}

	public void setCommentCreateDate(Date commentCreateDate) {
		this.commentCreateDate = commentCreateDate;
	}

	public int getBoardNumber() {
		return boardNumber;
	}

	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
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
		return "BoardCommentDto [commentNumber=" + commentNumber + ", commentContent=" + commentContent
				+ ", commentCreateDate=" + commentCreateDate + ", boardNumber=" + boardNumber + ", memberId=" + memberId
				+ ", memberNumber=" + memberNumber + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
