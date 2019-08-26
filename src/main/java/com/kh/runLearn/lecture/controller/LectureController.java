package com.kh.runLearn.lecture.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.runLearn.lecture.model.service.LectureService;

@Controller
public class LectureController {

	@Autowired
	private LectureService lService;

}
