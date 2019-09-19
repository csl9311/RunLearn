package com.kh.runLearn.product.model.vo;

public class Cart {
	private int p_num;
	private String m_id;
	private String p_option;
	private int amount;

	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cart(int p_num, String m_id, String p_option, int amount) {
		super();
		this.p_num = p_num;
		this.m_id = m_id;
		this.p_option = p_option;
		this.amount = amount;
	}



	@Override
	public String toString() {
		return "Cart [p_num=" + p_num + ", m_id=" + m_id + ", p_option=" + p_option + ", amount=" + amount + "]";
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

	public String getP_option() {
		return p_option;
	}

	public void setP_option(String p_option) {
		this.p_option = p_option;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

}
