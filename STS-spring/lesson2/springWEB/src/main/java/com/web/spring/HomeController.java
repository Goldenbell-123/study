package com.web.spring;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HomeService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	

	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String test() {
		System.out.println("Home Ctrl test .do ");
		
		return "test";
	}
	

	@RequestMapping(value = "/test2.do", method = RequestMethod.GET)
	public ModelAndView test2() {
		System.out.println("Home Ctrl test .do 2");
		
		service.lunch();
		
		ModelAndView view = new ModelAndView();
		view.setViewName("test2");
		view.addObject("gogo", "이렇게 전달할 수 있다.");
		return view;
	}
	
	@RequestMapping(value = "/test3.do", method = RequestMethod.GET)
	public void test3() {
		System.out.println("TEST PAGE3 입니다.");
	}
	
	@RequestMapping(value = "/test4.do", method = RequestMethod.GET)
	public void test4() {
		System.out.println("TEST PAGE4 입니다.");
	}

	
}
