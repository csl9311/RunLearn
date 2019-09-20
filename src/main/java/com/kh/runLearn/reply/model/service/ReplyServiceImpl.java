package com.kh.runLearn.reply.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.reply.model.dao.ReplyDAO;

@Service("rService")
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	ReplyDAO rDAO;

	@Override
	public ArrayList<Map<String, Object>> selectReplyList(Map<String, Object> map) {
		return rDAO.selectReplyList(map);
	}

	@Override
	public int insertReply(Map<String, Object> map) {
		return rDAO.insertReply(map);
	}

	@Override
	public void deleteReply(int r_num) {
		rDAO.deleteReply(r_num);
	}
	
}
