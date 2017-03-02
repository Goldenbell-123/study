package com.test.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.model.ProductVO;

@Controller//자동으로 이름이 바인딩 된다. testController로
public class TestController {
	private static final Logger logger = 
			LoggerFactory.getLogger(TestController.class);
	
	@RequestMapping(value="/main.do")
	public String main(){ 
		System.out.println("mainctrl");
		return "main";
	}
	
	
	@RequestMapping("/doE.do")
	public String doE(RedirectAttributes rttr){
		logger.info("doE called but redirect to /doF.....");
		
		rttr.addFlashAttribute("msg", "왜 안되는지 궁금합니다. redirect에요.");
		return "redirect:/msg.do";
	}
	
	
	
	@RequestMapping("/msg.do")//프론트에서 바로 addAttribute("msg","메세지 입력");
	public String msg(@ModelAttribute("msg") String msg){
		logger.info(msg);
		return "result";
	}
	
	
	
	@RequestMapping(value="/model.do")
	public String model(Model model){
		System.out.println("model");
		
		ProductVO product = new ProductVO("Apple phone",800000);
		logger.info("model");
		
		model.addAttribute("product",product);
		return "result";
	}
}

	
