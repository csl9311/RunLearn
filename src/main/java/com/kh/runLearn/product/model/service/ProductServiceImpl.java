package com.kh.runLearn.product.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.product.model.dao.ProductDAO;

@Service("pService")
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDAO pDAO;
}
