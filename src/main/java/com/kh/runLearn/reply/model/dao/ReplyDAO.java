package com.kh.runLearn.reply.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("rDAO")
public class ReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Map<String, Object>> selectReplyList(Map<String, Object> map) {
		return (ArrayList)sqlSession.selectList("replyMapper.selectReplyList", map);
	}

	public int insertReply(Map<String, Object> map) {
		return sqlSession.insert("replyMapper.insertReply", map);
	}

	public void deleteReply(int r_num) {
		sqlSession.update("replyMapper.deleteReply", r_num);
	}
	
	
}
