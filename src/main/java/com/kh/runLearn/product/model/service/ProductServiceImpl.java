package com.kh.runLearn.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.product.model.dao.ProductDAO;
import com.kh.runLearn.product.model.vo.Product;
import com.kh.runLearn.product.model.vo.Product_Image;
import com.kh.runLearn.product.model.vo.Product_Option;

@Service("pService")
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO pDAO;

	@Override
	public int getListCount() {
		return pDAO.getListCount();
	}

	@Override
	public int getListCount(String p_category) {
		return pDAO.getListCount(p_category);
	}

	@Override
	public ArrayList<Product> selectProductList(PageInfo pi) {
		return pDAO.selectProductList(pi);
	}

	@Override
	public ArrayList<Product> selectProductList(PageInfo pi, String p_category) {
		return pDAO.selectProductList(pi, p_category);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectProduct(int p_num) {
		return pDAO.selectProduct(p_num);
	}

	@Override
	public ArrayList<Product_Option> selectProductOption(int p_num) {
		return pDAO.selectProductOption(p_num);
	}

	@Override
	public int insertProduct(HashMap<String, Object> pList) {
		return pDAO.insertProduct(pList);
	}

	
	// home.jsp에 최신상품 조회
	@Override
	public ArrayList<Map<String, String>> selectNewProductList() {
		return pDAO.selectNewProductList();
	}





}
