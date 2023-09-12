package com.dev.member.dao;

import java.util.HashMap;

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
	

}
