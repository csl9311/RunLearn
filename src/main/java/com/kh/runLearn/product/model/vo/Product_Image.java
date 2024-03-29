package com.kh.runLearn.product.model.vo;

import java.sql.Date;

public class Product_Image {
	private String p_changed_name;
	private String p_origin_name;
	private Date p_upload_date;
	private int p_file_level;
	private int p_num;

	public Product_Image() {
	}

	public Product_Image(String p_changed_name, String p_origin_name, Date p_upload_date, int p_file_level, int p_num) {
		super();
		this.p_changed_name = p_changed_name;
		this.p_origin_name = p_origin_name;
		this.p_upload_date = p_upload_date;
		this.p_file_level = p_file_level;
		this.p_num = p_num;
	}

	public String getP_changed_name() {
		return p_changed_name;
	}

	public void setP_changed_name(String p_changed_name) {
		this.p_changed_name = p_changed_name;
	}

	public String getP_origin_name() {
		return p_origin_name;
	}

	public void setP_origin_name(String p_origin_name) {
		this.p_origin_name = p_origin_name;
	}

	public Date getP_upload_date() {
		return p_upload_date;
	}

	public void setP_upload_date(Date p_upload_date) {
		this.p_upload_date = p_upload_date;
	}

	public int getP_file_level() {
		return p_file_level;
	}

	public void setP_file_level(int p_file_level) {
		this.p_file_level = p_file_level;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	@Override
	public String toString() {
		return "Product_Image [p_changed_name=" + p_changed_name + ", p_origin_name=" + p_origin_name
				+ ", p_upload_date=" + p_upload_date + ", p_file_level=" + p_file_level + ", p_num=" + p_num + "]";
	}

}
