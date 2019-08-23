package com.kh.runLearn.payment.model.vo;

public class LecturePay {
	private int pay_num;
	private int lecture_num;
	
	public LecturePay() {}

	public LecturePay(int pay_num, int lecture_num) {
		super();
		this.pay_num = pay_num;
		this.lecture_num = lecture_num;
	}

	public int getPay_num() {
		return pay_num;
	}

	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}

	public int getLecture_num() {
		return lecture_num;
	}

	public void setLecture_num(int lecture_num) {
		this.lecture_num = lecture_num;
	}

	@Override
	public String toString() {
		return "LecturePay [pay_num=" + pay_num + ", lecture_num=" + lecture_num + "]";
	}
	
}
