package com.dev.member.dto;
	

import java.sql.Date;

//Bean Spec
public class MemberDto {
	
	int memberNumber;
	String memberId;
	String memberPassword;
	String memberName;
	String memberEmail;
	Date memberBirthDate;
	String memberPhoneNumber;
	int memberMoney;
	String memberGender;
	Date memberCreateDate;
	Date memberModifyDate;
	String preferGenreFirst;
	String preferGenreSecond;
	String preferGenreThird;
	
	
	
	public MemberDto() {
		super();
		// TODO Auto-generated constructor stub
	}



	public MemberDto(int memberNumber, String memberId, String memberPassword, String memberName, String memberEmail,
			Date memberBirthDate, String memberPhoneNumber, int memberMoney, String memberGender, Date memberCreateDate,
			Date memberModifyDate, String preferGenreFirst, String preferGenreSecond, String preferGenreThird) {
		super();
		this.memberNumber = memberNumber;
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberBirthDate = memberBirthDate;
		this.memberPhoneNumber = memberPhoneNumber;
		this.memberMoney = memberMoney;
		this.memberGender = memberGender;
		this.memberCreateDate = memberCreateDate;
		this.memberModifyDate = memberModifyDate;
		this.preferGenreFirst = preferGenreFirst;
		this.preferGenreSecond = preferGenreSecond;
		this.preferGenreThird = preferGenreThird;
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



	public String getMemberPassword() {
		return memberPassword;
	}



	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}



	public String getMemberName() {
		return memberName;
	}



	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}



	public String getMemberEmail() {
		return memberEmail;
	}



	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}



	public Date getMemberBirthDate() {
		return memberBirthDate;
	}



	public void setMemberBirthDate(Date memberBirthDate) {
		this.memberBirthDate = memberBirthDate;
	}



	public String getMemberPhoneNumber() {
		return memberPhoneNumber;
	}



	public void setMemberPhoneNumber(String memberPhoneNumber) {
		this.memberPhoneNumber = memberPhoneNumber;
	}



	public int getMemberMoney() {
		return memberMoney;
	}



	public void setMemberMoney(int memberMoney) {
		this.memberMoney = memberMoney;
	}



	public String getMemberGender() {
		return memberGender;
	}



	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}



	public Date getMemberCreateDate() {
		return memberCreateDate;
	}



	public void setMemberCreateDate(Date memberCreateDate) {
		this.memberCreateDate = memberCreateDate;
	}



	public Date getMemberModifyDate() {
		return memberModifyDate;
	}



	public void setMemberModifyDate(Date memberModifyDate) {
		this.memberModifyDate = memberModifyDate;
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



	@Override
	public String toString() {
		return "MemberDto [memberNumber=" + memberNumber + ", memberId=" + memberId + ", memberPassword="
				+ memberPassword + ", memberName=" + memberName + ", memberEmail=" + memberEmail + ", memberBirthDate="
				+ memberBirthDate + ", memberPhoneNumber=" + memberPhoneNumber + ", memberMoney=" + memberMoney
				+ ", memberGender=" + memberGender + ", memberCreateDate=" + memberCreateDate + ", memberModifyDate="
				+ memberModifyDate + ", preferGenreFirst=" + preferGenreFirst + ", preferGenreSecond="
				+ preferGenreSecond + ", preferGenreThird=" + preferGenreThird + "]";
	}
	
}