package com.dev.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.member.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public MemberDto memberExist(String memberId, String memberPassword) {
		// TODO Auto-generated method stub
		//HashMap으로 맵을 통해서 하나만 보내야 한다.
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("memberId", memberId);
		paramMap.put("memberPassword", memberPassword);
		
		return sqlSession.selectOne("com.dev.member.memberExist", paramMap);
	}


	@Override
	public void memberInsertOne(MemberDto memberDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.dev.member.memberInsertOne", memberDto);
	}


	@Override
	public MemberDto findId(String memberEmail, String memberPhoneNumber) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("memberEmail", memberEmail);
		paramMap.put("memberPhoneNumber", memberPhoneNumber);
		return sqlSession.selectOne("com.dev.member.findId", paramMap);
	}
	
	@Override
	public MemberDto findPw(String memberId, String memberEmail) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("memberId", memberId);
		paramMap.put("memberEmail", memberEmail);
		return sqlSession.selectOne("com.dev.member.findPw", paramMap);
	}


	@Override
	public int memberUpdateOne(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSession.update("com.dev.member.memberUpdateOne", memberDto);
	}


	@Override
	public List<MemberDto> memberSelectList(int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("com.dev.member.memberSelectList", map);
	}


	@Override
	public MemberDto memberSelectOne(int memberNumber) {
		// TODO Auto-generated method stub
		
		MemberDto memberDto = sqlSession.selectOne("com.dev.member.memberSelectOne",memberNumber);
		
		return memberDto;
	}


	@Override
	public int memberSelectTotalCount() {
		// TODO Auto-generated method stub
		return (int)sqlSession.selectOne("com.dev.member.memberSelectTotalCount");
	}


	@Override
	public int memberUpdateOne2(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSession.update("com.dev.member.memberUpdateOne2", memberDto);
	}


	@Override
	public int memberDeleteOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("com.dev.member.memberDeleteOne", no);
	}


	@Override
	public String idExist(String inputId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.dev.member.idExist", inputId);
	}


	@Override
	public String emailExist(String inputEmail) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.dev.member.emailExist", inputEmail);
	}


}
