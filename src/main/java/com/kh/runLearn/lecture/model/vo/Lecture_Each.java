package com.kh.runLearn.lecture.model.vo;

public class Lecture_Each {
	private int l_each_num;
	private String l_each_name;
	private String l_each_content;
	private String l_each_confirm;
	private int l_num;
	public Lecture_Each() {}
	public Lecture_Each(int l_each_num, String l_each_name, String l_each_content, String l_each_confirm, int l_num) {
		super();
		this.l_each_num = l_each_num;
		this.l_each_name = l_each_name;
		this.l_each_content = l_each_content;
		this.l_each_confirm = l_each_confirm;
		this.l_num = l_num;
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
	public String getL_each_confirm() {
		return l_each_confirm;
	}
	public void setL_each_confirm(String l_each_confirm) {
		this.l_each_confirm = l_each_confirm;
	}
	public int getL_num() {
		return l_num;
	}
	public void setL_num(int l_num) {
		this.l_num = l_num;
	}
	@Override
	public String toString() {
		return "Lecture_Each [l_each_num=" + l_each_num + ", l_each_name=" + l_each_name + ", l_each_content="
				+ l_each_content + ", l_each_confirm=" + l_each_confirm + ", l_num=" + l_num + "]";
	}
	
}
