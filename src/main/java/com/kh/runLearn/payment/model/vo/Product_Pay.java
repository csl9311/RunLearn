package com.kh.runLearn.payment.model.vo;

public class Product_Pay {
	private int pay_num;
	private int p_num;
	private int p_pay_amount;
	private int pay_total;
	private String delivery;
	private String p_option;
	
	public Product_Pay() {}

	public Product_Pay(int pay_num, int p_num, int p_pay_amount, int pay_total, String delivery, String p_option) {
		this.pay_num = pay_num;
		this.p_num = p_num;
		this.p_pay_amount = p_pay_amount;
		this.pay_total = pay_total;
		this.delivery = delivery;
		this.p_option = p_option;
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

	public int getPay_total() {
		return pay_total;
	}

	public void setPay_total(int pay_total) {
		this.pay_total = pay_total;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getP_option() {
		return p_option;
	}

	public void setP_option(String p_option) {
		this.p_option = p_option;
	}

	@Override
	public String toString() {
		return "Product_Pay [pay_num=" + pay_num + ", p_num=" + p_num + ", p_pay_amount=" + p_pay_amount
				+ ", pay_total=" + pay_total + ", delivery=" + delivery + ", p_option=" + p_option + "]";
	}

}
