package com.dev.board.dto;

import java.util.Date;

public class CommentDto {
	
	private int boardNumber;
	private String memberId;
	private int memberNumber;
	private int commentNumber;
	private String commentContent;
	private Date commentCreateDate;
	
	public CommentDto() {
		super();
	}

	public CommentDto(int boardNumber, String boardTitle, String boardContent, Date boardCreateDate, int boardHit,
			String memberId, int memberNumber, int commentNumber, String commentContent, Date commentCreateDate) {
		super();
		this.boardNumber = boardNumber;
		this.memberId = memberId;
		this.memberNumber = memberNumber;
		this.commentNumber = commentNumber;
		this.commentContent = commentContent;
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

	@Override
	public String toString() {
		return "CommentDto [boardNumber=" + boardNumber + ", memberId=" + memberId + ", memberNumber=" + memberNumber
				+ ", commentNumber=" + commentNumber + ", commentContent=" + commentContent + ", commentCreateDate="
				+ commentCreateDate + "]";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
