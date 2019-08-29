package com.kh.runLearn.member.model.vo;

import java.sql.Date;

public class Member_Image {
	private int m_num;
	private String m_origin_name;
	private String m_changed_name;
	private String m_file_path;
	private Date m_upload_date;
	private String m_id;
	
	public Member_Image() {}
	public Member_Image(int m_num, String m_origin_name, String m_changed_name, String m_file_path, Date m_upload_date,
			String m_id) {
		super();
		this.m_num = m_num;
		this.m_origin_name = m_origin_name;
		this.m_changed_name = m_changed_name;
		this.m_file_path = m_file_path;
		this.m_upload_date = m_upload_date;
		this.m_id = m_id;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getM_origin_name() {
		return m_origin_name;
	}
	public void setM_origin_name(String m_origin_name) {
		this.m_origin_name = m_origin_name;
	}
	public String getM_changed_name() {
		return m_changed_name;
	}
	public void setM_changed_name(String m_changed_name) {
		this.m_changed_name = m_changed_name;
	}
	public String getM_file_path() {
		return m_file_path;
	}
	public void setM_file_path(String m_file_path) {
		this.m_file_path = m_file_path;
	}
	public Date getM_upload_date() {
		return m_upload_date;
	}
	public void setM_upload_date(Date m_upload_date) {
		this.m_upload_date = m_upload_date;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	@Override
	public String toString() {
		return "MemberImage [m_num=" + m_num + ", m_origin_name=" + m_origin_name + ", m_changed_name=" + m_changed_name
				+ ", m_file_path=" + m_file_path + ", m_upload_date=" + m_upload_date + ", m_id=" + m_id + "]";
	}
	
}
