package com.kh.runLearn.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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

		return (ArrayList) sqlSession.selectList("boardMapper.selectBoardList", b_category, rowBounds);
	}

	public void addReadCount(int b_num) {
		sqlSession.update("boardMapper.updateCount", b_num);
	}

	public Board selectBoard(int b_num) {
		return sqlSession.selectOne("boardMapper.selectBoard", b_num);
	}

	public int insertBoard(Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}
	
	public int deleteBoard(int b_num) {
		return sqlSession.update("boardMapper.deleteBoard", b_num);
	}
	
	public int updateBoard(Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	/* ---------------고객센터용---------------  */
	public ArrayList<HashMap<String, String>> selectCenterBoardList(Map<String, Object> map) {
		PageInfo pi = (PageInfo) map.get("pi");

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("boardMapper.selectCenterBoardList", map, rowBounds);
	}

	public int getCenterListCount(Map<String, Object> map) {
		return sqlSession.selectOne("boardMapper.getCenterListCount", map);
	}

}
