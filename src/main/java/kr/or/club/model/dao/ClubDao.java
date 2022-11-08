package kr.or.club.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.club.model.vo.ChatRecord;
import kr.or.club.model.vo.Club;
import kr.or.club.model.vo.ClubBoard;
import kr.or.club.model.vo.ClubBoardComment;
import kr.or.member.model.vo.Member;

@Repository
public class ClubDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertClub(Club c) {
		return sqlSession.insert("club.insertClub", c);
	}

	public ArrayList<Club> selectAllClub(HashMap<String, String> map) {
		List list = sqlSession.selectList("club.selectAllClub", map);
		return (ArrayList<Club>)list;
	}

	public Club selectOneClub(Club c) {
		Club club = sqlSession.selectOne("club.selectOneClub", c);
		return club;
	}

	public int insertChat(ChatRecord cr) {
		int result = sqlSession.insert("club.insertChat", cr);
		return result;
	}

	public ArrayList<ClubBoard> selectAllClubBoard(Object clubNo) {
		List list = sqlSession.selectList("club.selectAllClubBoard", clubNo);
		return (ArrayList<ClubBoard>)list;
	}

	public int insertClubBoard(ClubBoard cb) {
		return sqlSession.insert("club.insertClubBoard", cb);
	}

	public ArrayList<ChatRecord> getClubChatRecord(int clubNo) {
		List list = sqlSession.selectList("club.getClubChatRecord", clubNo);
		return (ArrayList<ChatRecord>)list;
	}

	public int insertClubBoardCom(ClubBoardComment cbc) {
		return sqlSession.insert("club.inertClubBoardCom", cbc);
	}

	public ArrayList<Club> searchClubPopularList(Member m) {
		List list = sqlSession.selectList("club.searchClubList", m);
		return (ArrayList<Club>)list;
	}

	public int getTotalPage() {
		return sqlSession.selectOne("club.getTotalPage");
	}

	public ArrayList<Club> searchMyClub(Member m) {
		List list = sqlSession.selectList("club.searchMyClubList", m);
		return (ArrayList<Club>)list;
	}

	public int insertClubMember(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("club.insertClubMember", map);
	}

	public int insertClubMember(Club c) {
		// TODO Auto-generated method stub
		return sqlSession.insert("club.insertClubMember", c);
	}

	public int insertClubLeader(Club c) {
		// TODO Auto-generated method stub
		return  sqlSession.insert("club.insertClubLeader", c);
	}

	public int deleteClubComment(ClubBoardComment cbc) {
		return sqlSession.delete("club.deleteClubComment", cbc);
	}
}
