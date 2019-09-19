package com.kh.runLearn.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.board.model.service.BoardService;
import com.kh.runLearn.board.model.vo.Board;
import com.kh.runLearn.board.model.vo.Board_Image;
import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.common.Pagination;
import com.kh.runLearn.member.model.vo.Member;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;

	// 고객센터페이지 이동
	@RequestMapping("cCenterView.do")
	public ModelAndView cCenterView(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page,
										@RequestParam("b_category") String b_category, HttpSession session) {

		String m_id = null;
		
		if ((Member)session.getAttribute("loginUser") != null) {
			m_id = ((Member)session.getAttribute("loginUser")).getM_id();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("b_category", b_category);
		map.put("m_id", m_id);
		
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = bService.getCenterListCount(map);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 7);
		map.put("pi", pi);

		ArrayList list = bService.selectCenterBoardList(map);

		mv.addObject("b_category", b_category).addObject("list", list).addObject("pi", pi)
			.setViewName("customerCenter/cCenterMain");

		return mv;
	}

	// 고객센터 게시글 detail 페이지 이동
	@RequestMapping("cCenterDetailView.do")
	public ModelAndView cCenterDetail(ModelAndView mv, @RequestParam("b_category") String b_category,
														@RequestParam("b_num") Integer b_num,
														@RequestParam("page") Integer page) {
		bService.addReadCount(b_num);
		Board b = bService.selectBoard(b_num);
		String b_changed_name = null;
		
		if (b_category.equals("신고글")) {
			b_changed_name = bService.selectBoardImg(b);
		}

		if (b != null) {
			mv.addObject("b", b).addObject("page", page).addObject("b_changed_name", b_changed_name)
				.setViewName("customerCenter/cCenterDetail");
		}

		return mv;
	}

	// 고객센터 게시글 등록페이지 이동
	@RequestMapping("cCenterInsertView.do")
	public ModelAndView cCenterInsertView(ModelAndView mv, @RequestParam("b_category") String b_category, @RequestParam("page") Integer page) {
		mv.addObject("b_category", b_category).addObject("page", page)
			.setViewName("customerCenter/cCenterInsert");
		return mv;
	}

	// 고객센터 게시글 등록
	@RequestMapping(value = "cCenterInsert.do", method = RequestMethod.POST)
	public String cCenterInsert(@ModelAttribute Board b, Model model, @RequestParam(value="uploadFile", required = false) MultipartFile uploadFile, HttpServletRequest request) {
		Board_Image bi = new Board_Image();
		
		int result1 = bService.insertBoard(b);
		
		if (b.getB_category().equals("신고글")) {
			if (!uploadFile.isEmpty()) {
				if (uploadFile != null && !uploadFile.isEmpty()) {
					String renameFileName = saveFile(uploadFile, request);
					
					if (renameFileName != null) {
						bi.setB_origin_name(uploadFile.getOriginalFilename());
						bi.setB_changed_name(renameFileName);
					}
				}
				
				result1 += bService.insertBoard_Image(bi);
			}
		}
		
		if (result1 > 0) {
			model.addAttribute("b_category", b.getB_category());
			return "redirect:cCenterView.do";
		} else {
			return "home";
		}
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images\\board";
		
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." +  originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	

	// 고객센터 게시물 삭제
	@RequestMapping("cCenterDelete.do")
	public String boardDelete(Model model, @RequestParam(value = "b_category", required = false) String b_category,
											@RequestParam("b_num") Integer b_num) {

		int result = bService.deleteBoard(b_num);

		if (result > 0) {
			model.addAttribute("b_category", b_category);
			return "redirect:cCenterView.do";
		} else {
			return "home";
		}
	}

	@RequestMapping("cCenterUpdateView.do")
	public ModelAndView cCenterUpdateView(ModelAndView mv, @RequestParam("b_num") Integer b_num, @RequestParam("page") Integer page) {
		Board b = bService.selectBoard(b_num);
		mv.addObject("b", b).addObject("page", page)
			.setViewName("customerCenter/cCenterUpdate");
		
		return mv;
	}
	
	@RequestMapping(value="cCenterUpdate.do", method = RequestMethod.POST)
	public ModelAndView cCenterUpdate(@ModelAttribute Board b, ModelAndView mv, @RequestParam("page") Integer page) {
		int result = bService.updateBoard(b);
		if (result > 0) {
			mv.addObject("b_category", b.getB_category()).addObject("b_num", b.getB_num()).addObject("page", page)
				.setViewName("redirect:cCenterDetailView.do");
			return mv;
		} else {
			return null;
		}
	}
}
