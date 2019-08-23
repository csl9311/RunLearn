package com.kh.runLearn.lecture.model.vo;

public class LectureEach {
	private int l_each_num;
	private String l_each_name;
	private String l_each_content;
	private int l_code;
	public LectureEach() {}
	public LectureEach(int l_each_num, String l_each_name, String l_each_content, int l_code) {
		super();
		this.l_each_num = l_each_num;
		this.l_each_name = l_each_name;
		this.l_each_content = l_each_content;
		this.l_code = l_code;
	}
	public int getL_each_num() {
		return l_each_num;
	}
	public void setL_each_num(int l_each_num) {
		this.l_each_num = l_each_num;
	}
	public String getL_each_name() {
		return l_each_name;
	}
	public void setL_each_name(String l_each_name) {
		this.l_each_name = l_each_name;
	}
	public String getL_each_content() {
		return l_each_content;
	}
	public void setL_each_content(String l_each_content) {
		this.l_each_content = l_each_content;
	}
	public int getL_code() {
		return l_code;
	}
	public void setL_code(int l_code) {
		this.l_code = l_code;
	}
	@Override
	public String toString() {
		return "LectureEach [l_each_num=" + l_each_num + ", l_each_name=" + l_each_name + ", l_each_content="
				+ l_each_content + ", l_code=" + l_code + "]";
	}
	
}
