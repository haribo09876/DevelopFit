package com.dev.member.dao;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dev.member.dto.MemberDto;

public interface MemberDao {

	public MemberDto memberExist(String memberId, String memberPassword);

	public void memberInsertOne(MemberDto memberDto);

	public MemberDto findId(String memberEmail, String memberPhoneNumber);

	MemberDto findPw(String memberId, String memberEmail);

	
}
