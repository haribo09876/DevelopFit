package com.dev.movie.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MovieDto {
	
	private int actorNumber;
	private String actorName;
	
	private int basketNumber;
	
	private int castMemberNumber;

	private int directorNumber;
	private String directorName;
	
	private int genreNumber;
	private String genreName;
	
	private int heartNumber;
	private String heartCheck;
	
	private int lineReviewNumber;
	private String lineReviewContext;
		
	private int movieNumber;
	private String movieTitle;
	private String movieSummary;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date movieReleaseDate;
	private String movieRuntime;
	private int moviePrice;
	private String moviePoster;
	private String moviePreview;
	
	private int orderHistoryNumber;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orderHistoryTime;
	
	private int preferGenreNumber;
	private String preferGenreFirst;
	private String preferGenreSecond;
	private String preferGenreThird;
	
	private int ratingNumber;
	private int ratingGrade;
	
	private int watchNumber;
	private String watchCheck;
	
	private int memberNumber;
	private String memberId;
	
	public MovieDto() {
		super();
	}

	public MovieDto(int actorNumber, String actorName, int basketNumber, int castMemberNumber, int directorNumber,
			String directorName, int genreNumber, String genreName, int heartNumber, String heartCheck,
			int lineReviewNumber, String lineReviewContext, int movieNumber, String movieTitle, String movieSummary,
			Date movieReleaseDate, String movieRuntime, int moviePrice, String moviePoster, String moviePreview,
			int orderHistoryNumber, Date orderHistoryTime, int preferGenreNumber, String preferGenreFirst,
			String preferGenreSecond, String preferGenreThird, int ratingNumber, int ratingGrade, int watchNumber,
			String watchCheck, int memberNumber, String memberId) {
		super();
		this.actorNumber = actorNumber;
		this.actorName = actorName;
		this.basketNumber = basketNumber;
		this.castMemberNumber = castMemberNumber;
		this.directorNumber = directorNumber;
		this.directorName = directorName;
		this.genreNumber = genreNumber;
		this.genreName = genreName;
		this.heartNumber = heartNumber;
		this.heartCheck = heartCheck;
		this.lineReviewNumber = lineReviewNumber;
		this.lineReviewContext = lineReviewContext;
		this.movieNumber = movieNumber;
		this.movieTitle = movieTitle;
		this.movieSummary = movieSummary;
		this.movieReleaseDate = movieReleaseDate;
		this.movieRuntime = movieRuntime;
		this.moviePrice = moviePrice;
		this.moviePoster = moviePoster;
		this.moviePreview = moviePreview;
		this.orderHistoryNumber = orderHistoryNumber;
		this.orderHistoryTime = orderHistoryTime;
		this.preferGenreNumber = preferGenreNumber;
		this.preferGenreFirst = preferGenreFirst;
		this.preferGenreSecond = preferGenreSecond;
		this.preferGenreThird = preferGenreThird;
		this.ratingNumber = ratingNumber;
		this.ratingGrade = ratingGrade;
		this.watchNumber = watchNumber;
		this.watchCheck = watchCheck;
		this.memberNumber = memberNumber;
		this.memberId = memberId;
	}

	public int getActorNumber() {
		return actorNumber;
	}

	public void setActorNumber(int actorNumber) {
		this.actorNumber = actorNumber;
	}

	public String getActorName() {
		return actorName;
	}

	public void setActorName(String actorName) {
		this.actorName = actorName;
	}

	public int getBasketNumber() {
		return basketNumber;
	}

	public void setBasketNumber(int basketNumber) {
		this.basketNumber = basketNumber;
	}

	public int getCastMemberNumber() {
		return castMemberNumber;
	}

	public void setCastMemberNumber(int castMemberNumber) {
		this.castMemberNumber = castMemberNumber;
	}

	public int getDirectorNumber() {
		return directorNumber;
	}

	public void setDirectorNumber(int directorNumber) {
		this.directorNumber = directorNumber;
	}

	public String getDirectorName() {
		return directorName;
	}

	public void setDirectorName(String directorName) {
		this.directorName = directorName;
	}

	public int getGenreNumber() {
		return genreNumber;
	}

	public void setGenreNumber(int genreNumber) {
		this.genreNumber = genreNumber;
	}

	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}

	public int getHeartNumber() {
		return heartNumber;
	}

	public void setHeartNumber(int heartNumber) {
		this.heartNumber = heartNumber;
	}

	public String getHeartCheck() {
		return heartCheck;
	}

	public void setHeartCheck(String heartCheck) {
		this.heartCheck = heartCheck;
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

	public int getMovieNumber() {
		return movieNumber;
	}

	public void setMovieNumber(int movieNumber) {
		this.movieNumber = movieNumber;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getMovieSummary() {
		return movieSummary;
	}

	public void setMovieSummary(String movieSummary) {
		this.movieSummary = movieSummary;
	}

	public Date getMovieReleaseDate() {
		return movieReleaseDate;
	}

	public void setMovieReleaseDate(Date movieReleaseDate) {
		this.movieReleaseDate = movieReleaseDate;
	}

	public String getMovieRuntime() {
		return movieRuntime;
	}

	public void setMovieRuntime(String movieRuntime) {
		this.movieRuntime = movieRuntime;
	}

	public int getMoviePrice() {
		return moviePrice;
	}

	public void setMoviePrice(int moviePrice) {
		this.moviePrice = moviePrice;
	}

	public String getMoviePoster() {
		return moviePoster;
	}

	public void setMoviePoster(String moviePoster) {
		this.moviePoster = moviePoster;
	}

	public String getMoviePreview() {
		return moviePreview;
	}

	public void setMoviePreview(String moviePreview) {
		this.moviePreview = moviePreview;
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

	public int getPreferGenreNumber() {
		return preferGenreNumber;
	}

	public void setPreferGenreNumber(int preferGenreNumber) {
		this.preferGenreNumber = preferGenreNumber;
	}

	public String getPreferGenreFirst() {
		return preferGenreFirst;
	}

	public void setPreferGenreFirst(String preferGenreFirst) {
		this.preferGenreFirst = preferGenreFirst;
	}

	public String getPreferGenreSecond() {
		return preferGenreSecond;
	}

	public void setPreferGenreSecond(String preferGenreSecond) {
		this.preferGenreSecond = preferGenreSecond;
	}

	public String getPreferGenreThird() {
		return preferGenreThird;
	}

	public void setPreferGenreThird(String preferGenreThird) {
		this.preferGenreThird = preferGenreThird;
	}

	public int getRatingNumber() {
		return ratingNumber;
	}

	public void setRatingNumber(int ratingNumber) {
		this.ratingNumber = ratingNumber;
	}

	public int getRatingGrade() {
		return ratingGrade;
	}

	public void setRatingGrade(int ratingGrade) {
		this.ratingGrade = ratingGrade;
	}

	public int getWatchNumber() {
		return watchNumber;
	}

	public void setWatchNumber(int watchNumber) {
		this.watchNumber = watchNumber;
	}

	public String getWatchCheck() {
		return watchCheck;
	}

	public void setWatchCheck(String watchCheck) {
		this.watchCheck = watchCheck;
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

	@Override
	public String toString() {
		return "MovieDto [actorNumber=" + actorNumber + ", actorName=" + actorName + ", basketNumber=" + basketNumber
				+ ", castMemberNumber=" + castMemberNumber + ", directorNumber=" + directorNumber + ", directorName="
				+ directorName + ", genreNumber=" + genreNumber + ", genreName=" + genreName + ", heartNumber="
				+ heartNumber + ", heartCheck=" + heartCheck + ", lineReviewNumber=" + lineReviewNumber
				+ ", lineReviewContext=" + lineReviewContext + ", movieNumber=" + movieNumber + ", movieTitle="
				+ movieTitle + ", movieSummary=" + movieSummary + ", movieReleaseDate=" + movieReleaseDate
				+ ", movieRuntime=" + movieRuntime + ", moviePrice=" + moviePrice + ", moviePoster=" + moviePoster
				+ ", moviePreview=" + moviePreview + ", orderHistoryNumber=" + orderHistoryNumber
				+ ", orderHistoryTime=" + orderHistoryTime + ", preferGenreNumber=" + preferGenreNumber
				+ ", preferGenreFirst=" + preferGenreFirst + ", preferGenreSecond=" + preferGenreSecond
				+ ", preferGenreThird=" + preferGenreThird + ", ratingNumber=" + ratingNumber + ", ratingGrade="
				+ ratingGrade + ", watchNumber=" + watchNumber + ", watchCheck=" + watchCheck + ", memberNumber="
				+ memberNumber + ", memberId=" + memberId + "]";
	}
}