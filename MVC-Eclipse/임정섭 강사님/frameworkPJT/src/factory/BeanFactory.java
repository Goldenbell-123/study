package factory;

import java.util.HashMap;

import board.ctrl.BoardDeleteCtrl;
import board.ctrl.BoardInsertCtrl;
import board.ctrl.BoardReadCtrl;
import board.ctrl.BoardUpdateCtrl;
import board.main.ctrl.BoardFormCtrl;
import board.main.ctrl.BoardListCtrl;
import board.main.ctrl.BoardUpdateFormCtrl;
import board.reply.ctrl.ReplyInsertCtrl;
import ctrl.util.Command;
import main.ctrl.MainCtrl;
import user.ctrl.JoinFormCtrl;
import user.ctrl.LoginCtrl;
import user.ctrl.LogoutCtrl;




public class BeanFactory {
	private static BeanFactory instance;
	private HashMap<String, Command> map = new HashMap<String, Command>();
	
	private BeanFactory(){
		map.put("/frameworkPJT/main.do", new MainCtrl());
		map.put("/frameworkPJT/login.do", new LoginCtrl());
		map.put("/frameworkPJT/logout.do", new LogoutCtrl());
		map.put("/frameworkPJT/join.do", new JoinFormCtrl());
		map.put("/frameworkPJT/boarddelete.do", new BoardDeleteCtrl());
		map.put("/frameworkPJT/boardupdate.do", new BoardUpdateCtrl());
		map.put("/frameworkPJT/boardread.do", new BoardReadCtrl());
		map.put("/frameworkPJT/boardinsert.do", new BoardInsertCtrl());
	//	map.put("/frameworkPJT/boardsearch.do", new BoardSearchCtrl());
		map.put("/frameworkPJT/boardlist.do", new BoardListCtrl());
		map.put("/frameworkPJT/boardform.do", new BoardFormCtrl());
		map.put("/frameworkPJT/boardupdateform.do", new BoardUpdateFormCtrl());
		map.put("/frameworkPJT/replyinsert.do", new ReplyInsertCtrl());

		// map.put("/frameworkPJT/boardform.do", new BoardInsertCtrl());
	}
	
	public Command getBean(String uri){
		return map.get(uri);
	}
	
	public static BeanFactory getInstance(){
		if(instance==null){
			instance = new BeanFactory();
		}
		return instance;
	}
}
