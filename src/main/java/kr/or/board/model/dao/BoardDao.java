package kr.or.board.model.dao;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.BoardCategoryVO;
import kr.or.board.model.vo.BoardComment;
import kr.or.board.model.vo.FileVO;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Board> selectBoardList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("board.selectBoardList",map);
		System.out.println(list);
		return (ArrayList<Board>) list;
	}
	//전체 게시물 수
	public int selectBoardCount() {
		int totalCount = sqlSession.selectOne("board.totalCount");
		return totalCount;
	}
	
	//실패
	public int selectBoardCount2(String boardType) {
		int totalCount = sqlSession.selectOne("board.totalCount2",boardType);
		return totalCount;	
	}
	
	public int selectBoardCount3(HashMap<String, Object> pageMap) {
		int totalCount = sqlSession.selectOne("board.totalCount3",pageMap);
		return totalCount;	
	}
	
	
	public Board selectOneBoard(int boardNo) {
		return sqlSession.selectOne("board.selectOneBoard",boardNo);
	}
	
	public ArrayList<FileVO> selectFileList(int boardNo) {
		List list = sqlSession.selectList("board.selectFileList",boardNo);
		return (ArrayList<FileVO>) list;
	}
	
	public ArrayList<BoardComment> selectBoardComment(int boardNo) {
		List list = sqlSession.selectList("board.selectComment",boardNo);
		return (ArrayList<BoardComment>) list;
	}
	
	public ArrayList<BoardComment> selectBoardRecomment(int boardNo) {
		List list = sqlSession.selectList("board.selectRecomment",boardNo);
		return (ArrayList<BoardComment>) list;
	}

	public int insertBoard(Board b) {
		return sqlSession.insert("board.insertBoard",b);
	}
	public int selectBoardNo() {
		return sqlSession.selectOne("board.selectBoardNo");
	}
	public int insertFile(FileVO fv) {
		return sqlSession.insert("board.insertFile",fv);
	}
	
	public int deleteFile(int fileNo) {
		return sqlSession.delete("board.deleteFile",fileNo);
	}

	public int updateboard(Board b) {
		return sqlSession.update("board.updateBoard",b);
	}
	
	public int deleteBoard(int boardNo) {
		return sqlSession.delete("board.deleteBoard",boardNo);
	}
	public int insertComment(BoardComment bc) {
		return sqlSession.insert("board.insertComment",bc);
	}
	public int updateBoardComment(BoardComment bc) {
		return sqlSession.update("board.updateBoardComment",bc);
	}
	
	public int deleteBoardComment(BoardComment bc) {
		return sqlSession.delete("board.deleteBoardComment",bc);
	}
	
	//검색기능
	public ArrayList<Board> selectBoardList2(HashMap<String, Object> pageMap) {
		List list = sqlSession.selectList("board.selectBoardList2",pageMap);
		System.out.println(pageMap);
		return (ArrayList<Board>) list;
	}
	//검색된 게시물 개수
	public int selectBoardCountF2(HashMap<String, Object> pageMap) {
		int totalCount = sqlSession.selectOne("board.totalCountF2",pageMap);
		return totalCount;
	}
	public int updateReadCount(int boardNo) {
		int readCount = sqlSession.update("board.readCount",boardNo);
		return readCount;
	}
	public int updateboard2(Board b) {
		return sqlSession.update("board.updateBoard2",b);
	}
	public ArrayList<BoardCategoryVO> selectAllCategroy(String boardType) {
		List list = sqlSession.selectList("board.selectAllCategory",boardType);
		return (ArrayList<BoardCategoryVO>) list;
	}
	public FileVO boardFileDown(int fileNo) {
		
		return sqlSession.selectOne("board.boardFileDown",fileNo);
	}
	public ArrayList<Board> selectBoardList22(HashMap<String, Object> pageMap) {
		List list = sqlSession.selectList("board.selectBoardList22",pageMap);
		System.out.println(pageMap);
		return (ArrayList<Board>) list;
	}
	public int selectBoardCount22(HashMap<String, Object> pageMap) {
		int totalCount = sqlSession.selectOne("board.totalCount22",pageMap);
		return totalCount;
	}
	public int selectBoardCount22(String boardType) {
		int totalCount = sqlSession.selectOne("board.totalCount22",boardType);
		return totalCount;
	}
	public int selectBoardCount222(HashMap<String, Object> pageMap) {
		int totalCount = sqlSession.selectOne("board.totalCount222",pageMap);
		return totalCount;
	}
	public ArrayList<Board> selectBoardList222(HashMap<String, Object> pageMap) {
		List list = sqlSession.selectList("board.selectBoardList222",pageMap);
		System.out.println(pageMap);
		return (ArrayList<Board>) list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
