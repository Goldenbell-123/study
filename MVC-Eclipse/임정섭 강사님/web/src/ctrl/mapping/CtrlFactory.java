package ctrl.mapping;

import java.util.HashMap;

import ctrl.command.Command;
import user.factory.ctrl.JoinCtrl;
import user.factory.ctrl.JoinFormCtrl;
import user.factory.ctrl.LoginCtrl;

public class CtrlFactory {
	private static CtrlFactory instance;
	private HashMap<String , Command> map = new HashMap<String, Command>();
	private CtrlFactory(){
		map.put("/web/login.do",new LoginCtrl());
		map.put("/web/join.do", new JoinCtrl());
		map.put("/web/joinform.do", new JoinFormCtrl());
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
