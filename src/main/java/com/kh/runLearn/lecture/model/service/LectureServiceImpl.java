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
import com.kh.runLearn.lecture.model.vo.Wishlist;

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
	public ArrayList tclassList(int l_num) {
		return lDAO.tclassList(l_num);
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
	public int insertLecture_Image(Lecture_Image li) {
		return lDAO.insertLecture_Image(li);
	}

	@Override
	public int insertLecture_cImage(Lecture_Image li) {
		return lDAO.insertLecture_cImage(li);
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

	// home.jsp에 인기강의 조회
	@Override
	public ArrayList<String> selectHotLecture() {
		return lDAO.selectHotLectureList();
	}
	
	@Override
	public Lecture_File selectLectureFile(int l_each_num) {
		return lDAO.selectLectureFile(l_each_num);
	}

	@Override
	public String findEachNum(int l_num) {
		return lDAO.findEachNum(l_num);
	}

	@Override
	public int updateLectureEach(Lecture_Each le) {
		return lDAO.updateLectureEach(le);
	}

	@Override
	public int updateLectureFile(Lecture_File lf) {
		return lDAO.updateLectureFile(lf);
	}

	@Override
	public int enableLectureEach(int l_each_num) {
		return lDAO.enableLectureEach(l_each_num);
	}

	@Override
	public ArrayList userPayCheck(HashMap<String, Object> check) {
		return lDAO.userPayCheck(check);
	}

	@Override
	public int insertWishlist(HashMap<String, Object> wish) {
		return lDAO.insertWishlist(wish);
	}

	@Override
	public Wishlist selectWishList(HashMap<String, Object> wish) {
		return lDAO.selectWishList(wish);
	}

	@Override
	public int deleteWishlist(HashMap<String, Object> wish) {
		return lDAO.deleteWishlist(wish);
	}

}
