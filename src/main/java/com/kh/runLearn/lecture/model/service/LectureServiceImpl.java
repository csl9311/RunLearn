package com.kh.runLearn.lecture.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.lecture.model.dao.LectureDAO;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.lecture.model.vo.Lecture_Each;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int acceptLecture(int l_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int notAcceptLecture(int l_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int permissionLecture(Lecture l) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePermissionLecture(Lecture l) {
		// TODO Auto-generated method stub
		return 0;
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
	public int insertLecture(Lecture l) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateLecture(Lecture l) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteLecture(int l_num) {
		// TODO Auto-generated method stub
		return 0;
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteLecture(Lecture_Each le) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertLecture_Image(Lecture_Image li) {
		return lDAO.insertLecture_Image(li);
	}

	@Override
	public int updateLecture_Image(Lecture_Image li) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertWishlist(Lecture l, String m_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteWishlist(int l_num, String m_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList selectLectureImage(HashMap<String, Integer> map) {
		return lDAO.selectLectureImage(map);
	}

	@Override
	public ArrayList<Lecture> selectLectureView(String userId) { //마이페이지 수강목록
		
		return lDAO.selectLectureView(userId);
	}
	
	@Override
	public int selectLectureCount(String userId) { // 마이페이지 수강목록 전체 수
		
		return lDAO.selectLetureCount(userId);
	}
	
	

	@Override
	public ArrayList<Lecture> selectNoPayLectureView(String userId) { // 마이페이지 강의찜 목록
	
		return lDAO.selectNoPayLectureView(userId);
	}

	@Override
	public int selectNopayLectureCount(String userId) {  // 마이페이지 강의 찜목록 전체 수 
		
		return lDAO.selectNopayLectureCount(userId);
	}


}
