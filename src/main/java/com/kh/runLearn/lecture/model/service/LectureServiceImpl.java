package com.kh.runLearn.lecture.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.lecture.model.dao.LectureDAO;

@Service("lService")
public class LectureServiceImpl implements LectureService {
	@Autowired
	private LectureDAO lDAO;
}
