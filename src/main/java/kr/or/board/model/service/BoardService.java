package kr.or.board.model.service;

import java.util.ArrayList;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.board.model.dao.BoardDao;
import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.BoardComment;
import kr.or.board.model.vo.FileVO;

@Service
public class BoardService {
	@Autowired
	private BoardDao dao;

	public HashMap<String, Object> selectBoardList(int reqPage, String boardType) {
		
		//한 페이지 당 보여줄 게시물 수
		int numPerPage = 10;
		
		//reqPage 1 -> 1~10, reqPage 2- > 11~20
		int end = reqPage * numPerPage;
		int start = end - numPerPage+1;
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("start", start);
		pageMap.put("end", end);
		pageMap.put("boardType", boardType);
		
		ArrayList<Board> list = dao.selectBoardList(pageMap);
		pageMap.put("list", list);
		
		//pageNavi 시작
		//전체 페이지 수 계산 필요 -> 전체 게시물 수 조회
		int totalCount = dao.selectBoardCount();
		//int totalCount = dao.selectBoardCount2(boardType);
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		System.out.println("totalCount : "+totalCount);
		System.out.println("boardType :" +boardType);
		
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
			//pageNavi += "<a href='/boardList.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
			pageNavi += "<a href='/boardList.do?reqPage="+(pageNo-1)+"&boardType="+boardType+"'>[이전]</a>";
			//&boardType="+boardType+"
		}
		
		//페이지 숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				//내가 요청한 페이지 : 페이지 이동할 필요 없음
				pageNavi +="<span>"+pageNo+"<span>";
				//pageNavi +="<span>"+pageNo+"&boardType="+boardType+"<span>";
			}else {
				//내가 요청한 페이지 아닐 때 : 요청한 페이지로 이동
				//pageNavi += "<a href='/boardList.do?reqPage="+(pageNo)+"'>"+pageNo+"</a>";
				pageNavi += "<a href='/boardList.do?reqPage="+(pageNo)+"&boardType="+boardType+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		} //for문 종료
		
		//다음페이지
		if(pageNo<=totalPage) {
			//pageNavi +="<a href='/boardList.do?reqPage="+pageNo+"'>[다음]</a>";
			pageNavi +="<a href='/boardList.do?reqPage="+pageNo+"&boardType="+boardType+"'>[다음]</a>";
		}
		
	
		System.out.println(list);
		System.out.println(pageNavi);
		
		pageMap.put("pageNavi", pageNavi);
		pageMap.put("numPerPage", numPerPage);
		pageMap.put("reqPage", reqPage);
		
		
		return pageMap;
	}
	
	//게시글 상세조회
	public HashMap<String, Object> selectOneBoard(int boardNo) {
		//board 테이블 조회
		 Board b = dao.selectOneBoard(boardNo);

		 //board_file 테이블 조회
		 ArrayList<FileVO> list = dao.selectFileList(boardNo);
		 b.setFileList(list); //board(VO)에 생성자 추가함
		 //fileList를 b에 추가
		 
		 //게시판2 32분
		 //board_comm_comment(댓글) 테이블 조회
		 ArrayList<BoardComment> commentList = dao.selectBoardComment(boardNo);
		 
		 //대댓글 테이블 조회
		 ArrayList<BoardComment> reCommentList = dao.selectBoardRecomment(boardNo);
		 
		 //조회된 결과 hashMap에 넣기 : board(file포함),
		 HashMap<String, Object> pageViewMap = new HashMap<String, Object>();
		 pageViewMap.put("b", b);
		 pageViewMap.put("commentList", commentList);
		 pageViewMap.put("reCommentList", reCommentList);
		 
		return pageViewMap;
	}

	public int insertBoard(Board b) {
		int result = dao.insertBoard(b);
		
		//board insert가 성공한 경우 파일을 insert
	
		if(result>0) {
			int boardNo = dao.selectBoardNo();
			//ㄴ가장 최근에 들어간  boardNo를 조회
			//select max(board_no) from board
			
			//file table insert
			for(FileVO fv : b.getFileList()) {
				fv.setBoardNo(boardNo);
				//fv.setBoardNo(b.getBoardNo());
				//ㄴ갖고 있는 보드 번호 setter로 넣어줌
				result += dao.insertFile(fv);
			}
		}
		return result;
	}

	public int insertComment(BoardComment bc) {
		
		return dao.insertComment(bc);
	}

	public int updateBoardComment(BoardComment bc) {
		return dao.updateBoardComment(bc);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
