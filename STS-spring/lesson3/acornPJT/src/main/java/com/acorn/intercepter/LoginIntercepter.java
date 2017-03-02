package com.acorn.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.HttpRequestHandlerAdapter;

public class LoginIntercepter extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")!=null){
			System.out.println(">>>>>intercepter user keep ");
			response.sendRedirect("/");
			return false;
		}
		return true;
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		ModelMap map = modelAndView.getModelMap();
		Object obj = map.get("userLogin");
		String uri = (String)session.getAttribute("dest");
		
		if(obj!=null){
			System.out.println(">>>>> intercepter login success");
			session.setAttribute("loginUser", obj);
			response.sendRedirect(uri!=null?uri:"/");
		}
	}
	
}
