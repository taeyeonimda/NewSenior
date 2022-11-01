package kr.or.board.model.service;

import java.util.ArrayList;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.board.model.dao.BoardDao;
import kr.or.board.model.vo.Board;

@Service
public class BoardService {
	@Autowired
	private BoardDao dao;

	public HashMap<String, Object> selectBoardList(int reqPage) {
		
		//한 페이지 당 보여줄 게시물 수
		int numPerPage = 10;
		
		//reqPage 1 -> 1~10, reqPage 2- > 11~20
		int end = reqPage * numPerPage;
		int start = end - numPerPage+1;
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("start", start);
		pageMap.put("end", end);
		
		ArrayList<Board> list = dao.selectBoardList(pageMap);
		pageMap.put("list", list);
		
		//pageNavi 시작
		//전체 페이지 수 계싼 필요 -> 전체 게시물 수 조회
		int totalCount = dao.selectBoardCount();
		
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		//지정해줘야할 값 : 페이지 네비게이션 길이
		int pageNaviSize = 5;
		
		//페이지 네비게이션 시작번호 지정
		int pageNo = 1;
		//ㄴ내가 요청한 페이지가 가운데에 오게
		if(reqPage>3) {
			pageNo = reqPage-2;
		}
		
		//페이지 네비게이션 시작
		String pageNavi = "";
		
		//이전버튼
		if(pageNo != 1 ) {
			pageNavi += "<a href='/boardList.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
		}
		
		//페이지 숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				//내가 요청한 페이지 : 페이지 이동할 필요 없음
				pageNavi +="<span>"+pageNo+"<span>";
			}else {
				//내가 요청한 페이지 아닐 때 : 요청한 페이지로 이동
				pageNavi += "<a href='/boardList.do?reqPage="+(pageNo)+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		} //for문 종료
		
		//다음페이지
		if(pageNo<=totalPage) {
			pageNavi +="<a href='/boardList.do?reqPage="+pageNo+"'>[다음]</a>";
		}
		
	
		System.out.println(list);
		System.out.println(pageNavi);
		
		pageMap.put("pageNavi", pageNavi);
		pageMap.put("numPerPage", numPerPage);
		pageMap.put("reqPage", reqPage);
		
		return pageMap;
	}

	public HashMap<String, Object> selectOneBoard(int boardNo) {
		//board 테이블 조회
		 Board b = dao.selectOneBoard(boardNo);
		 
		 //file_tbl 조회
		 
		 HashMap<String, Object> pageViewMap = new HashMap<String, Object>();
		 pageViewMap.put("b", b);
		 
		return pageViewMap;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
