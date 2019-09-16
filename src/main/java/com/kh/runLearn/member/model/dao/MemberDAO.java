package com.kh.runLearn.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.lecture.model.vo.Lecture;
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
	
	public int checkPhone2(Member m) {
		return sqlSession.selectOne("memberMapper.checkPhone2",m);
	}
	
	public int checkEmail(Member m) {
		return sqlSession.selectOne("memberMapper.checkEmail",m);
	}

	public int checkEmail2(Member m) {
		return sqlSession.selectOne("memberMapper.checkEmail2",m);
	}
	
	public int checkEmailo(String m_email) {
		return sqlSession.selectOne("memberMapper.checkEmailo",m_email);
	}
	
	public String checkPw(String id) {
		return sqlSession.selectOne("memberMapper.selectPw", id);
	}
	
	public Member findMember(Member m) {
		return sqlSession.selectOne("memberMapper.findMember", m);
	}
	
	public int pwChange(Member m) {
		return sqlSession.update("memberMapper.pwChange", m);
	}
	
	public Member_Image findMemberImg(Member m) {
		return sqlSession.selectOne("memberMapper.findImage", m);
	}
	
	 public int getAllUserCount() {//회원수 가지고오기
	      return sqlSession.selectOne("memberMapper.getAllUserCount");
	   }

	public ArrayList<Member> selectAllMember(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectAllMember", null, rowBounds); // arraylist로 형변환해주기
	}

	
	public int updateMember(Member m) { //정보 수정
		
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int updateMember_Image(Member_Image mi) { //프로필 수정
		
		return sqlSession.update("memberMapper.updateMember_Image", mi);
	}

}
