package com.kh.runLearn.lecture.model.exception;

public class LectureException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	
	public LectureException() {}
	public LectureException(String msg) {
		super(msg);
	}
	
}
