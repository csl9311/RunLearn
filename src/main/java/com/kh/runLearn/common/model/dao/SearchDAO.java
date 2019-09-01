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
	
	public ArrayList<HashMap<String, String>> selectLecture(Map<String, String> map) {
		return (ArrayList)sqlSession.selectList("lectureMapper.search-selectLecture", map);
	}

	public ArrayList<HashMap<String, String>> selectProduct(Map<String, String> map) {
		return (ArrayList)sqlSession.selectList("productMapper.search-selectProduct", map);
	}
	
}
