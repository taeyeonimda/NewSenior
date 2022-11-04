package kr.or.board.model.dao;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.board.model.vo.Board;
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
	public int insertComment(BoardComment bc) {
		
		return sqlSession.insert("board.insertComment",bc);
	}
	public int updateBoardComment(BoardComment bc) {
		
		return sqlSession.update("board.updateBoardComment",bc);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
