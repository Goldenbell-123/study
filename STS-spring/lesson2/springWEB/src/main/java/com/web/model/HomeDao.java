package com.web.model;

import java.util.ArrayList;

public interface HomeDao {
	
	public int insertRow(HomeVO obj);
	public int updateRow(HomeVO obj);
	public int deleteRow(HomeVO obj);
	/////////////////////////////////
	public HomeVO selectRow();
	public ArrayList<HomeVO> selectRow(HomeVO obj);
	
	
}
