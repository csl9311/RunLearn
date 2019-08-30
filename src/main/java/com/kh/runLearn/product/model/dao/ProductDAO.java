package com.kh.runLearn.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.product.model.vo.Product;

@Repository("pDAO")
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Product> selectProductList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("productMapper.selectProductList", null, rowBounds);
	}

	public int getListCount(String p_category) {
		return sqlSession.selectOne("productMapper.getListCountCate",p_category);
	}

	public ArrayList<Product> selectProductList(PageInfo pi, String p_category) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("productMapper.selectProductListCate", p_category, rowBounds);
	}

}
