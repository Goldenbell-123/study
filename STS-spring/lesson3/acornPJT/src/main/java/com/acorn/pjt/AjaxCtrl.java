package com.acorn.pjt;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.model.vo.ChartVO;

@Controller
public class AjaxCtrl {

	@RequestMapping(value="ajaxChart.do")
	public void chartForm(){
		
	}
	
	@RequestMapping(value="ajax.do")
	@ResponseBody
	public List<ChartVO> getJson(){
		List<ChartVO> list = new ArrayList<ChartVO>();

		list.add(new ChartVO(8,12));
		list.add(new ChartVO(4,5.5));
		list.add(new ChartVO(11,14));
		list.add(new ChartVO(4,5));
		list.add(new ChartVO(3,3.5));
		list.add(new ChartVO(6.5,7));
		list.add(new ChartVO(8,7));
		list.add(new ChartVO(8,15));
		list.add(new ChartVO(4,11));
		list.add(new ChartVO(3,1));
		
		return list;
	}
}
