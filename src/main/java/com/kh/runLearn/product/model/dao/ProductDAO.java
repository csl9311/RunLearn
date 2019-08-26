package com.kh.runLearn.product.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("pDAO")
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
