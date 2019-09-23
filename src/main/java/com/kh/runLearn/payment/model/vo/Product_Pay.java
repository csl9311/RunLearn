package com.kh.runLearn.payment.model.vo;

public class Product_Pay {
	private int pay_num;
	private int p_num;
	private int p_pay_amount;
	private int pay_price;
	private String delivery;
	private String p_option;

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

	public int getPay_price() {
		return pay_price;
	}

	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
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
				+ ", pay_price=" + pay_price + ", delivery=" + delivery + ", p_option=" + p_option + "]";
	}

	public Product_Pay(int pay_num, int p_num, int p_pay_amount, int pay_price, String delivery, String p_option) {
		this.pay_num = pay_num;
		this.p_num = p_num;
		this.p_pay_amount = p_pay_amount;
		this.pay_price = pay_price;
		this.delivery = delivery;
		this.p_option = p_option;
	}

	public Product_Pay() {
	}

}
