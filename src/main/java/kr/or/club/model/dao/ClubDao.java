package kr.or.club.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.club.model.vo.Club;

@Repository
public class ClubDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertClub(Club c) {
		return sqlSession.insert("club.insertClub", c);
	}

	public ArrayList<Club> selectAllClub() {
		List list = sqlSession.selectList("club.selectAllClub");
		return (ArrayList<Club>)list;
	}

	public Club selectOneClub(int clubNo) {
		Club c = sqlSession.selectOne("club.selectOneClub", clubNo);
		return c;
	}
}
