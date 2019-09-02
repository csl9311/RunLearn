package com.kh.runLearn.common.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.common.model.dao.SearchDAO;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.product.model.vo.Product;

@Service("sService")
public class SearchServiceImpl implements SearchService {

	@Autowired
	SearchDAO sDAO;
	
	@Override
	public int getListCount(Map<String, Object> map) {
		return sDAO.getListCount(map);
	}
	
	@Override
	public ArrayList<HashMap<String, String>> selectLecture(Map<String, Object> map) {
		return sDAO.selectLecture(map);
	}

	@Override
	public ArrayList<HashMap<String, String>> selectProduct(Map<String, Object> map) {
		return sDAO.selectProduct(map);
	}

}
