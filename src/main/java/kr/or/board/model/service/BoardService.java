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

	// 페이징처리 , boardList
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
		//int totalCount = dao.selectBoardCount();
		int totalCount = dao.selectBoardCount2(boardType);
		//int totalCount = dao.selectBoardCount3(pageMap);
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		System.out.println("totalCount : "+totalCount);
		System.out.println("boardType :" +boardType);
		
		
		/*
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
		 */
		int pageNaviSize = 5;
		
		//페이지 네비게이션 시작번호 지정
		int pageNo = 1;
		//ㄴ내가 요청한 페이지가 가운데에 오게
		if(reqPage>3) {
			pageNo = reqPage-2;
		}
		
		String pageNavi = "<nav aria-label=\"Page navigation example\">";
		pageNavi += "<ul class='pagination justify-content-center'>";
		if (pageNo != 1) {
			pageNavi += "<li class='page-item disabled'>";
			pageNavi += "<a class='page-link'  tabindex='-1' aria-disabled='true' href='/boardList.do?reqPage=" + (pageNo - 1) +"&boardType="+boardType+ "'>";
			pageNavi += "Previous";
			pageNavi += "</a></li>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li class='page-item' >";
				pageNavi += "<a class='page-link active-page' href='/boardList.do?reqPage=" + pageNo +"&boardType="+boardType+ "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li class='page-item' >";
				pageNavi += "<a class='page-link' href='/boardList.do?reqPage=" + pageNo +"&boardType="+boardType+ "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		// 다음버튼 
		if (pageNo <= totalPage) {
			pageNavi += "<li class='page-item disabled' >";
			pageNavi += "<a class='page-link'  tabindex='-1' aria-disabled='true' href='/boardList.do?reqPage=" + pageNo +"&boardType="+boardType+ "'>";
			pageNavi += "Previous";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul></nav>";
		
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
		 System.out.println("list 조회:"+list);
		 
		 //게시판2 32분
		 //board_comm_comment(댓글) 테이블 조회
		 ArrayList<BoardComment> commentList = dao.selectBoardComment(boardNo);
		 
		 //대댓글 테이블 조회
		 ArrayList<BoardComment> reCommentList = dao.selectBoardRecomment(boardNo);
		 
		 //조회수
		 int readCount = dao.updateReadCount(boardNo);
		 
		 //조회된 결과 hashMap에 넣기 : board(file포함),
		 HashMap<String, Object> pageViewMap = new HashMap<String, Object>();
		 pageViewMap.put("b", b);
		 pageViewMap.put("commentList", commentList);
		 pageViewMap.put("reCommentList", reCommentList);
		 pageViewMap.put("readCount", readCount);
		 
		return pageViewMap;
	}
	// 게시글 작성
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
	
	//게시물 삭제
	public ArrayList<FileVO> boardDelete(int boardNo) {
		//파일 목록  조회해서
		ArrayList<FileVO> fileList = dao.selectFileList(boardNo);
		//boardTBL에서 삭제
		int result = dao.deleteBoard(boardNo);
		if(result>0) {
			return fileList;
		}else {
			return null;
		}
		
	}
	
	//게시물 수정
	public int boardUpdate(Board b, int[] fileNoList) {
		//1.board테이블 수정(제목,내용)
		int result = dao.updateboard(b);
		
		if(result>0) {
			//2.새 첨부파일이 있으면 insert
			for(FileVO fv : b.getFileList()) {
				fv.setBoardNo(b.getBoardNo());
				//ㄴ갖고 있는 board번호 setter로 넣어줌
				result += dao.insertFile(fv);
			}

			//3. 삭제한 파일이 있으면 delete
			if(fileNoList !=null ) {
				for(int fileNo : fileNoList) {
					result += dao.deleteFile(fileNo);
				}
			}
		}
		return result;
	}

	// 댓글 작성
	public int insertComment(BoardComment bc) {
		return dao.insertComment(bc);
	}
	
	//댓글 수정
	public int updateBoardComment(BoardComment bc) {
		return dao.updateBoardComment(bc);
	}
	//댓글삭제
	public int deleteBoardComment(BoardComment bc) {
		return dao.deleteBoardComment(bc);
	}


	//검색 기능 - 페이징처리해주기
	public HashMap<String, Object> selectBoardList(int reqPage, String categoryTag, String searchTag, String searchInput) {
		//한 페이지 당 보여줄 게시물 수
				int numPerPage = 10;
				
				//reqPage 1 -> 1~10, reqPage 2- > 11~20
				int end = reqPage * numPerPage;
				int start = end - numPerPage+1;
				
				HashMap<String, Object> pageMap = new HashMap<String, Object>();
				pageMap.put("start", start);
				pageMap.put("end", end);
				pageMap.put("categoryTag",categoryTag);
				pageMap.put("searchTag",searchTag);
				pageMap.put("searchInput",searchInput);
				
				//pageNavi 시작
				//전체 페이지 수 계산 필요 -> 전체 게시물 수 조회
				int totalCount = dao.selectBoardCountF2(pageMap); // 바꿔주기
				//int totalCount = dao.selectBoardCount2(boardType);
				System.out.println("검색 : "+totalCount);
				int totalPage = 0;
				if(totalCount%numPerPage==0) {
					totalPage = totalCount/numPerPage;
				}else {
					totalPage = totalCount/numPerPage+1;
				}
				int pageNaviSize = 5;
				
				//페이지 네비게이션 시작번호 지정
				int pageNo = 1;
				//ㄴ내가 요청한 페이지가 가운데에 오게
				if(reqPage>3) {
					pageNo = reqPage-2;
				}
				
				String pageNavi = "<nav aria-label=\"Page navigation example\">";
				pageNavi += "<ul class='pagination justify-content-center'>";
				if (pageNo != 1) {
					pageNavi += "<li class='page-item disabled'>";
					pageNavi += "<a class='page-link'  tabindex='-1' aria-disabled='true' href='/searchBoard.do?reqPage=" + (pageNo - 1) +"&searchTag="+searchTag+"&searchInput="+searchInput+"&categoryTag="+categoryTag+ "'>";
					pageNavi += "Previous";
					pageNavi += "</a></li>";
				}
				for (int i = 0; i < pageNaviSize; i++) {
					if (pageNo == reqPage) {
						pageNavi += "<li class='page-item' >";
						pageNavi += "<a class='page-link active-page' href='/searchBoard.do?reqPage=" + pageNo +"&searchTag="+searchTag+"&searchInput="+searchInput+"&categoryTag="+categoryTag+ "'>";
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					} else {
						pageNavi += "<li class='page-item' >";
						pageNavi += "<a class='page-link' href='/searchBoard.do?reqPage=" + pageNo +"&searchTag="+searchTag+"&searchInput="+searchInput+"&categoryTag="+categoryTag+ "'>";
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					}
					pageNo++;
					if (pageNo > totalPage) {
						break;
					}
				}
				// 다음버튼 
				if (pageNo <= totalPage) {
					pageNavi += "<li class='page-item disabled' >";
					pageNavi += "<a class='page-link'  tabindex='-1' aria-disabled='true' href='/searchBoard.do?reqPage=" + pageNo +"&searchTag="+searchTag+"&searchInput="+searchInput+"&categoryTag="+categoryTag+ "'>";
					pageNavi += "Previous";
					pageNavi += "</a></li>";
				}
				pageNavi += "</ul></nav>";
				
				pageMap.put("pageNavi", pageNavi);
				pageMap.put("numPerPage", numPerPage);
				pageMap.put("reqPage", reqPage);
				
				
				ArrayList<Board> list = dao.selectBoardList2(pageMap); // 바꿔주기
				pageMap.put("list", list);
				
				return pageMap;

	}


	public int boardUpdate2(Board b) {
		int result = dao.updateboard2(b);
		return result;
	}







	






	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
