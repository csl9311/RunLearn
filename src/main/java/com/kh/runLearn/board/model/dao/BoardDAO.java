package com.kh.runLearn.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runLearn.board.model.vo.Board;
import com.kh.runLearn.common.PageInfo;

@Repository("bDAO")
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount(String b_category) {
		return sqlSession.selectOne("boardMapper.getListCount", b_category);
	}

	public ArrayList<Board> selectBoardList(PageInfo pi, String b_category) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardList", b_category, rowBounds);
	}
}
