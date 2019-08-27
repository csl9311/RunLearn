package com.kh.runLearn.lecture.model.service;

import java.util.ArrayList;

import com.kh.runLearn.board.model.vo.PageInfo;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.lecture.model.vo.LectureEach;

public interface LectureService {
	ArrayList<Lecture> selectCateList(PageInfo pi); //ī�װ��� ȭ�鿡�� ��������
	
	Lecture selectLecture(int l_num);//���� �ϳ��� ����������
	
	int paymentLecture();//���Ǹ� ����������(�����ʿ�)
	
	LectureEach classEnter(int l_each_num);//������ �� nȭ�� ����������
	
	LectureEach mediaEnter(int l_each_num);//������ �� nȭ ���󺸱⸦ ����������
	
	int permissionLecture(Lecture l);//Ʃ�Ͱ� ���� ��û�� �Ҷ�
	
	int acceptLecture(int l_num);//�����ڰ� ���� ��û�� �㰡 �Ҷ�
	
	int notAcceptLecture(int l_num);//�����ڰ� ���� ��û�� ���� �Ҷ�
	
	int insertLecture(LectureEach le);//Ʃ�Ͱ� ���Ǹ� 1ȭ �߰��Ҷ�
	
	int deleteLecture(LectureEach le);//Ʃ�Ͱ� ���Ǹ� 1ȭ �����Ҷ�
	
	
}
