package com.kh.runLearn.product.model.vo;

import java.sql.Date;

public class Product {
	private int p_num;
	private String p_name;
	private String p_category;
	private String p_status;
	private String p_content;
	private Date p_reg_date;
	private Date p_modify_date;
	private String m_id;

	public Product() {
	}

	public Product(int p_num, String p_name, String p_category, String p_status, String p_content, Date p_reg_date,
			Date p_modify_date, String m_id) {
		super();
		this.p_num = p_num;
		this.p_name = p_name;
		this.p_category = p_category;
		this.p_status = p_status;
		this.p_content = p_content;
		this.p_reg_date = p_reg_date;
		this.p_modify_date = p_modify_date;
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "Product [p_num=" + p_num + ", p_name=" + p_name + ", p_category=" + p_category + ", p_status="
				+ p_status + ", p_content=" + p_content + ", p_reg_date=" + p_reg_date + ", p_modify_date="
				+ p_modify_date + ", m_id=" + m_id + "]";
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_category() {
		return p_category;
	}

	public void setP_category(String p_category) {
		this.p_category = p_category;
	}

	public String getP_status() {
		return p_status;
	}

	public void setP_status(String p_status) {
		this.p_status = p_status;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public Date getP_reg_date() {
		return p_reg_date;
	}

	public void setP_reg_date(Date p_reg_date) {
		this.p_reg_date = p_reg_date;
	}

	public Date getP_modify_date() {
		return p_modify_date;
	}

	public void setP_modify_date(Date p_modify_date) {
		this.p_modify_date = p_modify_date;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

}
