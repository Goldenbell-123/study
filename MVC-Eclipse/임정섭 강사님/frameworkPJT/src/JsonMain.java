import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import user.model.vo.UserVO;

public class JsonMain {

	public static void main(String[] args) {
		//jsonObj();
		//jsonAry();
		jsonMap();
	}
	public static void jsonObj(){
		UserVO user = new UserVO("jslim","jslim","임정섭","jslim@sdfsd.com","m","xxx-xxxx-xxxx");
		JSONObject jobj = new JSONObject(user);
		System.out.println(jobj.toString());
	}
	public static void jsonAry(){
		ArrayList<UserVO> list = new ArrayList<UserVO>();
		list.add(new UserVO("jslim","jslim","임정섭","jslim@sdfsd.com","m","xxx-xxxx-xxxx"));
		list.add(new UserVO("jslim","jslim","임정섭","jslim@sdfsd.com","m","xxx-xxxx-xxxx"));
		JSONArray jary = new JSONArray(list);
		System.out.println(jary.toString());
	}
	public static void jsonMap(){
		ArrayList<UserVO> list01 = new ArrayList<UserVO>();
		list01.add(new UserVO("jslim","jslim","임정섭","jslim@sdfsd.com","m","xxx-xxxx-xxxx"));
		list01.add(new UserVO("jslim","jslim","임정섭","jslim@sdfsd.com","m","xxx-xxxx-xxxx"));
		
		ArrayList<UserVO> list02 = new ArrayList<UserVO>();
		list02.add(new UserVO("jslim","jslim","임정섭","jslim@sdfsd.com","m","xxx-xxxx-xxxx"));
		list02.add(new UserVO("jslim","jslim","임정섭","jslim@sdfsd.com","m","xxx-xxxx-xxxx"));
		
		JSONObject jmap = new JSONObject();
		try {
			jmap.put("list01", list01);
			jmap.put("list02", list02);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(jmap.toString());
	}
}
