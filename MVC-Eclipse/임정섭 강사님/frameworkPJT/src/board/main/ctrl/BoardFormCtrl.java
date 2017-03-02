package board.main.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ctrl.util.Command;
import ctrl.view.ModelAndView;

public class BoardFormCtrl implements Command{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		System.out.println("boardForm 양식 접속");
		
		
		ModelAndView view = new ModelAndView();
		
			view.setPath("boardForm.jsp");
			view.setSend(true);
		
		return view;
	}

	
}
