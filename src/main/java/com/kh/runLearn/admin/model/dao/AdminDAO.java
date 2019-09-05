package com.kh.runLearn.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("aDAO")
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

}
