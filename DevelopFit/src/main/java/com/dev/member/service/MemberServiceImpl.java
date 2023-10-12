package com.dev.member.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public void memberUpdateOne(MemberDto memberDto, String changeMemberPassword) {
		// TODO Auto-generated method stub
		memberDao.memberUpdateOne(memberDto, changeMemberPassword);
	}

	@Override
	public int memberSelectTotalCount() {
		// TODO Auto-generated method stub
		return memberDao.memberSelectTotalCount();
	}

	@Override
	public List<MemberDto> memberSelectList(int start, int end) {
		// TODO Auto-generated method stub
		return memberDao.memberSelectList(start, end);
	}

	@Override
	public Map<String, Object> memberSelectOne(int memberNumber) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		MemberDto memberDto = memberDao.memberSelectOne(memberNumber);
		resultMap.put("memberDto", memberDto);
		
		return resultMap;
	}

	@Override
	public void memberUpdateOne2(MemberDto memberDto) {
		// TODO Auto-generated method stub
		memberDao.memberUpdateOne2(memberDto);
	}

	@Override
	public int memberDeleteOne(int no) {
		// TODO Auto-generated method stub
		return memberDao.memberDeleteOne(no);
	}

	@Override
	public String idExist(String inputId) {
		// TODO Auto-generated method stub
		return memberDao.idExist(inputId);
	}

	@Override
	public String emailExist(String inputEmail) {
		// TODO Auto-generated method stub
		return memberDao.emailExist(inputEmail);
	}
	
}
