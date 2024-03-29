package com.kh.runLearn.payment.model.vo;

import java.sql.Date;

public class Payment {
	private int pay_num;
	private String pay_target;
	private Date pay_date;
	private String pay_method;
	private String pay_return;
	private String m_id;
	
	public Payment() {}

	public Payment(int pay_num, String pay_target, Date pay_date, String pay_method, String pay_return, String m_id) {
		super();
		this.pay_num = pay_num;
		this.pay_target = pay_target;
		this.pay_date = pay_date;
		this.pay_method = pay_method;
		this.pay_return = pay_return;
		this.m_id = m_id;
	}

	public int getPay_num() {
		return pay_num;
	}

	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}

	public String getPay_target() {
		return pay_target;
	}

	public void setPay_target(String pay_target) {
		this.pay_target = pay_target;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public String getPay_return() {
		return pay_return;
	}

	public void setPay_return(String pay_return) {
		this.pay_return = pay_return;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "Payment [pay_num=" + pay_num + ", pay_target=" + pay_target + ", pay_date=" + pay_date + ", pay_method="
				+ pay_method + ", pay_return=" + pay_return + ", m_id=" + m_id + "]";
	}
	
}
