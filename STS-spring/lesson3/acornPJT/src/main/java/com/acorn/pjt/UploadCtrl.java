package com.acorn.pjt;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.acorn.model.vo.BoardVO;

@Controller
public class UploadCtrl {

	@RequestMapping(value="/uploadForm.do",method=RequestMethod.GET)
	public void uploadForm(){
		
	}
	
	@RequestMapping(value="/uploadForm.do",method=RequestMethod.POST)
	public String uploadForm(BoardVO board, HttpServletRequest request, Model model){
		System.out.println(">>>>>>>getWriter :"+board.getWriter());
		System.out.println(">>>>>>>getTitle :"+board.getTitle());
		System.out.println(">>>>>>>getContent :"+board.getContent());
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		
		try {
			
			String savedName= 
					uploadFile(board.getFile().getOriginalFilename(),board.getFile().getBytes(),uploadPath);
			
			board.setImg(savedName);
			model.addAttribute("saveName", savedName);
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "uploadResult";
	}
	
	public String uploadFile(String originalName,
			byte[] fileData, String uploadPath){
		System.out.println("중복되지 않는 난수를 아이디로 생성해줌");
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString()+"_"+originalName;
		File target = new File(uploadPath,savedName);
		try {
			FileCopyUtils.copy(fileData, target);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return savedName;
	}
}
