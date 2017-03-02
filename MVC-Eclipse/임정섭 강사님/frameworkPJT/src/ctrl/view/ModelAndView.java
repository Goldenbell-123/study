package ctrl.view;

public class ModelAndView {
	private String path;
	private boolean send;
	
	/**
	 * 
	 */
	public ModelAndView() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param path
	 * @param send
	 */
	public ModelAndView(String path, boolean send) {
		super();
		this.path = path;
		this.send = send;
	}
	/**
	 * @return the path
	 */
	public String getPath() {
		return path;
	}
	/**
	 * @param path the path to set
	 */
	public void setPath(String path) {
		this.path = path;
	}
	/**
	 * @return the send
	 */
	public boolean isSend() {
		return send;
	}
	/**
	 * @param send the send to set
	 */
	public void setSend(boolean send) {
		this.send = send;
	}
}
