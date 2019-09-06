package com.kh.runLearn.product.model.vo;

public class Product_Option {
	private String p_option;
	private int p_optionPrice;
	private int p_stock;
	private int p_num;

	public Product_Option() {
	}

	public Product_Option(String p_option, int p_optionPrice, int p_stock, int p_num) {
		this.p_option = p_option;
		this.p_optionPrice = p_optionPrice;
		this.p_stock = p_stock;
		this.p_num = p_num;
	}

	@Override
	public String toString() {
		return "Product_Option [p_option=" + p_option + ", p_optionPrice=" + p_optionPrice + ", p_stock=" + p_stock
				+ ", p_num=" + p_num + "]";
	}

	public String getP_option() {
		return p_option;
	}

	public void setP_option(String p_option) {
		this.p_option = p_option;
	}

	public int getP_optionPrice() {
		return p_optionPrice;
	}

	public void setP_optionPrice(int p_optionPrice) {
		this.p_optionPrice = p_optionPrice;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

}
