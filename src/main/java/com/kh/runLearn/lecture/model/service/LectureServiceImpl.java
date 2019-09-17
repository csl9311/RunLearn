package com.kh.runLearn.lecture.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.lecture.model.dao.LectureDAO;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.lecture.model.vo.Lecture_Each;
import com.kh.runLearn.lecture.model.vo.Lecture_File;
import com.kh.runLearn.lecture.model.vo.Lecture_Image;

@Service("lService")
public class LectureServiceImpl implements LectureService {
	@Autowired
	private LectureDAO lDAO;

	@Override
	public int getListCount() {
		return lDAO.getListCount();
	}

	@Override
	public int getCategoryListCount(String l_category) {
		return lDAO.getCategoryListCount(l_category);
	}

	@Override
	public ArrayList selectLectureList(PageInfo pi) {
		return lDAO.getLectureList(pi);
	}

	@Override
	public ArrayList selectLectureList(PageInfo pi, String l_category) {
		return lDAO.selectLectureList(pi, l_category);
	}

	@Override
	public ArrayList<Lecture> selectMyLectureList(PageInfo pi, String id) {
		return null;
	}

	@Override
	public int permissionLecture(Lecture l) {
		return lDAO.permissionLecture(l);
	}

//	@Override
//	public ArrayList selectLecture(int l_num) {
//		return lDAO.selectLecture(l_num);
//	}
	@Override
	public HashMap<String, String> selectLecture(int l_num) {
		return lDAO.selectLecture(l_num);
	}

	@Override
	public int updateLecture(Lecture l) {
		return lDAO.updateLecture(l);
	}

	@Override
	public Lecture_Each classEnter(HashMap<String, Integer> map) {
		return lDAO.classEnter(map);
	}

	@Override
	public ArrayList classList(int l_num) {
		return lDAO.classList(l_num);
	}

	@Override
	public HashMap<String, Object> mediaEnter(int l_each_num) {
		return lDAO.mediaEnter(l_each_num);
	}

	@Override
	public int insertLecture(Lecture_Each le) {
		return lDAO.insertLecture(le);
	}

	@Override
	public int deleteLecture(Lecture_Each le) {
		return 0;
	}

	@Override
	public int insertLecture_Image(Lecture_Image li) {
		return lDAO.insertLecture_Image(li);
	}

	@Override
	public int insertLecture_cImage(Lecture_Image li) {
		return lDAO.insertLecture_cImage(li);
	}
	
	@Override
	public int insertWishlist(Lecture l, String m_id) {
		return 0;
	}

	@Override
	public int deleteWishlist(int l_num, String m_id) {
		return 0;
	}

	@Override
	public ArrayList selectLectureImage(HashMap<String, Integer> map) {
		return lDAO.selectLectureImage(map);
	}



	// home.jsp에 최신강의 조회
	@Override
	public ArrayList<Map<String, String>> selectNewLectureList() {
		return lDAO.selectNewLectureList();
	}

	@Override
	public int insertLectureFile(Lecture_File lf) {
		return lDAO.insertLectureFile(lf);
	}
	
	@Override
	public int dropLectureImage(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return lDAO.dropLectureImage(map);
	}

	@Override
	public int findValue() {
		return lDAO.findValue();
	}

	@Override
	public int confirmLecture(int l_num) {
		return lDAO.confirmLecture(l_num);
	}

	@Override
	public int denyLecture(int l_num) {
		return lDAO.denyLecture(l_num);
	}

	@Override
	public ArrayList deleteLecture(int l_num) {
		return lDAO.deleteLecture(l_num);
	}

	@Override
	public int deleteLectureImage(int l_num) {
		return lDAO.deleteLectureImage(l_num);
	}

	@Override
	public Lecture_File selectLectureFile(int l_each_num) {
		return lDAO.selectLectureFile(l_each_num);
	}



}
