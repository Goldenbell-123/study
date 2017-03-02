package ctrl.util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ctrl.view.ModelAndView;

 

public interface Command {
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException;
	
}