package com.kh.runLearn.product.model.service;

import java.util.ArrayList;

import com.kh.runLearn.payment.model.vo.Payment;
import com.kh.runLearn.product.model.vo.Cart;
import com.kh.runLearn.product.model.vo.Product;
import com.kh.runLearn.product.model.vo.ProductImage;

public interface ProductService {
	
	int insertProduct(Product p); // 상품 등록
	int insertProductImage(ProductImage pi); // 상품 이미지 등록
	int pay(Payment pay); // 결제
	int addCart(Cart c); // 장바구니에 추가

	ArrayList<Product> selectProductList(); // 상품 전체 목록 조회
	ArrayList<Product> selectProductList(String cate); // 상품 카테고리별 목록 조회
	Product selectProduct(int p_id); // 상품 상세 조회
	
	int refund(Payment pay); // 환불 및 결제정보수정
	int updateProduct(Product p); // 상품 수정
	int updateProductImage(ProductImage pi); // 상품 이미지 수정
	
	int deleteProduct(Product p); // 상품 및 이미지 삭제
	int deleteCart(Cart c); // 장바구니에서 삭제
	
}
