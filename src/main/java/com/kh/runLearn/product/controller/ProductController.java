package com.kh.runLearn.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.common.Pagination;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.product.model.service.ProductService;
import com.kh.runLearn.product.model.vo.Product;
import com.kh.runLearn.product.model.vo.Product_Image;

@Controller
public class ProductController {

	@Autowired
	private ProductService pService;

	@RequestMapping("getList.product")
	public String getProductList(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "p_category", required = false) String p_category, HttpServletRequest request)
			throws Exception {
		ArrayList<Product> list = null;
		PageInfo pi;
		int listCount;
		int currentPage = 1;
		int boardLimit = 15;
		if (page != null) {
			currentPage = page;
		}
		System.out.println(p_category);
		if (p_category == null) {
			listCount = pService.getListCount();
			pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
			// 상품목록 조회
			list = pService.selectProductList(pi);
		} else {
			listCount = pService.getListCount(p_category);
			pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
			// 카테고리별 상품목록 조회
			list = pService.selectProductList(pi, p_category);
		}
		// request에 페이지정보, list 등록
		if (list != null) {
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}
		return "product/product_main";
	}

	@RequestMapping("get.product")
	public String getProduct(@RequestParam("p_num") int p_num, HttpServletRequest request) {
		Product p = pService.selectProduct(p_num);
		ArrayList<Product_Image> pi = pService.selectProductImg(p_num);

		request.setAttribute("p", p);
		request.setAttribute("pi", pi);

		System.out.println(p);
		System.out.println(pi);
		return "product/product_detail";
	}

	@RequestMapping("upload.product")
	public String uploadPage() {
		return "product/product_upload";
	}

	@RequestMapping("insert.product")
	public void insertProduct(

			@ModelAttribute Product p,
			@RequestParam(value = "pi_thumbnail", required = false) MultipartFile pi_thumbnail,
			HttpSession session

	) {
		System.out.println(p);
//		Member m = (Member)session.getAttribute("loginUser");
//		p.setM_id(m.getM_id());
//		
//		pService.insertProduct(p);
	}

	@RequestMapping("insert.productImg")
	public String uploadProductImages(

			@ModelAttribute Product p,
			@RequestParam(value = "m_id", required = false) String m_id,
			@RequestParam(value = "pi_detail", required = false) MultipartFile pi_detail,
			HttpServletRequest request

	) throws Exception {
		String p_changed_name = "";
		if (pi_detail != null && !pi_detail.isEmpty()) {
			// 저장할 경로를 지정하는 saveFile() 메소드 생성
			p_changed_name = saveFile(pi_detail, request);
		}
		Product_Image pi = new Product_Image();
		if (p_changed_name != null) {
			pi.setP_num(p.getP_num());
			pi.setP_file_level(0);
			pi.setP_origin_name(pi_detail.getOriginalFilename());
			pi.setP_changed_name(p_changed_name);
		}
		int result = pService.insertProduct_Image(pi);

		if (result > 0) {
			return "redirect:blist.do";
		} else {
			throw new Exception("게시글 등록에 실패하였습니다.");
		}

	}

// 파일 업로드
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images\\product";
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath)); // 전달 받은 file이 rename 명으로 저장
		} catch (IOException e) {
			e.printStackTrace();
		}
		return renameFileName;
	}

// 파일 지우기
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		File file = new File(savePath + "\\" + fileName);

		if (file.exists()) {
			file.delete();
		}
	}
}
