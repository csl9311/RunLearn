package com.kh.runLearn.lecture.model.vo;

public class Lecture_File {
	private int l_file_num;
	private String l_origin_name;
	private String l_changed_name;
	private String l_file_path;
	private String l_file_video;
	private int l_each_num;
	
	public Lecture_File() {}

	public Lecture_File(int l_file_num, String l_origin_name, String l_changed_name, String l_file_path,
			String l_file_video, int l_each_num) {
		super();
		this.l_file_num = l_file_num;
		this.l_origin_name = l_origin_name;
		this.l_changed_name = l_changed_name;
		this.l_file_path = l_file_path;
		this.l_file_video = l_file_video;
		this.l_each_num = l_each_num;
	}

	public int getL_file_num() {
		return l_file_num;
	}

	public void setL_file_num(int l_file_num) {
		this.l_file_num = l_file_num;
	}

	public String getL_origin_name() {
		return l_origin_name;
	}

	public void setL_origin_name(String l_origin_name) {
		this.l_origin_name = l_origin_name;
	}

	public String getL_changed_name() {
		return l_changed_name;
	}

	public void setL_changed_name(String l_changed_name) {
		this.l_changed_name = l_changed_name;
	}

	public String getL_file_path() {
		return l_file_path;
	}

	public void setL_file_path(String l_file_path) {
		this.l_file_path = l_file_path;
	}

	public String getL_file_video() {
		return l_file_video;
	}

	public void setL_file_video(String l_file_video) {
		this.l_file_video = l_file_video;
	}

	public int getL_each_num() {
		return l_each_num;
	}

	public void setL_each_num(int l_each_num) {
		this.l_each_num = l_each_num;
	}

	@Override
	public String toString() {
		return "Lecture_File [l_file_num=" + l_file_num + ", l_origin_name=" + l_origin_name + ", l_changed_name="
				+ l_changed_name + ", l_file_path=" + l_file_path + ", l_file_video=" + l_file_video + ", l_each_num="
				+ l_each_num + "]";
	}
	
	
}