package com.kh.runLearn.lecture.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.lecture.model.vo.Lecture;

@Repository("lDAO")
public class LectureDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		return sqlSession.selectOne("lectureMapper.getListCount");
	}
	
	public ArrayList<Lecture> getLectureList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("lectureMapper.selectLectureList", null, rowBounds);
	}

	public int getCategoryListCount(String l_category) {
		return sqlSession.selectOne("lectureMapper.getCategoryListCount", l_category);
	}

	public ArrayList<Lecture> selectLectureList(PageInfo pi, String l_category) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("lectureMapper.selectLectureCategoryList", l_category, rowBounds);
	}


	

	
}
