package com.kh.runLearn.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;

@Repository("mDAO")
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int updateMember(Member m) { //정보 수정
		
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int insertMemberImage(Member_Image mi) {
		
		return sqlSession.update("memberMapper.updateMemberImage",mi);
	}


	public ArrayList selectLectureMember(String userId) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectLetureMember", userId);
	}
	
	
	public ArrayList selectItemMember(String userId) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectItemMember", userId);
	}

	public int selectLectureCount(String userId) {
		
		return sqlSession.selectOne("memberMapper.selectLectureCount", userId);
	}

	public ArrayList<Lecture> selectNoPayLecture(String userId) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectNoPayLecture", userId);
	}

	public int selectNoPayLectureCount(String userId) {
		
		return sqlSession.selectOne("memberMapper.selectNoPayLectureCount", userId);
	}






}
