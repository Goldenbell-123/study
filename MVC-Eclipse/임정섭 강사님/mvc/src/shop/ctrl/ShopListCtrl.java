package shop.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.command.Command;
import test.view.View;

public class ShopListCtrl implements Command{

	/* (non-Javadoc)
	 * @see test.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public View execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("쇼핑 컨트롤 : ShopListCtrl");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		
		
		if (id != null && pwd != null){
			return new View("shoplist.jsp",false);
		}else{
			return new View("main.do",true);
		}
		
	}

	
}
