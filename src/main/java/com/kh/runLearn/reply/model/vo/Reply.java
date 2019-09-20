package com.kh.runLearn.reply.model.vo;

import java.sql.Date;

public class Reply {
	private int r_num;
	private String m_id;
	private String r_content;
	private Date r_create_date;
	private String r_status;
	private int b_num;
	private int p_num;
	private int l_num;
	private int l_each_num;
	
	public Reply(int r_num, String m_id, String r_content, Date r_create_date, String r_status, int b_num, int p_num,
			int l_num, int l_each_num) {
		super();
		this.r_num = r_num;
		this.m_id = m_id;
		this.r_content = r_content;
		this.r_create_date = r_create_date;
		this.r_status = r_status;
		this.b_num = b_num;
		this.p_num = p_num;
		this.l_num = l_num;
		this.l_each_num = l_each_num;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public Date getR_create_date() {
		return r_create_date;
	}

	public void setR_create_date(Date r_create_date) {
		this.r_create_date = r_create_date;
	}

	public String getR_status() {
		return r_status;
	}

	public void setR_status(String r_status) {
		this.r_status = r_status;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getL_num() {
		return l_num;
	}

	public void setL_num(int l_num) {
		this.l_num = l_num;
	}

	public int getL_each_num() {
		return l_each_num;
	}

	public void setL_each_num(int l_each_num) {
		this.l_each_num = l_each_num;
	}

	@Override
	public String toString() {
		return "Reply [r_num=" + r_num + ", m_id=" + m_id + ", r_content=" + r_content + ", r_create_date="
				+ r_create_date + ", r_status=" + r_status + ", b_num=" + b_num + ", p_num=" + p_num + ", l_num=" + l_num
				+ ", l_each_num=" + l_each_num + "]";
	}
	
}
