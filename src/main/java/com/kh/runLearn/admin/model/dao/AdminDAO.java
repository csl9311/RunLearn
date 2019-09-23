package com.kh.runLearn.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runLearn.board.model.vo.Board;
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
	public int leaveUserCount() {//블랙 유저수 가지고 오기
		return sqlSession.selectOne("adminMapper.leaveUserCount");
	}
	public int adminUserCount() {//블랙 유저수 가지고 오기
		return sqlSession.selectOne("adminMapper.adminUserCount");
	}
	public int modifyUserCount() {//금일 수정한 유저수 가지고 오기
		return sqlSession.selectOne("adminMapper.modifyUserCount");
	}
	public int createUserCount() {//금일 가입한 유저수 가지고 오기
		return sqlSession.selectOne("adminMapper.createUserCount");
	}
	//회원수 조회 하는 부분 끝
	
	
	

	public ArrayList<Member> allUserList(PageInfo pi) {//모든 유저 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserList", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListtee(PageInfo pi) {//
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserListtee", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListtor(PageInfo pi) {//
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserListtor", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListbl(PageInfo pi) {//
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserListbl", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListM(PageInfo pi) {//
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserListM", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListY(PageInfo pi) {//
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserListY", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListN(PageInfo pi) {//
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserListN", null, rowBounds); // arraylist로 형변환해주기
	}
	
	public ArrayList<Member> adminUserSearchId(String search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.searchId", search, rowBounds); // arraylist로 형변환해주기
	}
	
//	public ArrayList<Member> searchId(String search, PageInfo pi) {//이이디 검색 정보 가지고 오기
//		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
//	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		return (ArrayList)sqlSession.selectList("adminMapper.searchId", search, rowBounds); // arraylist로 형변환해주기
//	}
	
	
	
	
	
	
	public int targetUserUpdate(Member m) {//유저 회원 정보 수정

		return sqlSession.update("adminMapper.targetUserUpdate",m);
	}
	
	////////////Board
	public ArrayList<Board> boardList(PageInfo pi) {//모든 보드 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.boardList", null, rowBounds); // arraylist로 형변환해주기
	}
	public int boardListCount() {//보드리스트 카운트  가지고 오기
		return sqlSession.selectOne("adminMapper.boardListCount");
	}
	public int boardListCountNot() {//보드리스트 카운트  가지고 오기
		return sqlSession.selectOne("adminMapper.boardListCountNot");
	}
	public int boardListCountQe() {//보드리스트 카운트  가지고 오기
		return sqlSession.selectOne("adminMapper.boardListCountQe");
	}
	public int boardListCountSug() {//보드리스트 카운트  가지고 오기
		return sqlSession.selectOne("adminMapper.boardListCountSug");
	}
	public int boardListCountDecl() {//보드리스트 카운트  가지고 오기
		return sqlSession.selectOne("adminMapper.boardListCountDecl");
	}
	public int boardListCountA() {
		return sqlSession.selectOne("adminMapper.boardListCountA");
	}
	public ArrayList<Board> boardListA(PageInfo pi) {
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.boardListA", null, rowBounds); // arraylist로 형변환해주기
	}
	public int addReadCount(int bId) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateCount",bId);
	}
	public Board selectBoard(int bId) {
		// TODO Auto-generated method stub

		return sqlSession.selectOne("adminMapper.selectBoard",bId);
	}
	public int insertBoard(Board b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminMapper.insertBoard",b);
	}
	public int targetTrBDelete(Board b) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.targetTrBDelete",b);
	}
	public ArrayList applylectureList(PageInfo pi) {
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.applylectureList", null, rowBounds);
	}
	public int applyLectureCount() {
		return sqlSession.selectOne("adminMapper.applyListCount");
	}
	
	
	

}
