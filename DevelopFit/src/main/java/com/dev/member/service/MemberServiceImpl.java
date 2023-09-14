package com.dev.member.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dev.member.dao.MemberDao;
import com.dev.member.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{

	private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	public MemberDao memberDao;

	@Override
	public MemberDto memberExist(String id, String password) {
		// TODO Auto-generated method stub
		return memberDao.memberExist(id, password);
	}

	@Override
	public void memberInsertOne(MemberDto memberDto) throws Exception {
		// TODO Auto-generated method stub
		//회원추가는 동일하게 두면 된다.
		memberDao.memberInsertOne(memberDto);
	}

	@Override
	public MemberDto findId(String memberEmail, String memberPhoneNumber) {
		// TODO Auto-generated method stub
		return memberDao.findId(memberEmail, memberPhoneNumber);
	}

	@Override
	public MemberDto findPw(String memberId, String memberEmail) {
		// TODO Auto-generated method stub
		return memberDao.findPw(memberId, memberEmail);
	}
	
}
