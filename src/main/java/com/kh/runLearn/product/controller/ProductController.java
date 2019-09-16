package com.kh.runLearn.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.runLearn.common.Exception;
import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.common.Pagination;
import com.kh.runLearn.product.model.service.ProductService;
import com.kh.runLearn.product.model.vo.Product;
import com.kh.runLearn.product.model.vo.Product_Image;
import com.kh.runLearn.product.model.vo.Product_Option;

@Controller
public class ProductController {

	@Autowired
	private ProductService pService;
// 상품 목록 조회(카테고리 포함)
	@RequestMapping("getList.product")
	public String getProductList(
		@RequestParam(value = "page", required = false) Integer page,
		@RequestParam(value = "p_category", required = false) String p_category,
		HttpSession session,
		HttpServletRequest request
	)throws Exception {
		ArrayList<Product> list = null;
		PageInfo pi;
		int listCount;
		int currentPage = 1;
		int boardLimit = 15;
		if (page != null) {
			currentPage = page;
		}
		if (p_category == null) {
			listCount = pService.getListCount();
			pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
			// 전체 상품목록 조회
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
	
// 상품정보 조회
	@RequestMapping("select.product")
	public String selectProduct(
			@RequestParam("p_num") int p_num,
			HttpServletRequest request
		) {
		ArrayList<HashMap<String, Object>> list = pService.selectProduct(p_num);
		ArrayList<Product_Option> poList = pService.selectProductOption(p_num);
		
		request.setAttribute("list", list);
		request.setAttribute("poList", poList);

		return "product/product_detail";
	}
// 상품등록페이지로 이동
	@RequestMapping("upload.product")
	public String uploadPage() {
		return "product/product_upload";
	}

// 상품 등록
	@RequestMapping("insert.product")
	public String insertProduct(
			@ModelAttribute Product p,
			@RequestParam(value = "p_option", required = false) String[] p_option,
			@RequestParam(value = "p_optionPrice", required = false) int[] p_optionPrice,
			@RequestParam(value = "p_stock", required = false) int[] p_stock,
			@RequestParam(value = "pi_thumbnail", required = false) MultipartFile pi_thumbnail,
			@RequestParam(value = "pi_detail", required = false) MultipartFile[] pi_detail,
			HttpServletRequest request
	) throws Exception {
		// 상품 정보 map에 등록
		HashMap<String, Object> pMap = new HashMap<>();
		pMap.put("p", p);
		if(p_option != null) {
			ArrayList<Object> poList = new ArrayList<>();
			for(int i = 0; i < p_option.length; i++) {
				Product_Option po = new Product_Option();
				po.setP_option(p_option[i]);
				po.setP_optionPrice(p_optionPrice[i]);
				po.setP_stock(p_stock[i]);
				poList.add(po);
			}
			pMap.put("poList", poList);
		}
		
		// 썸네일 파일 저장 및 map put
		if (pi_thumbnail != null && !pi_thumbnail.isEmpty()) {
			String p_changed_name = saveFile(pi_thumbnail, request, 0);
			if (p_changed_name != null) {
				Product_Image pi = new Product_Image();
				pi.setP_changed_name("0" + p_changed_name);
				pi.setP_origin_name(pi_thumbnail.getOriginalFilename());
				pi.setP_file_level(0);
				pMap.put("pi", pi);
			}
		}
		
		// 상세 이미지 저장 및 map put
		boolean check = pi_detail[0] != null && pi_detail[0].isEmpty();
		if (!check) {
			ArrayList<Product_Image> piList = new ArrayList<>();
			for (int i = 0; i < pi_detail.length; i++) {
				Product_Image pi = null;
				String p_changed_name = saveFile(pi_detail[i], request, i + 1);
				if (p_changed_name != null) {
					pi = new Product_Image();
					pi.setP_changed_name((i+1) + p_changed_name);
					pi.setP_origin_name(pi_detail[i].getOriginalFilename());
					pi.setP_file_level(1);
				}
				piList.add(pi);
			}
			pMap.put("piList", piList);
		}
		
		// DB 저장
		int result = pService.insertProduct(pMap);
		if (result < 0) {
			throw new Exception("상품 등록에 실패했습니다.");
		}
		return "redirect:getList.product";
	}

// 파일 저장
	private String saveFile(
			MultipartFile file,
			HttpServletRequest request,
			int fileNum
		) {
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
		String renamePath = folder + "\\" + String.valueOf(fileNum) + renameFileName;

		try {
			file.transferTo(new File(renamePath)); // 전달 받은 file이 rename 명으로 저장
		} catch (IOException e) {
			e.printStackTrace();
		}
		return renameFileName;
	}

// 파일 지우기
	public void deleteFile(
			String fileName,
			HttpServletRequest request
		) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images\\product";
		File file = new File(savePath + "\\" + fileName);

		if (file.exists()) {
			file.delete();
		}
	}

// 상품 정보 수정
	@RequestMapping("update.product")
	public String updateProduct(@RequestParam("p_num") String p_numStr, HttpServletRequest request) {
		int p_num = Integer.parseInt(p_numStr);
		
		ArrayList<HashMap<String, Object>> list = pService.selectProduct(p_num);
		ArrayList<Product_Option> poList = pService.selectProductOption(p_num);
		
		request.setAttribute("list", list);
		request.setAttribute("poList", poList);
		return "product/product_update";
	}
	
	@RequestMapping("update.productInfo")
	public String updateProductInfo(
			@ModelAttribute Product p,
			@RequestParam(value = "p_option", required = false) String[] p_option,
			@RequestParam(value = "p_optionPrice", required = false) int[] p_optionPrice,
			@RequestParam(value = "p_stock", required = false) int[] p_stock,
			@RequestParam(value = "pi_thumbnail", required = false) MultipartFile pi_thumbnail,
			@RequestParam(value = "pi_detail", required = false) MultipartFile[] pi_detail,
			@RequestParam(value = "thumbnailFileName", required = false) String thumbnailFileName,
			@RequestParam(value = "detailImgFileName", required = false) String[] detailImgFileName,
			HttpServletRequest request
	) throws Exception {
		int result = pService.updateProduct(p);
		if (result > 0) {
		} else {
			throw new Exception("상품정보 수정에 실패했습니다.");
		}
		if (p_option != null) {
			ArrayList<Object> poList = new ArrayList<>();
			for (int i = 0; i < p_option.length; i++) {
				Product_Option po = new Product_Option();
				po.setP_option(p_option[i]);
				po.setP_optionPrice(p_optionPrice[i]);
				po.setP_stock(p_stock[i]);
				po.setP_num(p.getP_num());
				poList.add(po);
				System.out.println(po.getP_num());
			}
			result = pService.updateProductOption(poList, p.getP_num());
			if (result > 0) {
			} else {
				throw new Exception("옵션 수정에 실패했습니다.");
			}
		}
		// 썸네일 파일 저장 및 map put
		if (pi_thumbnail != null && !pi_thumbnail.isEmpty()) {
			deleteFile(thumbnailFileName, request);
			String p_changed_name = saveFile(pi_thumbnail, request, 0);
			if (p_changed_name != null) {
				Product_Image pi = new Product_Image();
				pi.setP_changed_name("0" + p_changed_name);
				pi.setP_origin_name(pi_thumbnail.getOriginalFilename());
				pi.setP_file_level(0);
				pi.setP_num(p.getP_num());
				result = pService.updateThumbnail(pi);
				if (result > 0) {
				} else {
					throw new Exception("썸네일 수정에 실패했습니다.");
				}
			}
		}
		// 상세 이미지 저장 및 map put
		boolean check = pi_detail[0] != null && pi_detail[0].isEmpty();
		if (!check) {
			ArrayList<Product_Image> piList = new ArrayList<>();
			for(int i = 0 ; i < detailImgFileName.length; i ++){
				deleteFile(detailImgFileName[i], request);
			}
			for (int i = 0; i < pi_detail.length; i++) {
				Product_Image pi = null;
				String p_changed_name = saveFile(pi_detail[i], request, i + 1);
				if (p_changed_name != null) {
					pi = new Product_Image();
					pi.setP_changed_name((i + 1) + p_changed_name);
					pi.setP_origin_name(pi_detail[i].getOriginalFilename());
					pi.setP_file_level(1);
					pi.setP_num(p.getP_num());
				}
				piList.add(pi);
			}
			result = pService.updateDetailImg(piList, p.getP_num());
			if (result > 0) {
			} else {
				throw new Exception("상품 상세 이미지 수정에 실패했습니다.");
			}
		}
		return "redirect:getList.product";
	}
}
