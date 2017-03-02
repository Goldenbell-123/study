package com.acorn.pjt;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.acorn.board.service.BoardService;
import com.acorn.model.vo.AttachVO;
import com.acorn.model.vo.BoardVO;
import com.acorn.model.vo.ReplyVO;

@Controller
@RequestMapping("/board")
public class BoardCtrl {

	@Resource(name="boardService")
	private BoardService service;
	
	@RequestMapping("/listPage.do")
	public String list(Model model){
		System.out.println("listPage");
		List<BoardVO> result= service.list();
		model.addAttribute("list",result);
		return "board/listPage";
	}
	@RequestMapping(value="/register.do",method=RequestMethod.GET)
	public String register(){
		System.out.println("register");
		return "board/register";
	}
	


	
	@RequestMapping(value="/registerPost.do",method=RequestMethod.POST)
	public String registerPost(BoardVO board, HttpServletRequest request){
		System.out.println("registerPost");
		System.out.println("title"+board.getTitle());
		System.out.println("content"+board.getContent());
		System.out.println("writer"+board.getWriter());
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		String savedName;
		int flag=0;
		try {
			
			savedName = uploadFile(board.getFile().getOriginalFilename(),
							board.getFile().getBytes(),uploadPath);
			
			board.setImg(savedName);
			System.out.println("img 등록: "+ board.getImg());
			flag = service.insert(board);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String path = "error_common";
		if(flag !=0){
			path="redirect:/board/listPage.do";
		}
		return path;
	}
	
	public String uploadFile(String originalName,
			byte[] fileData, String uploadPath){
		System.out.println("중복되지 않는 난수를 아이디로 생성해줌");
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString()+"_"+originalName;
		File target = new File(uploadPath,savedName);
		try {
			FileCopyUtils.copy(fileData, target);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return savedName;
	}
	
	@RequestMapping(value="/replyRegister.do",method=RequestMethod.POST)
	public String replyRegister(ReplyVO rboard,Model model){
		System.out.println("registerPost");

		service.replyRegistor(rboard);
		BoardVO boardVO=service.read(rboard.getBno());
		List<ReplyVO> list = service.replyList(rboard.getBno());
		
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("replylist", list);

		return "board/readPage";
	}
	
	@RequestMapping(value="/readPage.do",method=RequestMethod.GET)
	public String readPage(@RequestParam("bno") int bno,Model model){
		System.out.println("페이지 넘버 : "+bno);
		int flag = service.view(bno);
		System.out.println("조회수 :"+flag);
		BoardVO boardVO= service.read(bno);
		List<ReplyVO> list = service.replyList(bno);
		System.out.println("board list : "+list );
		
		model.addAttribute("replylist",list);
		model.addAttribute("boardVO", boardVO);
		return "board/readPage";
	}

	
	@RequestMapping(value="/removePage.do")
	public String readDelete(@RequestParam("bno") int bno){
		System.out.println("페이지 넘버 : "+bno);
		int flag= service.readDelete(bno);
		
		String path = "error_common";
		if(flag !=0){
			path="redirect:/board/listPage.do";
		}
		return path;
	}
	
	@RequestMapping(value="/modifyPage.do",method=RequestMethod.GET)
	public String modifyForm(@RequestParam("bno") int bno,Model model){
		System.out.println("modifyPage 셀렉트");
		System.out.println("페이지 넘버 : "+bno);
		BoardVO boardVO= service.read(bno);

		model.addAttribute("boardVO", boardVO);
		return "board/modifyPage";
	}
	
	@RequestMapping(value="/modifyPage.do",method=RequestMethod.POST)
	public String modify(BoardVO board,Model model){
		System.out.println("modifyPage 업데이트");
		System.out.println("페이지 넘버 : "+board);
		int flag= service.modify(board);
		
		model.addAttribute("boardVO", board);
		return "board/readPage";
	}
	
}
