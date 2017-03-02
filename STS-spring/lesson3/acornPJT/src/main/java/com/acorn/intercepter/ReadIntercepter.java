package com.acorn.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ReadIntercepter extends HandlerInterceptorAdapter{

	private void saveDest(HttpServletRequest request){
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		if(query == null || query.contains("null")){
			query = "";
		}else{
			query = "?" + query;
		}
		if(request.getMethod().equals("GET")){
			System.out.println("dest : "+(uri + query));
			request.getSession().setAttribute("dest", uri+query);
		}else{
			System.out.println("post dest : "+uri);
			request.getSession().setAttribute("dest", uri);
		
			
		}
				
	}
	
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")==null){
			System.out.println(">>>>>intercepter user is not login ");
			saveDest(request);
			System.out.println("저장된 페이지"+session.getAttribute("dest"));
			response.sendRedirect("/user/login.do");
			return false;
		}
		return true;
	}
}
