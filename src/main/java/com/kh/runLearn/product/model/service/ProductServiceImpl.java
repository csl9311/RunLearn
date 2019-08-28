package com.kh.runLearn.product.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.product.model.dao.ProductDAO;
import com.kh.runLearn.product.model.vo.Product;
import com.kh.runLearn.product.model.vo.Product_Image;

@Service("pService")
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDAO pDAO;

	@Override
	public ArrayList<Product> selectProductList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Product> selectProductList(String p_category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Product_Image> selectProductImg(Product p) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Product selectProduct(int p_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertProduct(Product p) {
		// TODO Auto-generated method stub
		return 0;
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
	public int insertProductImage(Product_Image pi) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateProductImage(Product_Image pi) {
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

	

}
