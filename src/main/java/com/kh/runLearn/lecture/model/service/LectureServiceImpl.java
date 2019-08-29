package com.kh.runLearn.lecture.model.service;

import java.util.ArrayList;

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
	public int getCategoryListCount(String l_category) {
		return lDAO.getCategoryListCount(l_category);
	}
	
	@Override
	public ArrayList<Lecture> selectLectureList(PageInfo pi) {
		return null;
	}

	@Override
	public ArrayList<Lecture> selectLectureList(PageInfo pi, String l_category) {
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

	@Override
	public Lecture selectLecture(int l_num) {
		// TODO Auto-generated method stub
		return null;
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
	public Lecture_Each classEnter(int l_each_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Lecture_Each mediaEnter(int l_each_num) {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return 0;
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

	

	
}
