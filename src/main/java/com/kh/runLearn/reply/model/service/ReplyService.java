package com.kh.runLearn.reply.model.service;

import java.util.ArrayList;
import java.util.Map;

public interface ReplyService {

	ArrayList<Map<String, Object>> selectReplyList(Map<String, Object> map);

	int insertReply(Map<String, Object> map);

	void deleteReply(int r_num);
	
}
