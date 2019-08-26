package com.kh.runLearn.lecture.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("lDAO")
public class LectureDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
