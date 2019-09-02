package com.kh.runLearn.common.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.product.model.vo.Product;

public interface SearchService {

	int getListCount(Map<String, Object> map);
	
	ArrayList<HashMap<String, String>> selectLecture(Map<String, Object> map);

	ArrayList<HashMap<String, String>> selectProduct(Map<String, Object> map);

}
