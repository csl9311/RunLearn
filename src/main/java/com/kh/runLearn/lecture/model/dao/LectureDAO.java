package com.kh.runLearn.lecture.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.lecture.model.vo.Lecture_Each;
import com.kh.runLearn.lecture.model.vo.Lecture_File;
import com.kh.runLearn.lecture.model.vo.Lecture_Image;

@Repository("lDAO")
public class LectureDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("lectureMapper.getListCount");
	}

	public ArrayList getLectureList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("lectureMapper.selectLectureList", null, rowBounds);
	}

	public int getCategoryListCount(String l_category) {
		return sqlSession.selectOne("lectureMapper.getCategoryListCount", l_category);
	}

	public ArrayList selectLectureList(PageInfo pi, String l_category) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("lectureMapper.selectLectureCategoryList", l_category, rowBounds);
	}

//	public ArrayList selectLecture(int l_num) {
//		return (ArrayList)sqlSession.selectList("lectureMapper.selectLecture", l_num);
//	}
	public HashMap<String, String> selectLecture(int l_num) {
		return (HashMap) sqlSession.selectOne("lectureMapper.selectLecture", l_num);
	}

//	public ArrayList selectLectureImage(int i) {
//		return (ArrayList)sqlSession.selectList("lectureMapper.selectLectureImage", i);
//	}

	public ArrayList selectLectureImage(HashMap<String, Integer> map) {
		return (ArrayList) sqlSession.selectList("lectureMapper.selectLectureImage", map);
	}

	public Lecture_Each classEnter(HashMap<String, Integer> map) {
		return sqlSession.selectOne("lectureMapper.classEnter", map);
	}

	public ArrayList classList(int l_num) {
		return (ArrayList) sqlSession.selectList("lectureMapper.classList", l_num);
	}

	public HashMap<String, Object> mediaEnter(int l_each_num) {
		return sqlSession.selectOne("lectureMapper.mediaEnter", l_each_num);
	}

	public int permissionLecture(Lecture l) {
		return sqlSession.insert("lectureMapper.permissionLecture", l);
	}

	public int insertLecture_Image(Lecture_Image li) {
		return sqlSession.insert("lectureMapper.insertLecture_Image", li);
	}

	public int insertLecture_cImage(Lecture_Image li) {
		return sqlSession.insert("lectureMapper.insertLecture_cImage", li);
	}

	public int insertLectureFile(Lecture_File lf) {
		return sqlSession.insert("lectureMapper.insertLectureFile", lf);
	}

	public int insertLecture(Lecture_Each le) {
		return sqlSession.insert("lectureMapper.insertLecture", le);
	}

	// home.jsp에 최신강의 조회
	public ArrayList<Map<String, String>> selectNewLectureList() {
		return (ArrayList) sqlSession.selectList("lectureMapper.selectNewLectureList");
	}
	public int updateLecture_Image(Lecture_Image li) {
		return sqlSession.update("lectureMapper.updateLecture_Image", li);
	}

	public int openSeq() {
		return sqlSession.selectOne("lectureMapper.openSeq");
	}

	public int findValue() {
		return sqlSession.selectOne("lectureMapper.findValue");
	}

	public int dropLectureImage(HashMap<String, Integer> map) {
		return sqlSession.delete("lectureMapper.dropLectureImage", map);
	}

	public int updateLecture(Lecture l) {
		return sqlSession.update("lectureMapper.updateLecture", l);
	}

	public int confirmLecture(int l_num) {
		return sqlSession.update("lectureMapper.confirmLecture", l_num);
	}

	public int denyLecture(int l_num) {
		return sqlSession.update("lectureMapper.denyLecture", l_num);
	}

	public ArrayList deleteLecture(int l_num) {
		return (ArrayList)sqlSession.selectList("lectureMapper.deleteLecture", l_num);
	}

	public int deleteLectureImage(int l_num) {
		return sqlSession.delete("lectureMapper.deleteLectureImage", l_num);
	}

	public ArrayList<Lecture_Image> selectHotLectureList() {
		return (ArrayList) sqlSession.selectList("lectureMapper.selectHotLectureList");
	}

	public Lecture_File selectLectureFile(int l_each_num) {
		return sqlSession.selectOne("lectureMapper.selectLectureFile", l_each_num);
	}
}
