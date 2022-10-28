package kr.or.club.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.club.model.dao.ClubDao;
import kr.or.club.model.vo.Club;

@Service
public class ClubService {
	@Autowired
	private ClubDao dao;

	public int insertClub(Club c) {
		return dao.insertClub(c);
	}
}
