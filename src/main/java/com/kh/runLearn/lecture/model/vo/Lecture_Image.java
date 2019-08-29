package com.kh.runLearn.lecture.model.vo;

import java.sql.Date;

public class Lecture_Image {
	private int l_image_num;
	private String l_origin_name;
	private String l_changed_name;
	private String l_file_path;
	private int l_file_level;
	private Date l_upload_date;
	private int l_num;
	
	public Lecture_Image() {}

	public Lecture_Image(int l_image_num, String l_origin_name, String l_changed_name, String l_file_path,
			int l_file_level, Date l_upload_date, int l_num) {
		super();
		this.l_image_num = l_image_num;
		this.l_origin_name = l_origin_name;
		this.l_changed_name = l_changed_name;
		this.l_file_path = l_file_path;
		this.l_file_level = l_file_level;
		this.l_upload_date = l_upload_date;
		this.l_num = l_num;
	}

	public int getL_image_num() {
		return l_image_num;
	}

	public void setL_image_num(int l_image_num) {
		this.l_image_num = l_image_num;
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

	public int getL_file_level() {
		return l_file_level;
	}

	public void setL_file_level(int l_file_level) {
		this.l_file_level = l_file_level;
	}

	public Date getL_upload_date() {
		return l_upload_date;
	}

	public void setL_uploaddate(Date l_upload_date) {
		this.l_upload_date = l_upload_date;
	}

	public int getL_num() {
		return l_num;
	}

	public void setL_num(int l_num) {
		this.l_num = l_num;
	}

	@Override
	public String toString() {
		return "LectureImage [l_image_num=" + l_image_num + ", l_origin_name=" + l_origin_name + ", l_changed_name="
				+ l_changed_name + ", l_file_path=" + l_file_path + ", l_file_level=" + l_file_level + ", l_uploaddate="
				+ l_upload_date + ", l_num=" + l_num + "]";
	}
	
}
