package com.dev.member.service;



import com.dev.member.dto.MemberDto;

	public interface MemberService {

	public MemberDto memberExist(String id, String password);

	public void memberInsertOne(MemberDto memberDto) throws Exception;

	public MemberDto findId(String memberEmail, String memberPhoneNumber);

	public MemberDto findPw(String memberId, String memberEmail);

	public void memberUpdateOne(MemberDto memberDto);


	
}
