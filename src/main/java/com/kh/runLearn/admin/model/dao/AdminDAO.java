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
	public int leaveUserCount() {//블랙 유저수 가지고 오기
		return sqlSession.selectOne("adminMapper.leaveUserCount");
	}
	public int adminUserCount() {//블랙 유저수 가지고 오기
		return sqlSession.selectOne("adminMapper.adminUserCount");
	}
	//회원수 조회 하는 부분 끝
	
	
	
	//내림
	public ArrayList<Member> allUserList(PageInfo pi) {//모든 유저 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserList", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListId(PageInfo pi) {//아이디 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserListId", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListNick(PageInfo pi) {//닉네임 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserList", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListEm(PageInfo pi) {//이메일 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserList", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListPh(PageInfo pi) {//폰 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserList", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListMD(PageInfo pi) {//수정일 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserList", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListG(PageInfo pi) {//등급 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserList", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListS(PageInfo pi) {//상태 유저 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserList", null, rowBounds); // arraylist로 형변환해주기
	}
	
	//오름
	public ArrayList<Member> allUserListR(PageInfo pi) {//모든 유저 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserList", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListIdR(PageInfo pi) {//아이디 유저 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserList", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListNickR(PageInfo pi) {//닉네임 유저 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserList", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListEmR(PageInfo pi) {//이메일 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserList", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListPhR(PageInfo pi) {//폰 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserList", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListMDR(PageInfo pi) {//수정일 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserList", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListGR(PageInfo pi) {//등급 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserList", null, rowBounds); // arraylist로 형변환해주기
	}
	public ArrayList<Member> allUserListSR(PageInfo pi) {//상태 정보 가지고 오기
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.allUserList", null, rowBounds); // arraylist로 형변환해주기
	}
	
	
	
	
	
	
	
	public int targetUserUpdate(Member m) {//유저 회원 정보 가져오
		System.out.println("dao"+m);
		return sqlSession.update("adminMapper.targetUserUpdate",m);
	}
	

}
