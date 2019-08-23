package com.kh.runLearn.Member.model.vo;

public class Cart {
	private int p_num;
	private String m_id;
	private int c_amount;
	public Cart(int p_num, String m_id, int c_amount) {
		super();
		this.p_num = p_num;
		this.m_id = m_id;
		this.c_amount = c_amount;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getC_amount() {
		return c_amount;
	}
	public void setC_amount(int c_amount) {
		this.c_amount = c_amount;
	}
	@Override
	public String toString() {
		return "Cart [p_num=" + p_num + ", m_id=" + m_id + ", c_amount=" + c_amount + "]";
	}
	
}
