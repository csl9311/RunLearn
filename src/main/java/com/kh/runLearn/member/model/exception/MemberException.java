package com.kh.runLearn.member.model.exception;

public class MemberException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	
	public MemberException() {}
	public MemberException(String msg) {
		super(msg);
	}
	
}
