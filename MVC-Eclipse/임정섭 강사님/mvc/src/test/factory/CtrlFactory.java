package test.factory;

import java.util.HashMap;

import board.ctrl.BoardListCtrl;
import main.ctrl.MainCtrl;
import shop.ctrl.ShopCartCtrl;
import shop.ctrl.ShopListCtrl;
import test.command.Command;
import test.ctrl.JoinCtrl;
import test.ctrl.JoinFormCtrl;
import test.ctrl.ListCtrl;
import test.ctrl.LoginCtrl;
import test.ctrl.LogoutCtrl;


public class CtrlFactory {
	private static CtrlFactory instance;
	private HashMap<String, Command> map = new HashMap<String, Command>();
	
	private CtrlFactory(){
		map.put("/mvc/list.do", new ListCtrl());
		map.put("/mvc/boardlist.do", new BoardListCtrl());
		map.put("/mvc/main.do", new MainCtrl());
		map.put("/mvc/login.do", new LoginCtrl());
		map.put("/mvc/logout.do", new LogoutCtrl());
		map.put("/mvc/join.do", new JoinCtrl());
		map.put("/mvc/joinform.do", new JoinFormCtrl());
		map.put("/mvc/shoplist.do", new ShopListCtrl());
		map.put("/mvc/shopcart.do", new ShopCartCtrl());
	}
	public Command getBean(String uri){
		return map.get(uri);
	}
	
	public static CtrlFactory getInstance(){
		if(instance==null){
			instance = new CtrlFactory();
		}
		return instance;
	}
}
