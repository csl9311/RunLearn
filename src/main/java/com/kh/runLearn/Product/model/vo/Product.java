package com.kh.runLearn.Product.model.vo;

import java.sql.Date;

public class Product {
	private int p_num;
	private String p_name;
	private String p_category;
	private int p_price;
	private int p_stock;
	private String p_status;
	private Date p_reg_date;
	private Date p_modify_date;
	private String m_id;
	
	public Product() {}

	public Product(int p_num, String p_name, String p_category, int p_price, int p_stock, String p_status,
			Date p_reg_date, Date p_modify_date, String m_id) {
		super();
		this.p_num = p_num;
		this.p_name = p_name;
		this.p_category = p_category;
		this.p_price = p_price;
		this.p_stock = p_stock;
		this.p_status = p_status;
		this.p_reg_date = p_reg_date;
		this.p_modify_date = p_modify_date;
		this.m_id = m_id;
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

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}

	public String getP_status() {
		return p_status;
	}

	public void setP_status(String p_status) {
		this.p_status = p_status;
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

	@Override
	public String toString() {
		return "Product [p_num=" + p_num + ", p_name=" + p_name + ", p_category=" + p_category + ", p_price=" + p_price
				+ ", p_stock=" + p_stock + ", p_status=" + p_status + ", p_reg_date=" + p_reg_date + ", p_modify_date="
				+ p_modify_date + ", m_id=" + m_id + "]";
	}
	
}
