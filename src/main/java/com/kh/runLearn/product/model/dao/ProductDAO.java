package com.kh.runLearn.product.model.dao;

import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.product.model.vo.Product;
import com.kh.runLearn.product.model.vo.Product_Image;
import com.kh.runLearn.product.model.vo.Product_Option;

@Repository("pDAO")
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		return sqlSession.selectOne("productMapper.getListCount");
	}

	public int getListCount(String p_category) {
		return sqlSession.selectOne("productMapper.getListCountCate", p_category);
	}

	public ArrayList<Product> selectProductList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("productMapper.selectProductList", null, rowBounds);
	}

	public ArrayList<Product> selectProductList(PageInfo pi, String p_category) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("productMapper.selectProductListCate", p_category, rowBounds);
	}

	public ArrayList<HashMap<String, Object>> selectProduct(int p_num) {
		return (ArrayList) sqlSession.selectList("productMapper.selectProduct", p_num);
	}

	public ArrayList<Product_Option> selectProductOption(int p_num) {
		return (ArrayList) sqlSession.selectList("productMapper.selectProductOption", p_num);
	}

	// home.jsp에 최신상품 조회
	public ArrayList<Map<String, String>> selectNewProductList() {
		return (ArrayList)sqlSession.selectList("productMapper.selectNewProductList");
	}

	public int insertProduct(HashMap<String, Object> pList) {
		return sqlSession.insert("productMapper.insertProduct", pList);
	}

	public int insertProductThumbnail(Product_Image pi) {
		return sqlSession.insert("productMapper.insertProductThumbnail", pi);
	}

	public int insertProductDetail(ArrayList<Product_Image> list) {
		return sqlSession.insert("productMapper.insertProductDetail", list);
	}


//	public int insertProductOption(ArrayList<Product_Option> poList) {
//		return sqlSession.insert("productMapper.insertProductOption", poList);
//	}


}
