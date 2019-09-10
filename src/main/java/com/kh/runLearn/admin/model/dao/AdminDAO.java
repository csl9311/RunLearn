package com.kh.runLearn.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.member.model.vo.Member;

@Repository("aDAO")
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int allUserCount() {//모든 유저수 가지고 오기
		return sqlSession.selectOne("adminMapper.allUserCount");
	}
	public int tuteeUserCount() {//튜티 유저수 가지고 오기
		return sqlSession.selectOne("adminMapper.tuteeUserCount");
	}
	public int tutorUserCount() {//튜터 유저수 가지고 오기
		return sqlSession.selectOne("adminMapper.tutorUserCount");
	}
	public int blackUserCount() {//블랙 유저수 가지고 오기
		return sqlSession.selectOne("adminMapper.blackUserCount");
	}
	//회원수 조회 하는 부분 끝
	
	
	

	public ArrayList<Member> allUserList(PageInfo pi) {//모든 유저 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserList", null, rowBounds); // arraylist로 형변환해주기
	}
	public int targetUserUpdate(Member m) {
		System.out.println("dao"+m);
		return sqlSession.update("adminMapper.targetUserUpdate",m);
	}
	

}
