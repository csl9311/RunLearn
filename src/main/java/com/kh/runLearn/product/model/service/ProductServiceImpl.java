package com.kh.runLearn.product.model.service;

import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

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

	@Override
	public int insertProductThumbnail(Product_Image pi) {
		return pDAO.insertProductThumbnail(pi);
	}

	@Override
	public int updateProduct(Product p) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteProduct(Product p) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertCart(Product p) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCart(int p_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateProduct_Image(Product_Image pi) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertProductDetail(ArrayList<Product_Image> list) {
		return pDAO.insertProductDetail(list);
	}
	// home.jsp에 최신상품 조회
	@Override
	public ArrayList<Map<String, String>> selectNewProductList() {
		return pDAO.selectNewProductList();
	}
}
