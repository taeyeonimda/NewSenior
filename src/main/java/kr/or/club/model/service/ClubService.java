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
		return dao.insertClub(c);
	}
	public ArrayList<Club> selectAllClub() {
		ArrayList<Club> list = dao.selectAllClub();
		return list;
	}
	public Club selectOneClub(int clubNo) {
		Club c = dao.selectOneClub(clubNo);
		return c;
	}
	@Transactional
	public int insertChat(ChatRecord cr) {
		int result = dao.insertChat(cr);
		return result;
	}

	public HashMap<String, Object> selectOneClubMap(int clubNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Club c = dao.selectOneClub(clubNo);
		map.put("club", c);
		ArrayList<ClubBoard> blist = dao.selectAllClubBoard(clubNo);
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
	public ArrayList<Club> searchClubList(Member m) {
		return dao.searchCLubList(m);
	}
	public int getTotalPage() {
		return dao.getTotalPage();
	}

}
