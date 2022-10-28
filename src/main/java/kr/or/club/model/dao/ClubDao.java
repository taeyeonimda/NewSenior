package kr.or.club.model.dao;

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
}
