package com.kh.runLearn.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;

@Repository("mDAO")
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int updateMember(Member m) { //정보 수정
		
		return sqlSession.update("memberMapper.updateMember", m);
	}

	
}
