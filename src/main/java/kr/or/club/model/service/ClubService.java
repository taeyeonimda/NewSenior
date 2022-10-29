package kr.or.club.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.club.model.dao.ClubDao;
import kr.or.club.model.vo.ChatRecord;
import kr.or.club.model.vo.Club;

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
		System.out.println(cr);
		int result = dao.insertChat(cr);
		return result;
	}
}
