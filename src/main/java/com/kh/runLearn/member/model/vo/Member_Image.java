package com.kh.runLearn.member.model.vo;

import java.sql.Date;

public class Member_Image {
	private String m_origin_name;
	private String m_changed_name;
	private Date m_upload_date;
	private String m_id;
	
	public Member_Image() {}
	public Member_Image(String m_origin_name, String m_changed_name, Date m_upload_date,
			String m_id) {
		super();
		this.m_origin_name = m_origin_name;
		this.m_changed_name = m_changed_name;
		this.m_upload_date = m_upload_date;
		this.m_id = m_id;
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
		return "MemberImage [m_origin_name=" + m_origin_name + ", m_changed_name=" + m_changed_name
				+  ", m_upload_date=" + m_upload_date + ", m_id=" + m_id + "]";
	}
	
}
