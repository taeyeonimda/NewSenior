package kr.or.club.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.club.model.dao.ClubDao;
import kr.or.club.model.vo.ChatRecord;
import kr.or.club.model.vo.Club;
import kr.or.club.model.vo.ClubBoard;
import kr.or.club.model.vo.ClubBoardComment;
import kr.or.member.model.vo.Member;

@Service
public class ClubService {
	@Autowired
	private ClubDao dao;
	
	@Transactional
	public int insertClub(Club c) {
		int result = dao.insertClub(c);
		System.out.println(c.getClubNo());
		if(result>0) {
			result = dao.insertClubLeader(c);
		}
		return result;
	}
	public ArrayList<Club> selectAllClub(String keyword) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		ArrayList<Club> list = dao.selectAllClub(map);
		return list;
	}
	public Club selectOneClub(Club club) {
		Club c = dao.selectOneClub(club);
		return c;
	}
	@Transactional
	public int insertChat(ChatRecord cr) {
		int result = dao.insertChat(cr);
		return result;
	}

	public HashMap<String, Object> selectOneClubMap(Club c) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Club club = dao.selectOneClub(c);
		map.put("club", club);
		ArrayList<ClubBoard> blist = dao.selectAllClubBoard(c);
		map.put("board", blist);
		return map;
	}
	@Transactional
	public int insertClubBoard(ClubBoard cb) {
		return dao.insertClubBoard(cb);
	}

	public ArrayList<ChatRecord> getClubChatRecord(String clubNo) {
		return dao.getClubChatRecord(Integer.parseInt(clubNo));
	}
	@Transactional
	public int insertBoardCom(ClubBoardComment cbc) {
		return dao.insertClubBoardCom(cbc);
	}
	public ArrayList<Club> searchClubPopularList(Member m) {
		return dao.searchClubPopularList(m);
	}
	public int getTotalPage() {
		return dao.getTotalPage();
	}
	public ArrayList<Club> searchMyClub(Member m) {
		return dao.searchMyClub(m);
	}
	public int insertClubMember(Member m, Club c) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNo", m.getMemberNo());
		map.put("clubNo", c.getClubNo());
		return dao.insertClubMember(map);
	}

}
