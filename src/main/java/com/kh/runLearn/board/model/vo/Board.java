package com.kh.runLearn.board.model.vo;

import java.sql.Date;

public class Board {
	private int b_num;
	private String b_title;
	private String b_content;
	private Date b_reg_date;
	private String b_category;
	private String b_status;
	private int b_count;
	private String m_id;
	private String b_subcategory;
	
	public Board() {}

	public Board(int b_num, String b_title, String b_content, Date b_reg_date, String b_category, String b_status,
			int b_count, String m_id, String b_subcategory) {
		super();
		this.b_num = b_num;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_reg_date = b_reg_date;
		this.b_category = b_category;
		this.b_status = b_status;
		this.b_count = b_count;
		this.m_id = m_id;
		this.b_subcategory = b_subcategory;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public Date getB_reg_date() {
		return b_reg_date;
	}

	public void setB_reg_date(Date b_reg_date) {
		this.b_reg_date = b_reg_date;
	}

	public String getB_category() {
		return b_category;
	}

	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

	public String getB_status() {
		return b_status;
	}

	public void setB_status(String b_status) {
		this.b_status = b_status;
	}

	public int getB_count() {
		return b_count;
	}

	public void setB_count(int b_count) {
		this.b_count = b_count;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	
	public String getB_subcategory() {
		return b_subcategory;
	}

	public void setB_subcategory(String b_subcategory) {
		this.b_subcategory = b_subcategory;
	}

	@Override
	public String toString() {
		return "Board [b_num=" + b_num + ", b_title=" + b_title + ", b_content=" + b_content + ", b_reg_date="
				+ b_reg_date + ", b_category=" + b_category + ", b_status=" + b_status + ", b_count=" + b_count
				+ ", m_id=" + m_id + ", b_subcategory=" + b_subcategory + "]";
	}

}
