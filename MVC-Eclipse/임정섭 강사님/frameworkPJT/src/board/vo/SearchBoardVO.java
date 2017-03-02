package board.vo;

public class SearchBoardVO {
	private String searchmenu;
	private String searchkey;

	public SearchBoardVO() {
		// TODO Auto-generated constructor stub
	}

	public SearchBoardVO(String searchmenu, String searchkey) {
		super();
		this.searchmenu = searchmenu;
		this.searchkey = searchkey;
	}
	public String getSearchmenu() {
		return searchmenu;
	}
	public void setSearchmenu(String searchmenu) {
		this.searchmenu = searchmenu;
	}
	public String getSearchkey() {
		return searchkey;
	}
	public void setSearchkey(String searchkey) {
		this.searchkey = searchkey;
	}
}
