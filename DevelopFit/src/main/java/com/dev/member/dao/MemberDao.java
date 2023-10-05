package com.dev.member.dao;



import java.util.List;

import com.dev.member.dto.MemberDto;

public interface MemberDao {
	
	public String idExist(String inputId);

	public String emailExist(String inputEmail);
	
	public MemberDto memberExist(String memberId, String memberPassword);

	public void memberInsertOne(MemberDto memberDto);

	public MemberDto findId(String memberEmail, String memberPhoneNumber);

	MemberDto findPw(String memberId, String memberEmail);

	public int memberUpdateOne(MemberDto memberDto);
	
	public int memberSelectTotalCount();

	public List<MemberDto> memberSelectList(int start, int end);

	public MemberDto memberSelectOne(int memberNumber);

	public int memberUpdateOne2(MemberDto memberDto);

	public int memberDeleteOne(int no);

	
}
