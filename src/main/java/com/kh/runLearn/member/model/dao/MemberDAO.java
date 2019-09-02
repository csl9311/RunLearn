package com.kh.runLearn.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mDAO")
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int checkId(String id) {

		System.out.println(id);
		return sqlSession.selectOne("memberMapper.checkId",id);
	}
}
