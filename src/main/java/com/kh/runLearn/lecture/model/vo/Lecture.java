package com.kh.runLearn.lecture.model.vo;

public class Lecture {
	private int l_num;
	private String l_category;
	private String l_content;
	private int l_price;
	private int l_system;
	private String l_address;
	private String l_object;
	private String l_confirm;
	private String l_status;
	private String l_black;
	private String m_id;

	@Override
	public String toString() {
		return "Lecture [l_num=" + l_num + ", l_category=" + l_category + ", l_content=" + l_content + ", l_price="
				+ l_price + ", l_system=" + l_system + ", l_address=" + l_address + ", l_object=" + l_object
				+ ", l_confirm=" + l_confirm + ", l_status=" + l_status + ", l_black=" + l_black + ", m_id=" + m_id
				+ "]";
	}

	public Lecture() {
	}

	public Lecture(int l_num, String l_category, String l_content, int l_price, int l_system, String l_address,
			String l_object, String l_confirm, String l_status, String l_black, String m_id) {
		super();
		this.l_num = l_num;
		this.l_category = l_category;
		this.l_content = l_content;
		this.l_price = l_price;
		this.l_system = l_system;
		this.l_address = l_address;
		this.l_object = l_object;
		this.l_confirm = l_confirm;
		this.l_status = l_status;
		this.l_black = l_black;
		this.m_id = m_id;
	}

	public int getL_num() {
		return l_num;
	}

	public void setL_num(int l_num) {
		this.l_num = l_num;
	}

	public String getL_category() {
		return l_category;
	}

	public void setL_category(String l_category) {
		this.l_category = l_category;
	}

	public String getL_content() {
		return l_content;
	}

	public void setL_content(String l_content) {
		this.l_content = l_content;
	}

	public int getL_price() {
		return l_price;
	}

	public void setL_price(int l_price) {
		this.l_price = l_price;
	}

	public int getL_system() {
		return l_system;
	}

	public void setL_system(int l_system) {
		this.l_system = l_system;
	}

	public String getL_address() {
		return l_address;
	}

	public void setL_address(String l_address) {
		this.l_address = l_address;
	}

	public String getL_object() {
		return l_object;
	}

	public void setL_object(String l_object) {
		this.l_object = l_object;
	}

	public String getL_confirm() {
		return l_confirm;
	}

	public void setL_confirm(String l_confirm) {
		this.l_confirm = l_confirm;
	}

	public String getL_status() {
		return l_status;
	}

	public void setL_status(String l_status) {
		this.l_status = l_status;
	}

	public String getL_black() {
		return l_black;
	}

	public void setL_black(String l_black) {
		this.l_black = l_black;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

}
