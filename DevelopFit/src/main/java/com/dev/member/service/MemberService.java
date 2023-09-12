package com.dev.member.service;

import com.dev.member.dto.MemberDto;

	public interface MemberService {

	public MemberDto memberExist(String id, String password);
	
}
