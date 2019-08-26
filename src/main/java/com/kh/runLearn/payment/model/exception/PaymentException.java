package com.kh.runLearn.payment.model.exception;

public class PaymentException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	
	public PaymentException() {}
	public PaymentException(String msg) {
		super(msg);
	}
	
}
