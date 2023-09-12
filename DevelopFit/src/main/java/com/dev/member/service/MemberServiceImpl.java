package com.dev.member.service;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
