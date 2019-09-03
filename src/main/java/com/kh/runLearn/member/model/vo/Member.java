package com.kh.runLearn.member.model.vo;

import java.sql.Date;

public class Member {
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_nickname;
	private String m_email;
	private String m_phone;
	private Date m_create_date;
	private Date m_modify_date;
	private String m_grade;
	private String m_status;
	private String postnum;
	private String g_address;
	private String r_address;
	private String d_address;

	public Member() {
	}

	public Member(String m_id, String m_pw, String m_name, String m_nickname, String m_email, String m_phone,
			Date m_create_date, Date m_modify_date, String m_grade, String m_status, String postnum, String g_address,
			String r_address, String d_address) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_nickname = m_nickname;
		this.m_email = m_email;
		this.m_phone = m_phone;
		this.m_create_date = m_create_date;
		this.m_modify_date = m_modify_date;
		this.m_grade = m_grade;
		this.m_status = m_status;
		this.postnum = postnum;
		this.g_address = g_address;
		this.r_address = r_address;
		this.d_address = d_address;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public Date getM_create_date() {
		return m_create_date;
	}

	public void setM_create_date(Date m_create_date) {
		this.m_create_date = m_create_date;
	}

	public Date getM_modify_date() {
		return m_modify_date;
	}

	public void setM_modify_date(Date m_modify_date) {
		this.m_modify_date = m_modify_date;
	}

	public String getM_grade() {
		return m_grade;
	}

	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}

	public String getM_status() {
		return m_status;
	}

	public void setM_status(String m_status) {
		this.m_status = m_status;
	}

	public String getPostnum() {
		return postnum;
	}

	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}

	public String getG_address() {
		return g_address;
	}

	public void setG_address(String g_address) {
		this.g_address = g_address;
	}

	public String getR_address() {
		return r_address;
	}

	public void setR_address(String r_address) {
		this.r_address = r_address;
	}

	public String getD_address() {
		return d_address;
	}

	public void setD_address(String d_address) {
		this.d_address = d_address;
	}

	@Override
	public String toString() {
		return "Member [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_nickname=" + m_nickname
				+ ", m_email=" + m_email + ", m_phone=" + m_phone + ", m_create_date=" + m_create_date
				+ ", m_modify_date=" + m_modify_date + ", m_grade=" + m_grade + ", m_status=" + m_status + ", postnum="
				+ postnum + ", g_address=" + g_address + ", r_address=" + r_address + ", d_address=" + d_address + "]";
	}

}
