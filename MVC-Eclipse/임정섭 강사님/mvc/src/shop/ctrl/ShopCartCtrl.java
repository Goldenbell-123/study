package shop.ctrl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.command.Command;
import test.view.View;

public class ShopCartCtrl implements Command{

	/* (non-Javadoc)
	 * @see test.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public View execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("장바구니 목록 컨트롤 : ShopCartCtrl");
		String item = request.getParameter("item");
		
		HttpSession session = request.getSession(false);
		ArrayList<String> list = 
				(ArrayList<String>)session.getAttribute("cart");;
		
		if(list==null){
			list =new ArrayList<String>();
		}
		list.add(item);
		
		session.setAttribute("cart", list);
		View view =new View();
		view.setPath("shopCart.jsp");
		view.setSend(true);
		
		return view;
	}

	
}
