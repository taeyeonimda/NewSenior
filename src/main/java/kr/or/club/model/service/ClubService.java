package kr.or.club.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.club.model.dao.ClubDao;
import kr.or.club.model.vo.ChatRecord;
import kr.or.club.model.vo.Club;
import kr.or.club.model.vo.ClubBoard;

@Service
public class ClubService {
	@Autowired
	private ClubDao dao;

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

	public int insertChat(ChatRecord cr) {
		int result = dao.insertChat(cr);
		return result;
	}

	public HashMap<String, List> selectOneClubMap(int clubNo) {
		Club c = dao.selectOneClub(clubNo);
		HashMap<String, List> map = new HashMap<String, List>();
		ArrayList<Club> clist = new ArrayList<Club>();
		clist.add(c);
		map.put("club", clist);
		ArrayList<ClubBoard> blist = dao.selectAllClubBoard(clubNo);
		map.put("board", blist);
		return map;
	}
}
