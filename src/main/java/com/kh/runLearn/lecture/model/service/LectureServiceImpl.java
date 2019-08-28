package com.kh.runLearn.lecture.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.board.model.vo.PageInfo;
import com.kh.runLearn.lecture.model.dao.LectureDAO;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.lecture.model.vo.Lecture_Each;
import com.kh.runLearn.lecture.model.vo.Lecture_Image;

@Service("lService")
public class LectureServiceImpl implements LectureService {
	@Autowired
	private LectureDAO lDAO;

	
}
