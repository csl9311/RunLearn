package com.kh.runLearn.product.model.vo;

public class ProductOption {
	private String p_option;
	private String p_num;
	
	public ProductOption() {}
	
	public ProductOption(String p_option, String p_num) {
		super();
		this.p_option = p_option;
		this.p_num = p_num;
	}

	public String getP_option() {
		return p_option;
	}

	public void setP_option(String p_option) {
		this.p_option = p_option;
	}

	public String getP_num() {
		return p_num;
	}

	public void setP_num(String p_num) {
		this.p_num = p_num;
	}

	@Override
	public String toString() {
		return "ProductOption [p_option=" + p_option + ", p_num=" + p_num + "]";
	}
}
