package com.kh.runLearn.board.model.vo;

import java.sql.Date;

public class BoardImage {
	private String b_changed_name;
	private String b_origin_name;
	private String b_file_path;
	private Date b_upload_date;
	private int b_num;
	
	public BoardImage() {}

	public BoardImage(String b_changed_name, String b_origin_name, String b_file_path, Date b_upload_date, int b_num) {
		super();
		this.b_changed_name = b_changed_name;
		this.b_origin_name = b_origin_name;
		this.b_file_path = b_file_path;
		this.b_upload_date = b_upload_date;
		this.b_num = b_num;
	}

	public String getB_changed_name() {
		return b_changed_name;
	}

	public void setB_changed_name(String b_changed_name) {
		this.b_changed_name = b_changed_name;
	}

	public String getB_origin_name() {
		return b_origin_name;
	}

	public void setB_origin_name(String b_origin_name) {
		this.b_origin_name = b_origin_name;
	}

	public String getB_file_path() {
		return b_file_path;
	}

	public void setB_file_path(String b_file_path) {
		this.b_file_path = b_file_path;
	}

	public Date getB_upload_date() {
		return b_upload_date;
	}

	public void setB_upload_date(Date b_upload_date) {
		this.b_upload_date = b_upload_date;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	@Override
	public String toString() {
		return "BoardImage [b_changed_name=" + b_changed_name + ", b_origin_name=" + b_origin_name + ", b_file_path="
				+ b_file_path + ", b_upload_date=" + b_upload_date + ", b_num=" + b_num + "]";
	}
	
}
