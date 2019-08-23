package com.kh.runLearn.payment.model.vo;

public class ProductPay {
	private int pay_num;
	private int p_num;
	private int p_pay_amount;
	
	public ProductPay() {}

	public ProductPay(int pay_num, int p_num, int p_pay_amount) {
		super();
		this.pay_num = pay_num;
		this.p_num = p_num;
		this.p_pay_amount = p_pay_amount;
	}

	public int getPay_num() {
		return pay_num;
	}

	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getP_pay_amount() {
		return p_pay_amount;
	}

	public void setP_pay_amount(int p_pay_amount) {
		this.p_pay_amount = p_pay_amount;
	}

	@Override
	public String toString() {
		return "ProductPay [pay_num=" + pay_num + ", p_num=" + p_num + ", p_pay_amount=" + p_pay_amount + "]";
	}
	
}
