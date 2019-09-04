package com.kh.runLearn.common.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runLearn.common.PageInfo;

@Repository("sDAO")
public class SearchDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	public int getListCount(Map<String, Object> map) {
		String cate = (String) map.get("cate");
		if (cate.equals("강의")) {
			return sqlSession.selectOne("lectureMapper.search-getListCount", map);
		} else {
			return sqlSession.selectOne("productMapper.search-getListCount", map);
		}
	}
	
	public ArrayList<HashMap<String, String>> selectLecture(Map<String, Object> map) {
		System.out.println("강의pi : " + map.get("pi"));
		
		PageInfo pi = (PageInfo) map.get("pi");
		
		if (pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			return (ArrayList)sqlSession.selectList("lectureMapper.search-selectLecture", map, rowBounds);
		} else {
			return (ArrayList)sqlSession.selectList("lectureMapper.search-selectLecture", map);
		}
	}

	public ArrayList<HashMap<String, String>> selectProduct(Map<String, Object> map) {
		System.out.println("상품pi : " + map.get("pi"));
		
		PageInfo pi = (PageInfo) map.get("pi");
		
		if (pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			return (ArrayList)sqlSession.selectList("productMapper.search-selectProduct", map, rowBounds);
		} else {
			return (ArrayList)sqlSession.selectList("productMapper.search-selectProduct", map);
		}
	}

}
