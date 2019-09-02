package com.kh.runLearn.product.model.service;

import java.util.ArrayList;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.product.model.vo.Product;
import com.kh.runLearn.product.model.vo.Product_Image;

public interface ProductService {
	
	int getListCount(); // 상품 전체 목록 조회
	int getListCount(String p_category);// 상품 카테고리별 목록 조회
	ArrayList<Product> selectProductList(PageInfo pi); // 상품 전체 목록 조회
	ArrayList<Product> selectProductList(PageInfo pi, String p_category); // 상품 카테고리별 목록 조회
	
	ArrayList<Product_Image> selectProductImg(Product p); // 상품이미지
	Product selectProduct(int p_num); // 상품 상세 조회
	
	int insertProduct(Product p); // 상품 등록
	int updateProduct(Product p); // 상품 수정
	int deleteProduct(Product p); // 상품 및 이미지 삭제 (파일 삭제)
	
	int insertCart(Product p); // 장바구니에 추가
	int deleteCart(int p_num); // 장바구니에서 삭제 (진짜 삭제)
	
	int insertProduct_Image(Product_Image pi); // 상품 이미지 등록
	int updateProduct_Image(Product_Image pi); // 상품 이미지 수정

	
}
