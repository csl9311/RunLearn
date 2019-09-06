package com.kh.runLearn.product.model.service;

import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.product.model.vo.Product;
import com.kh.runLearn.product.model.vo.Product_Image;
import com.kh.runLearn.product.model.vo.Product_Option;

public interface ProductService {
	
	int getListCount(); // 상품 전체 목록 조회
	int getListCount(String p_category);// 상품 카테고리별 목록 조회
	ArrayList<Product> selectProductList(PageInfo pi); // 상품 전체 목록 조회
	ArrayList<Product> selectProductList(PageInfo pi, String p_category); // 상품 카테고리별 목록 조회
	
	ArrayList<HashMap<String, Object>> selectProduct(int p_num); // 상품 상세 조회
	ArrayList<Product_Option> selectProductOption(int p_num); // 상품 상세 조회
	
	int insertProduct(HashMap<String, Object> pList); // 상품 등록
	int updateProduct(Product p); // 상품 수정
	int deleteProduct(Product p); // 상품 및 이미지 삭제 (파일 삭제)
	
	int insertCart(Product p); // 장바구니에 추가
	int deleteCart(int p_num); // 장바구니에서 삭제 (진짜 삭제)
	
	int insertProductThumbnail(Product_Image pi); // 상품 이미지 등록
	int updateProduct_Image(Product_Image pi); // 상품 이미지 수정
	
	
	ArrayList<Map<String, String>> selectNewProductList(); // home.jsp에 최신상품 조회

	
	int insertProductDetail(ArrayList<Product_Image> list); // 상품 상세 이미지 등록

	
}
