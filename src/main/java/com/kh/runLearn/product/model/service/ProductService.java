package com.kh.runLearn.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	
	ArrayList<Map<String, String>> selectNewProductList(); // home.jsp에 최신상품 조회
	int updateProduct(Product p);
	int updateProductOption(ArrayList<Object> poList, int p_num);
	int updateThumbnail(Product_Image pi);
	int updateDetailImg(ArrayList<Product_Image> piList, int p_num);
	void deleteProduct(int p_num);
	
}
