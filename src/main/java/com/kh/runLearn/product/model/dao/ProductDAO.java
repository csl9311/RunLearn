package com.kh.runLearn.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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

	public ArrayList<Map<String, String>> selectProductView(String userId, PageInfo pi) { // 마이 페이지 상품 찜목록
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("productMapper.selectProductView", userId, rowBounds);
	}

	public ArrayList<Product_Image> selectProductImg(int p_num) {
		return (ArrayList) sqlSession.selectList("productMapper.selectProductImg", p_num);
	}

	public int selectPlistCount(String userId) { // 마이페이지 상품 찜목록수
		return sqlSession.selectOne("productMapper.selectPlistCount", userId);
	}

	public ArrayList<Product_Option> selectProductOption(int p_num) {
		return (ArrayList) sqlSession.selectList("productMapper.selectProductOption", p_num);
	}

	// home.jsp에 최신상품 조회
	public ArrayList<Map<String, String>> selectNewProductList() {
		return (ArrayList) sqlSession.selectList("productMapper.selectNewProductList");
	}

	public int insertProduct(HashMap<String, Object> pList) {
		return sqlSession.insert("productMapper.insertProduct", pList);
	}

	public int insertProductThumbnail(Product_Image pi) {
		return sqlSession.insert("productMapper.insertProductThumbnail", pi);
	}

	public int updateProduct(Product p) {
		return sqlSession.update("productMapper.updateProduct", p);
	}

	public int updateProductOption(ArrayList<Object> poList, int p_num) {
		sqlSession.delete("productMapper.deleteProductOption", p_num);
		return sqlSession.insert("productMapper.updateProductOption", poList);
	}

	public int updateThumbnail(Product_Image pi) {
		return sqlSession.update("productMapper.updateThumbnail", pi);
	}

	public int updateDetailImg(ArrayList<Product_Image> piList, int p_num) {
		sqlSession.update("productMapper.deleteDetailImg", p_num);
		return sqlSession.update("productMapper.updateDetailImg", piList);
	}

	public void deleteProduct(int p_num) {
		sqlSession.update("productMapper.deleteProduct", p_num);
	}
}
