package com.kh.runLearn.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectAllMember(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 계산법 현재페이지가 1이면 0
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return null;//추후 수정예정
	}
	
}
