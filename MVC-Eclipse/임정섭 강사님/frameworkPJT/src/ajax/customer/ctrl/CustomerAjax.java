package ajax.customer.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import ajax.customer.service.CustomerServiceImpl;
import ajax.customer.vo.CustomerVO;

/**
 * Servlet implementation class CustomerCtrl
 */
@WebServlet("/cusbbs.ajax")
public class CustomerAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerServiceImpl service;
	public CustomerAjax(){
		service = new CustomerServiceImpl();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("CustomerAjax 접속...");
		
		
		ArrayList<CustomerVO> objary = service.cusList();
		
		System.out.println("Arraylist 접속완료...");
		JSONArray jAry = new JSONArray(objary);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jAry);
		
	}

}
