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

	public int checkId(String id) {
		return sqlSession.selectOne("memberMapper.checkId",id);
	}

	public int checkNick(String nick) {
		return sqlSession.selectOne("memberMapper.checkNick",nick);
	}

	public int insertMember_Image(Member_Image mi) {
		return sqlSession.insert("memberMapper.insertMemberImg",mi);
	}

	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}
	
	public Member login(Member m) {
		return sqlSession.selectOne("memberMapper.login",m);
	}

	public int checkPhone(Member m) {
		return sqlSession.selectOne("memberMapper.checkPhone",m);
	}
}
