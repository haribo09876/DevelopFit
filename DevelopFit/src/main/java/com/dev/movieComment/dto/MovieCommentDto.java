package com.dev.movieComment.dto;

public class MovieCommentDto {

	private int lineReviewNumber;
	private String lineReviewContext;
	private int memberNumber;
	private int movieNumber;
	private String memberId;
	private String movieTitle;
	
	public MovieCommentDto() {
		super();
	}

	public MovieCommentDto(int lineReviewNumber, String lineReviewContext, int memberNumber, int movieNumber,
			String memberId, String movieTitle) {
		super();
		this.lineReviewNumber = lineReviewNumber;
		this.lineReviewContext = lineReviewContext;
		this.memberNumber = memberNumber;
		this.movieNumber = movieNumber;
		this.memberId = memberId;
		this.movieTitle = movieTitle;
	}

	public int getLineReviewNumber() {
		return lineReviewNumber;
	}

	public void setLineReviewNumber(int lineReviewNumber) {
		this.lineReviewNumber = lineReviewNumber;
	}

	public String getLineReviewContext() {
		return lineReviewContext;
	}

	public void setLineReviewContext(String lineReviewContext) {
		this.lineReviewContext = lineReviewContext;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public int getMovieNumber() {
		return movieNumber;
	}

	public void setMovieNumber(int movieNumber) {
		this.movieNumber = movieNumber;
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

	@Override
	public String toString() {
		return "MovieCommentDto [lineReviewNumber=" + lineReviewNumber + ", lineReviewContext=" + lineReviewContext
				+ ", memberNumber=" + memberNumber + ", movieNumber=" + movieNumber + ", memberId=" + memberId
				+ ", movieTitle=" + movieTitle + "]";
	}
}