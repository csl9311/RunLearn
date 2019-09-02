package com.kh.runLearn.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.runLearn.board.model.service.BoardService;

@Controller
public class BoardController {
	
/*	@Autowired 
	private BoardService bService;*/
	
	/*@RequestMapping("adminBoardInsertView.do")
	public String boardInsert() {
		System.out.println(b);			
		System.out.println(uploadFile);
		//파일을 넣지않은 경우 파일이름은 "" 로 들어감
		//if(!uploadFile.getOriginalFilename().equals("")) {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				//저장할 경로를 지정하는 saveFile()메소드 생성
			String renameFileName = saveFile(uploadFile, request);
				if(renameFileName != null) {
					b.setOriginalFile(uploadFile.getOriginalFilename());
					b.setRenameFile(renameFileName);
				}
				
				
				
		}
			int result = bService.insertBoard(b);
			
			if(result>0) {
		return "redirect:blist.do";
			} else {
				throw new BoardException("게시글 등록에 실패하였습니다");
			}
		
	}
	*/
}
