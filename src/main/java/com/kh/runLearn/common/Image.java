package com.kh.runLearn.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.runLearn.board.model.service.BoardService;
import com.kh.runLearn.board.model.vo.Board_Image;
import com.kh.runLearn.lecture.model.service.LectureService;
import com.kh.runLearn.lecture.model.vo.Lecture_Image;
import com.kh.runLearn.member.model.service.MemberService;
import com.kh.runLearn.member.model.vo.Member_Image;
import com.kh.runLearn.product.model.service.ProductService;
import com.kh.runLearn.product.model.vo.Product_Image;

public class Image {
	private BoardService bService;
	private MemberService mService;
	private ProductService pService;
	private LectureService lService;
	
// 파일 저장
	private String saveFile(MultipartFile file, HttpServletRequest request, String path) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\" + path;
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String originalFileName = file.getOriginalFilename();
		String renameFileName = 
				sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." +
				originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath)); // 전달 받은 file이 rename 명으로 저장
		} catch (IOException e) {
			e.printStackTrace();
		}
		return renameFileName;
	}
	
// 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request, String path) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\" + path;
		File file = new File(savePath + "\\" + fileName);
		
		if(file.exists()) {
			file.delete();
		}
	}
	public boolean createImage(
			MultipartFile uploadFile,
			HttpServletRequest request,
			Object obj
		) {
		int result = 0;
		if (uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = "";
			
			if(obj.getClass() == Board_Image.class) {
				renameFileName = saveFile(uploadFile, request, "board");
				if (renameFileName != null) {
					// Board_Image
					Board_Image bi = new Board_Image();
					bi.setB_origin_name(uploadFile.getOriginalFilename());
					bi.setB_changed_name(renameFileName);
					result = bService.insertBoard_Image(bi);
				}
					
			} else if (obj.getClass() == Member_Image.class){
				renameFileName = saveFile(uploadFile, request, "member");
				if (renameFileName != null) {
					// Member_Image
					Member_Image mi = new Member_Image();
					mi.setM_origin_name(uploadFile.getOriginalFilename());
					mi.setM_changed_name(renameFileName);
					result = mService.insertMember_Image(mi);
				}
				
			} else if (obj.getClass() == Product_Image.class) {
				renameFileName = saveFile(uploadFile, request, "product");
				if (renameFileName != null) {
					// Product_Image
					Product_Image pi = new Product_Image();
					pi.setP_origin_name(uploadFile.getOriginalFilename());
					pi.setP_changed_name(renameFileName);
					result = pService.insertProduct_Image(pi);
				}
				
			} else if(obj.getClass() == Lecture_Image.class) {
				renameFileName = saveFile(uploadFile, request, "lecture");
				if (renameFileName != null) {
					// Lecture_Image
					Lecture_Image li = new Lecture_Image();
					li.setL_origin_name(uploadFile.getOriginalFilename());
					li.setL_changed_name(renameFileName);
					result = lService.insertLecture_Image(li);
				}
			}
		}
		
		if(result > 0) {
			return true;
		} else {
			return false;
		}
	}
/*	해보고 안되면 주석 풀자
// Board_Image 등록
	public boolean Board_ImageInsert(
			MultipartFile uploadFile,
			HttpServletRequest request,
			Board_Image bi
		) {
		
		if (uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request, "board");
			
			if (renameFileName != null) {
				bi.setB_origin_name(uploadFile.getOriginalFilename());
				bi.setB_changed_name(renameFileName);
			}
		}
		int result = bService.insertBoard_Image(bi);
		
		if(result > 0) {
			return true;
		} else {
			return false;
		}
	}
// Member_Image 등록
	public boolean Member_ImageInsert(
			MultipartFile uploadFile,
			HttpServletRequest request,
			Member_Image mi
		) {
		
		if (uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request, "member");
			if (renameFileName != null) {
				mi.setM_origin_name(uploadFile.getOriginalFilename());
				mi.setM_changed_name(renameFileName);
			}
		}
		int result = mService.insertMember_Image(mi);
		
		if(result > 0) {
			return true;
		} else {
			return false;
		}
	}
	
// Product_Image 등록
	public boolean Product_ImageInsert(
			MultipartFile uploadFile,
			HttpServletRequest request,
			Product_Image pi
		) {
		
		if (uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request, "product");
			if (renameFileName != null) {
				pi.setP_origin_name(uploadFile.getOriginalFilename());
				pi.setP_changed_name(renameFileName);
			}
		}
		int result = pService.insertProduct_Image(pi);
		
		if(result > 0) {
			return true;
		} else {
			return false;
		}
	}
// Lecture_Image 등록
	public boolean Lecture_ImageInsert(
			MultipartFile uploadFile,
			HttpServletRequest request,
			Lecture_Image li
		) {
		
		if (uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request, "lecture");
			if (renameFileName != null) {
				li.setL_origin_name(uploadFile.getOriginalFilename());
				li.setL_changed_name(renameFileName);
			}
		}
		int result = lService.insertLecture_Image(li);
		
		if(result > 0) {
			return true;
		} else {
			return false;
		}
	}
*/
}
