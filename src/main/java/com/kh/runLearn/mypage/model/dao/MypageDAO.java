package com.kh.runLearn.mypage.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;

@Repository("myDAO")
public class MypageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Map<String, String>> selectLectureView(String userId, PageInfo pi) { // 마이페이지 수강목록
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("mypageMapper.selectLectureView", userId, rowBounds);
	}

	
	
	public int selectLetureCount(String userId) { // 수강 목록 수
		
		return sqlSession.selectOne("mypageMapper.selectLetureCount", userId);
	}

	
	
	public ArrayList<Map<String, String>> selectNoPayLectureView(String userId, PageInfo pi) { // 마이페이지 강의 찜목록
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("mypageMapper.selectNoPayLectureView", userId, rowBounds);
	}

	
	
	public int selectNopayLectureCount(String userId) { // 강의 찜목록 수
		
		return sqlSession.selectOne("mypageMapper.selectNopayLectureCount", userId);
	}

	
	
	public ArrayList<Map<String, Object>> selectTuterLecturePageView(String userId, PageInfo pi) { // 튜터 목록
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			
		return (ArrayList)sqlSession.selectList("mypageMapper.selectTuterLecturePageView", userId, rowBounds);
	}

	
	public ArrayList<Map<String, String>> selectProductView(String userId, PageInfo pi) { // 상품 찜목록
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mypageMapper.selectProductView", userId, rowBounds);
	}

	
	public int selectPlistCount(String userId) { // 상품 찜목록 수
		
		return sqlSession.selectOne("mypageMapper.selectPlistCount", userId);
	}



	public int updateMember(Member m) {  // 회원정보 수정
		
		return sqlSession.update("mypageMapper.updateMember", m);
	}



	public int updateMember_Image(Member_Image mi) { // 회원 프로필 수정
	
		return sqlSession.update("mypageMapper.updateMember_Image", mi);
	}



	public Member_Image selectProfile(String userId) { // 프로필사진
		
		return sqlSession.selectOne("mypageMapper.selectProfile", userId);
	}



	public int tuterLectureCount(String userId) { // 튜터 페이지 강의 수
		
		return sqlSession.selectOne("mypageMapper.tuterLectureCount", userId);
	}



	public Lecture selectLecture(String userId) {
		
		return sqlSession.selectOne("mypageMapper.selectLecture", userId);
	}







	
	
	
}
