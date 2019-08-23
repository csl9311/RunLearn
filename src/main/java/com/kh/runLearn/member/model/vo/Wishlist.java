package com.kh.runLearn.member.model.vo;

public class Wishlist {
	public int l_num;
	public String m_id;
	
	public Wishlist() {}
	public Wishlist(int l_num, String m_id) {
		super();
		this.l_num = l_num;
		this.m_id = m_id;
	}
	public int getL_num() {
		return l_num;
	}
	public void setL_num(int l_num) {
		this.l_num = l_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	@Override
	public String toString() {
		return "Wishlist [l_num=" + l_num + ", m_id=" + m_id + "]";
	}
	
	
}
