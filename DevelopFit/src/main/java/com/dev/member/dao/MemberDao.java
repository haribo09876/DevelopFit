package com.dev.member.dao;



import com.dev.member.dto.MemberDto;

public interface MemberDao {

	public MemberDto memberExist(String memberId, String memberPassword);

	public void memberInsertOne(MemberDto memberDto);

	public MemberDto findId(String memberEmail, String memberPhoneNumber);

	MemberDto findPw(String memberId, String memberEmail);

	public int memberUpdateOne(MemberDto memberDto);


	
}
