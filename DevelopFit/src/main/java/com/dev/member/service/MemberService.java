package com.dev.member.service;



import java.util.List;
import java.util.Map;

import com.dev.member.dto.MemberDto;

public interface MemberService {
	
	public String idExist(String inputId);

	public String emailExist(String inputEmail);
	
	public MemberDto memberExist(String id, String password);

	public void memberInsertOne(MemberDto memberDto) throws Exception;

	public MemberDto findId(String memberEmail, String memberPhoneNumber);

	public MemberDto findPw(String memberId, String memberEmail);

	public void memberUpdateOne(MemberDto memberDto, String changeMemberPassword);

	public int memberSelectTotalCount();

	public List<MemberDto> memberSelectList(int start, int end);

	public Map<String, Object> memberSelectOne(int memberNumber);

	public void memberUpdateOne2(MemberDto memberDto);

	public int memberDeleteOne(int no);

}
