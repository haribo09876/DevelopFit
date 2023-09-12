package com.dev.member.dao;

import com.dev.member.dto.MemberDto;

public interface MemberDao {

	public MemberDto memberExist(String memberId, String memberPassword);
	
}
