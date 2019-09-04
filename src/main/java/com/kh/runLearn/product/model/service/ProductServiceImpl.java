package com.kh.runLearn.product.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.product.model.dao.ProductDAO;
import com.kh.runLearn.product.model.vo.Product;
import com.kh.runLearn.product.model.vo.Product_Image;

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
	public ArrayList<Product_Image> selectProductImg(int p_num) {
		return pDAO.selectProductImg(p_num);
	}

	@Override
	public Product selectProduct(int p_num) {
		return pDAO.selectProduct(p_num);
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
	public int insertProduct_Image(Product_Image pi) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateProduct_Image(Product_Image pi) {
		// TODO Auto-generated method stub
		return 0;
	}

}
