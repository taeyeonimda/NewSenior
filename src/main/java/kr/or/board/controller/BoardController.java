package kr.or.board.controller;

import java.util.ArrayList;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.board.model.service.BoardService;
import kr.or.board.model.vo.Board;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;

	@RequestMapping(value="/boardList.do")
	public String boardList(int reqPage,Model model) {
		HashMap<String, Object> pageMap = service.selectBoardList(reqPage);
		System.out.println(pageMap);
		model.addAttribute("list",(ArrayList<Board>)pageMap.get("list"));
		model.addAttribute("pageNavi",(String)pageMap.get("pageNavi"));
		model.addAttribute("reqPage",(int)pageMap.get("reqPage"));
		model.addAttribute("numPerPage",(int)pageMap.get("numPerPage"));
		//reqPage,numPerPage는 글번호와 상관없이 가장 최신글이 1번으로 출력되게 하기 위해서 보내줌
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardView.do")
	public String boardView(int boardNo,Model model) {
		HashMap<String, Object> pageViewMap = service.selectOneBoard(boardNo);
		model.addAttribute("b",(Board)pageViewMap.get("b"));
		return "board/boardView";
	}
	
	@RequestMapping(value="/boardWriteFrm.do")
	public String boardWriteFrm() {
		return "board/boardWriteFrm";
	}
	
	
}

























