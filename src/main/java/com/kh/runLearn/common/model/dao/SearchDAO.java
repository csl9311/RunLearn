package com.kh.runLearn.common.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		return (ArrayList)sqlSession.selectList("lectureMapper.search-selectLecture", map);
	}

	public ArrayList<HashMap<String, String>> selectProduct(Map<String, Object> map) {
		System.out.println("상품pi : " + map.get("pi"));
		return (ArrayList)sqlSession.selectList("productMapper.search-selectProduct", map);
	}

}
